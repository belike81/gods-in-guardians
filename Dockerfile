# /path/to/app/Dockerfile
FROM ruby:2.4.1-alpine

# Set local timezone
RUN apk add --update tzdata && \
    cp /usr/share/zoneinfo/Europe/London /etc/localtime && \
    echo "Europe/London" > /etc/timezone

# Install your app's runtime dependencies in the container
RUN apk add --update --virtual runtime-deps postgresql-client nodejs libffi-dev readline sqlite

# Bundle into the temp directory
WORKDIR /tmp
ADD Gemfile* ./

RUN apk add --virtual build-deps build-base openssl-dev postgresql-dev libc-dev linux-headers libxml2-dev libxslt-dev readline-dev && \
    bundle install --jobs=2 && \
    apk del build-deps

# Copy the app's code into the container
ENV APP_HOME /app
COPY . $APP_HOME
WORKDIR $APP_HOME

# Configure production environment variables
ENV RAILS_ENV=development \
    RACK_ENV=development

# Expose port 3000 from the container
EXPOSE 3000

# Run puma server by default
CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
