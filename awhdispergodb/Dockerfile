FROM couchbase:community-4.5.0
MAINTAINER "kristhian@alliedworld.healthcare"

ARG USERNAME='superman'
ARG PASSWORD='kryptonite'
ARG DB_NAME='awhdispergodb'
ENV USERNAME=$USERNAME
ENV PASSWORD=$PASSWORD
ENV DB_NAME=$DB_NAME

COPY configure-cbserver.sh /opt/couchbase
RUN ["chmod", "+x", "/opt/couchbase/configure-cbserver.sh"]
CMD ["/opt/couchbase/configure-cbserver.sh"]

EXPOSE 8091 8092 8093 11210