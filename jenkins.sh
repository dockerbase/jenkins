# Install Jenkins
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
apt-get update
apt-get install -y --no-install-recommends jenkins

mkdir -p /var/jenkins_home && chown -R jenkins /var/jenkins_home
#ADD     build/init.groovy /tmp/WEB-INF/init.groovy
#RUN     cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/init.groovy

# Clean up system
apt-get clean
rm -rf /tmp/* /var/tmp/*
rm -rf /var/lib/apt/lists/*
