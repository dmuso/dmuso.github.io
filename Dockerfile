FROM ruby:2
MAINTAINER Dan Harper <dan@kingdomsolutions.com.au>

RUN apt-get -y update
RUN apt-get -y install nodejs

WORKDIR /app
ADD Gemfile /app/
ADD Gemfile.lock /app/
RUN bundle install --jobs 8 --retry 3
ADD . /app/
EXPOSE 80
CMD ruby ./bin/run