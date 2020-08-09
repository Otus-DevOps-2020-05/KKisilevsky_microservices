FROM alpine:latest
ENV APP_HOME /app
RUN apk --update add build-base ruby-full ruby-dev \
    && gem install bundler:1.17.2 \
    && mkdir $APP_HOME

WORKDIR $APP_HOME
ADD . .
RUN bundle install && cd / && apk del build-base ruby-dev

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

CMD ["puma"]