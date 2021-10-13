FROM ruby:2.6.3

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	git \
	curl \
	nodejs

# Install Yarn
RUN apt-get install yarn -y

ENV RAILS_ROOT ./home/

WORKDIR ./home/

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .