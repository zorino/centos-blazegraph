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
RUN curl -L http://downloads.sourceforge.net/project/bigdata/bigdata/1.5.1/bigdata-bundled.jar -o /opt/bigdata-bundled.jar

# Exec on start
ENTRYPOINT ["java", "-server", "-Xmx4g", "-jar", "/opt/bigdata-bundled.jar"]

# Expose Default Port
EXPOSE 9999

# Maintener
MAINTAINER Maxime Deraspe
