# Based on oracle-jdk 1.7 from airdock
FROM airdock/oracle-jdk:1.7

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get autoremove -y

# Install unzip
RUN apt-get update && apt-get install -y unzip && apt-get install -y wget

# Download and install liferay
RUN wget https://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.5%20GA6/liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip

RUN unzip liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip -d /opt
RUN rm liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip

RUN mkdir -p /opt
RUN ln -s  /opt/liferay-portal-6.2-ce-ga6 /opt/liferay-portal
RUN ln -s /opt/liferay-portal/tomcat-7.0.62 /opt/liferay-portal/tomcat
RUN ls /opt/liferay-portal/tomcat/bin/catalina.sh -all

# Add configuration files
ADD resources/portal-ext.properties /opt/liferay-portal/portal-ext.properties
ADD resources/portal-setup-wizard.properties /opt/liferay-portal/portal-setup-wizard.properties
ADD resources/setenv.sh /opt/liferay-portal/tomcat/bin/setenv.sh

# Liferay data will be stored in a separate data volume
VOLUME /opt/liferay-portal/data

# Expose port 8080
EXPOSE 8080

# Set JAVA_HOME
ENV JAVA_HOME /srv/java/jdk1.7.0_80/

# Execute liferay
ENTRYPOINT ["/opt/liferay-portal/tomcat/bin/catalina.sh"]
CMD ["run"]
