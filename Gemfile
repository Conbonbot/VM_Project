source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
gem 'puma', '~> 4.1'
gem 'sass-rails'
gem 'webpacker', '~> 5.2', '>= 5.2.1'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'image_processing', '~> 1.2'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'rubocop'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'jquery-ui-rails'
gem 'sprockets-rails'
gem 'webpack'

group :development, :test do
  gem 'sqlite3', '~> 1.4', '>= 1.4.2'
  gem 'byebug',  '9.0.6', platform: :mri
end

group :development do
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'minitest', '~> 5.8', '>= 5.8.4'
  gem 'minitest-reporters'
end

group :production do
  gem 'pg', '0.18.4'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
