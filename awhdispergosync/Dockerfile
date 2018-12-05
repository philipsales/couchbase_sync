FROM couchbase/sync-gateway:1.5.1-community
RUN mkdir -p /opt/sync_gateway

# Copy the configure script
COPY configure-sync.sh /opt/sync_gateway
COPY sync-gateway-config.json /etc/sync-gateway-config.json
RUN ["chmod", "+x", "/opt/sync_gateway/configure-sync.sh"]
ENTRYPOINT ["/opt/sync_gateway/configure-sync.sh"]
