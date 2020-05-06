FROM grafana/grafana:6.7.3

ADD --chown=grafana:grafana https://raw.githubusercontent.com/domainaware/parsedmarc/master/grafana/Grafana-DMARC_Reports.json /var/lib/grafana/dashboards/
RUN chmod 644 /var/lib/grafana/dashboards/Grafana-DMARC_Reports.json

COPY grafana-provisioning/ /etc/grafana/provisioning/
