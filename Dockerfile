# VERSION 1.0
# DOCKER-VERSION  1.2.0
# AUTHOR:         Richard Lee <lifuzu@gmail.com>
# DESCRIPTION:    Ubuntu Image Container

FROM dockerbase/service

MAINTAINER Richad Lee "lifuzu@gmail.com"

ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

# Run the build scripts
RUN	apt-get update

# Information Of Package
ENV	JENKINS_KEY http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key

# Install Jenkins
RUN     wget -q -O - $JENKINS_KEY | sudo apt-key add -
RUN     echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
RUN     apt-get update
RUN     apt-get install -y --no-install-recommends jenkins

RUN     mkdir -p /var/jenkins_home && chown -R jenkins /var/jenkins_home
ADD     build/init.groovy /tmp/WEB-INF/init.groovy
RUN     cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/init.groovy
RUN     mkdir -p /etc/service/jenkins
ADD     build/runit/jenkins /etc/service/jenkins/run

# Clean up system
RUN	apt-get clean
RUN	rm -rf /tmp/* /var/tmp/*
RUN	rm -rf /var/lib/apt/lists/*

#USER    jenkins
# VOLUME /var/jenkins_home - bind this in via -v if you want to make this persistent.
ENV     JENKINS_HOME /var/jenkins_home

# define url prefix for running jenkins behind Apache (https://wiki.jenkins-ci.org/display/JENKINS/Running+Jenkins+behind+Apache)
ENV     JENKINS_PREFIX /

# for main web interface:
EXPOSE  8080 

# will be used by attached slave agents:
EXPOSE  50000 

# Set environment variables.
ENV     HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]

