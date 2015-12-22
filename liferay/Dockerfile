# Based on oracle-jdk 1.7 from airdock
FROM airdock/oracle-jdk:1.7

# Install unzip
RUN apt-get update && apt-get install -y unzip

# Download and install liferay
RUN curl -OL http://downloads.sourceforge.net/project/lportal/Liferay%20Portal/6.2.3%20GA4/liferay-portal-tomcat-6.2-ce-ga4-20150416163831865.zip
RUN unzip liferay-portal-tomcat-6.2-ce-ga4-20150416163831865.zip -d /opt
RUN rm liferay-portal-tomcat-6.2-ce-ga4-20150416163831865.zip

RUN ln -s /opt/liferay-portal-6.2-ce-ga4 /opt/liferay-portal
RUN ln -s /opt/liferay-portal/tomcat-7.0.42 /opt/liferay-portal/tomcat

# Add configuration files
ADD resources/portal-ext.properties /opt/liferay-portal/portal-ext.properties
ADD resources/portal-setup-wizard.properties /opt/liferay-portal/portal-setup-wizard.properties
ADD resources/setenv.sh /opt/liferay-portal/tomcat/bin/setenv.sh

# Liferay data will be stored in a separate data volume
VOLUME /opt/liferay-portal/data

# Expose port 8080
EXPOSE 8080

# Set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle/

# Execute liferay
ENTRYPOINT ["/opt/liferay-portal/tomcat/bin/catalina.sh"]
CMD ["run"]
