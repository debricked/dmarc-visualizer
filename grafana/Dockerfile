FROM grafana/grafana-oss

# Install dashboard and dependencies
ARG DMARC_DASHBOARD=https://raw.githubusercontent.com/domainaware/parsedmarc/master/grafana/Grafana-DMARC_Reports.json
ADD --chown=grafana:root ${DMARC_DASHBOARD} /var/lib/grafana/dashboards/
RUN grafana-cli --pluginsDir "${GF_PATHS_PLUGINS}" plugins install grafana-piechart-panel
RUN grafana-cli --pluginsDir "${GF_PATHS_PLUGINS}" plugins install grafana-worldmap-panel

# Copy provisioning files and fix permissions
COPY --chown=grafana:root provisioning/ /etc/grafana/provisioning/
USER root
RUN chmod -R +X /etc/grafana/provisioning
USER grafana

# Configure Grafana
ENV GF_AUTH_ANONYMOUS_ENABLED=true
