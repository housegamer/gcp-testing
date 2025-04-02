FROM ubuntu:24.04

RUN mkdir -p /backend
WORKDIR /backend

RUN <<EOF
echo 'we are in backend dir' > test.txt
EOF

RUN echo test.txt
RUN ls -la
