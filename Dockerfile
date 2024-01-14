# Dockerfile
FROM ruby:3.0

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install the project dependencies
RUN apt-get update -qq && apt-get install -y nodejs npm yarn
RUN gem install bundler:2.3.13
RUN bundle install

# Copy the application code into the container
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]