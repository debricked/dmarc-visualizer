FROM python:3.9-alpine3.16

RUN apk add --update --no-cache libxml2-dev libxslt-dev curl
RUN apk add --update --no-cache --virtual .build_deps build-base libffi-dev \
    && pip install msgraph-core==0.2.2 parsedmarc\
    && apk del .build_deps

RUN mkdir -p "/usr/share/GeoIP"
RUN curl -o /usr/share/GeoIP/GeoLite2-Country.mmdb https://git.io/GeoLite2-Country.mmdb

COPY parsedmarc.ini /

