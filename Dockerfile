# Linux OS
FROM centos:centos7

# Install Java
RUN yum install -y java sysstat

# Create volume for graph data
RUN mkdir /mnt/graphs
VOLUME /mnt/graphs
WORKDIR /mnt/graphs
ENV GRAPH_HOME /mnt/graphs

# Install bigdata bundled (blazegraph) + utils
RUN mkdir -p /opt/blazegraph/utils

RUN curl -L http://downloads.sourceforge.net/project/bigdata/bigdata/1.5.1/bigdata-bundled.jar -o /opt/blazegraph/bigdata-bundled.jar

ADD RWStore.properties /opt/blazegraph/
ADD utils/load-graph.sh /opt/blazegraph/utils/
ADD utils/start-blazegraph.sh /opt/blazegraph/utils/

RUN chmod -R 755 /opt/blazegraph/

# Exec on start
ENTRYPOINT ["/opt/blazegraph/utils/start-blazegraph.sh", "4g"]

# Expose Default Port
EXPOSE 9999

# Maintener
MAINTAINER Maxime Deraspe
