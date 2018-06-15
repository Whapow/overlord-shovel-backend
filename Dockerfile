FROM ruby:2.5.1

ARG UID
RUN adduser rails --uid $UID --disabled-password --gecos ""

ENV APP /usr/src/app
RUN mkdir $APP
WORKDIR $APP

COPY Gemfile* $APP/
RUN bundle install

COPY . $APP/

CMD ["rails", "server", "-p", "3001", "-b", "0.0.0.0"]