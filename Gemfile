source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'mysql2', '>= 0.4.4'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'simple_calendar', '~> 2.0'
gem 'faker', '2.11'

group :development, :test do
  gem 'rspec-rails', '~> 4.0.0'
  gem 'rubocop-rails', '~> 2.5', '>= 2.5.2'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '5.2'
  gem 'pry-rails', '0.3.9'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'foreman', '0.87.1'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'database_cleaner', '1.8.4'
  gem 'shoulda-matchers', '4.3.0'
end

group :production do
  gem 'mysql2', '>= 0.4.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
