FROM ruby:2.6.4-alpine3.10

RUN apk add --no-cache g++ musl-dev make

RUN apk add openssl openssl-dev ruby-dev

RUN apk add --no-cache libstdc++

RUN gem update --system

RUN gem install bundler

RUN gem install jekyll-watch

RUN gem install jekyll

WORKDIR /usr/src/app

COPY Gemfile ./

RUN bundle install --binstubs

COPY . .

CMD bundle exec jekyll build

CMD bundle exec jekyll serve --trace
