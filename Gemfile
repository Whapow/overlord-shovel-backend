source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# # Use WebPacker
# gem 'webpacker', '~> 3.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.0'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use responders for http requests
gem 'responders', '~> 2.4.0'
# Use Netflix serializers
gem 'fast_jsonapi', '~> 1.2'
# Use Discard for soft delete
gem 'discard', '~> 1.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '~> 5.0'
  gem 'rspec-rails', '~> 3.8'
  gem 'faker', '~> 1.9'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'annotate'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "awesome_print", "~> 1.8"

gem "data_migrate", "~> 6.3"
