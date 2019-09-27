FROM ruby:2.6

RUN gem install github-pages

WORKDIR /usr/src/app

COPY Gemfile ./

#RUN chown -R app:app /usr/src/app

#RUN bundle install --binstubs

COPY . .

#CMD bundle exec jekyll build

#CMD bundle exec jekyll serve --trace

# Build
# docker build -t <tag_name>

# Generate a Gemfile.lock like this
# docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app <tag_name> bundle install

# Generate a new site with: 
# docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app <tag_name> bundle exec jekyll new . --force
