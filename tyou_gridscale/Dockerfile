FROM docker.io/ruby:2.4.1

RUN apt-get update && apt-get install -y nodejs mysql-client ruby-docker-api --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV RAILS_VERSION 5.0.5

RUN gem install rails --version "$RAILS_VERSION"

RUN mkdir -m 755 /bacchus
COPY . /bacchus/
RUN rm -rf /bacchus/Dockerfile /bacchus/tmp

RUN cp -p /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN mkdir -m 755 /bacchus/log/operation_logs

WORKDIR /bacchus

RUN bundle update

# RUN rails assets:precompile RAILS_ENV=production RAILS_RELATIVE_URL_ROOT=/app

EXPOSE 3000 1234

CMD ["rails", "server", "-b", "0.0.0.0", "-P", "/tmp/server.pid"]