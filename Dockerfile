FROM docker.elastic.co/logstash/logstash:5.6.2
USER 0:0

RUN yum update -y && yum install -y gpg2 gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel ruby-devel libxml2 libxml2-devel libxslt libxslt-devel git

# Install Ruby from rvm
RUN command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -

RUN curl -sSL https://get.rvm.io | bash -s stable --ruby

#Enable rvm in current shell
RUN source /usr/local/rvm/scripts/rvm

#Install Bundler
RUN gem install bundler

RUN git clone https://github.com/Oxalide-Team-2/logstash-input-gelf.git
WORKDIR logstash-input-gelf
RUN gem build logstash-input-gelf.gemspec && export PLUGIN=$(pwd) && ls -l
RUN cd /usr/share/logstash && logstash-plugin install $PLUGIN/logstash-input-gelf-3.0.6.gem
COPY logstash.yml /usr/share/logstash/config/logstash.yml
