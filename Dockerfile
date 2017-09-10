FROM ruby:2.3.1-onbuild

ENV RAILS_VERSION 4.2.6
RUN gem install rails --version "$RAILS_VERSION"
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && apt-get install -y nodejs

WORKDIR /project