source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.4'

# Rails
gem 'rails', '~> 8.0.2'
# PostgreSQL database adapter
gem 'pg', '~> 1.5.8'
# Puma app server
gem 'puma', '~> 6.4'
# Password hashing
gem 'bcrypt', '~> 3.1.20'
# JSON web tokens
gem 'jwt', '~> 2.9'
# Reduces boot times through caching
gem 'bootsnap', '~> 1.18', require: false
# Handle Cross-Origin Resource Sharing (CORS)
gem 'rack-cors', '~> 2.0'
# HTTP client
gem 'rest-client', '~> 2.1'
# JSON parsing
gem 'json', '~> 2.7'
# Fake data generation
gem 'faker', '~> 3.4'
# Redis for caching or Action Cable
gem 'redis', '~> 5.3'
# JSON API serialization
gem 'jsonapi-serializer', '~> 2.2'

group :development, :test do
  # Debugger
  gem 'byebug', '~> 11.1', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # File system listener
  gem 'listen', '~> 3.9'
  # Speed up development
  gem 'spring', '~> 4.2'
  gem 'spring-watcher-listen', '~> 2.1'
end

# Windows timezone data
gem 'tzinfo-data', '~> 1.2024', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
