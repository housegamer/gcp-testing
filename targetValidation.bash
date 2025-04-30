#!/bin/bash

set -xe

BACKEND=$(gcloud deploy releases create app-${_BACKEND}-release-${SHORT_SHA} --delivery-pipeline test-cd-pipeline --region $LOCATION --images=$_BACKEND=$LOCATION-docker.pkg.dev/$PROJECT_ID/$_ARTIFACT_REPO/$_BACKEND:v.0.1.${SHORT_SHA} --from-k8s-manifest=./kubernetes/app.yaml)
FRONTEND=$(gcloud deploy releases create app-${_FRONTEND}-release-${SHORT_SHA} --delivery-pipeline test-cd-pipeline --region $LOCATION --images=$_FRONTEND=$LOCATION-docker.pkg.dev/$PROJECT_ID/$_ARTIFACT_REPO/$_FRONTEND:v.0.2.${SHORT_SHA} --from-k8s-manifest=./kubernetes/frontend.yaml)

api=[$BACKEND, $FRONTEND]

while [api -eq 0]; do
  if [$BACKEND -eq 1]; then
    kubectl apply -f ./kubernetes/app.yaml --force
    continue
  elif [$FRONTEND -eq 1]; then
    kubectl apply -f ./kubernetes/frontend.yaml --force
  else
    echo 'no errors for k8 manifest'
  fi
done
echo 'creating releases...'

gcloud deploy releases create 'app-${_BACKEND}-release-${SHORT_SHA}' --delivery-pipeline test-cd-pipeline --region $LOCATION --images=$_BACKEND=$LOCATION-docker.pkg.dev/$PROJECT_ID/$_ARTIFACT_REPO/$_BACKEND:v.0.1.${SHORT_SHA} --from-k8s-manifest=./kubernetes/app.yaml
gcloud deploy releases create 'app-${_FRONTEND}-release-${SHORT_SHA}' --delivery-pipeline test-cd-pipeline --region $LOCATION --images=$_FRONTEND=$LOCATION-docker.pkg.dev/$PROJECT_ID/$_ARTIFACT_REPO/$_FRONTEND:v.0.2.${SHORT_SHA} --from-k8s-manifest=./kubernetes/frontend.yaml