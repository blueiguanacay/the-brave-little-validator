FROM golang:latest
WORKDIR /root
ADD  . .
RUN  go build -o main main.go

FROM debian:latest
WORKDIR /root
RUN apt update && apt -y install ca-certificates && rm -r /var/cache/apt
COPY --from=0 /root/ .
CMD ./main
