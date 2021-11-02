FROM python:alpine

RUN apk add build-base libxml2-dev libxslt-dev \
    && pip install parsedmarc

COPY parsedmarc.ini /
COPY GeoLite2-Country.mmdb /usr/share/GeoIP/GeoLite2-Country.mmdb
