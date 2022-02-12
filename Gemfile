# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'bootsnap', '>= 1.2.0', require: false
gem 'mini_magick', '~> 4.8'
gem 'pg', '>= 0.18'
gem 'puma', '~> 4.3'
gem 'rails', '~> 6.0.2.2'

gem 'acts_as_api'
gem 'bcrypt', '~> 3.1.7'
gem 'bcrypt_pbkdf'
gem 'consul'
gem 'ed25519'
gem 'email_validator'
gem 'enumerize'
gem 'jwt'
gem 'kaminari'
gem 'rack-attack'
gem 'rack-cors', require: 'rack/cors'
gem 'ransack'
gem 'redis', '~> 4.0'
gem 'smart_error'
group :development do
  gem 'annotate'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano', '~> 3.9'
  gem 'capistrano-db-tasks', require: false
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-rvm'
  gem 'capistrano3-puma'
end

group :development, :test do
  gem 'bullet'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'letter_opener'
  gem 'pry-rails'
  gem 'rails-erd'
  gem 'rubocop', require: false
end
