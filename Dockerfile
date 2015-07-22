# Linux OS
FROM centos:centos7

# Install Java
RUN yum install -y java

# Create volume for graph data
RUN mkdir /var/graphs
VOLUME /var/graphs
WORKDIR /var/graphs
ENV GRAPH_HOME /var/graphs

# Install bigdata (blazegraph)
RUN mkdir /opt/blazegraph/
RUN curl -L http://downloads.sourceforge.net/project/bigdata/bigdata/1.5.1/bigdata-bundled.jar -o /opt/blazegraph/bigdata-bundled.jar
ADD RWStore.properties /opt/blazegraph/

# Exec on start
ENTRYPOINT ["java", "-server", "-Xmx4g", "-Dbigdata.propertyFile=/opt/blazegraph/RWStore.properties", "-jar", "/opt/blazegraph/bigdata-bundled.jar "]

# Expose Default Port
EXPOSE 9999

# Maintener
MAINTAINER Maxime Deraspe
