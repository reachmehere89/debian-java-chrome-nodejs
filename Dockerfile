FROM debian

RUN apt-get update
RUN apt-get install -y --no-install-recommends \ 
	wget \
	gnupg \
	curl \
	ca-certificates \
	bzip2 \
	git \
	lsof \
	libncurses5 \
	make \
	unzip

#Install Google Chrome
#https://www.google.com/linuxrepositories/
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update
RUN apt-get install -y --no-install-recommends google-chrome-stable

#Install Openjdk 8
RUN sh -c 'echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list.d/backports.list'
RUN apt-get update
RUN apt-get install -y --no-install-recommends -t jessie-backports openjdk-8-jdk-headless

#Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y --no-install-recommends nodejs

#Install bower, gulp, jspm, grunt, protractor
RUN npm install -g bower
RUN npm install -g gulp
RUN npm install -g jspm
RUN npm install -g grunt-cli
RUN npm install -g grunt@0.4.4
RUN npm install -g grunt-shell-spawn@0.3.10
RUN npm install -g grunt-protractor-runner@3.2.0
RUN npm install -g grunt-protractor-webdriver

# Install cloudfoundry-cli
RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -zx
RUN mv cf /usr/local/bin
