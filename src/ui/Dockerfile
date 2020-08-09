FROM alpine:latest
# RUN apt-get update \
#     && apt-get install -y ruby-full ruby-dev build-essential \
#     && gem install bundler --no-ri --no-rdoc build-base #apk add --update alpine-sdk \
ENV APP_HOME /app
RUN apk --update add build-base ruby-full ruby-dev \
    && gem install bundler:1.17.2 \
    && mkdir $APP_HOME
   
WORKDIR $APP_HOME
ADD . .
RUN bundle install && cd / && apk del build-base ruby-dev

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]