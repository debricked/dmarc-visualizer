FROM grafana/grafana:latest

ADD --chown=grafana:root https://raw.githubusercontent.com/domainaware/parsedmarc/master/grafana/Grafana-DMARC_Reports.json /var/lib/grafana/dashboards/
RUN chmod 644 /etc/grafana/provisioning

COPY grafana-provisioning/ /etc/grafana/provisioning/

RUN sed -i 's/fixed_interval/interval/g' /var/lib/grafana/dashboards/Grafana-DMARC_Reports.json
