FROM alpine:3.7

COPY bin/echoservice /echoservice

EXPOSE 8080

CMD ["/echoservice"]
