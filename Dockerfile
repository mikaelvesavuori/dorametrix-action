FROM alpine:3.15
RUN apk update && apk upgrade && apk add bash && apk add curl && apk add wget && apk add git
RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && mv jq-linux64 /usr/local/bin/jq && chmod +x /usr/local/bin/jq
COPY deployment.sh /
ENTRYPOINT ["/deployment.sh"]
