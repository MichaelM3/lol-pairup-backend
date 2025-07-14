FROM ruby:3.4.4

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . /app
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Expose port 3000
EXPOSE 3000

# Start the Rails server
ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]
