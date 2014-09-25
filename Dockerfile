# VERSION 1.2
# DOCKER-VERSION  1.2.0
# AUTHOR:         Richard Lee <lifuzu@gmail.com>
# DESCRIPTION:    Jenkins Image Container

FROM dockerbase/service

# Run dockerbase script
ADD     jenkins.sh /dockerbase/
RUN     /dockerbase/jenkins.sh

# Add jenkins into runit
ADD     build/runit/jenkins /etc/service/jenkins/run

# for main web interface, port used by attached slave agents:
EXPOSE  8080 50000

