FROM    centos:centos6

# Enable EPEL for Node.js
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# Install Node.js and npm
RUN yum install -y npm

# Bundle app source
COPY /app /app
# Install app dependencies
RUN cd /app; npm install

EXPOSE  3000
CMD ["node", "/app/bin/www"]