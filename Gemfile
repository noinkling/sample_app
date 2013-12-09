source 'https://rubygems.org'
ruby '2.0.0'                    # Specified explicitly for Heroku
#ruby-gemset=railstutorial_rails_4_0

gem 'rails', '4.0.1'
gem 'bootstrap-sass', '2.3.2.0' # Bootstrap
gem 'bcrypt-ruby', '3.1.2'      # Password encryption
gem 'pg', '0.15.1'              # PostgreSQL adapter

group :development, :test do
  # gem 'sqlite3', '1.3.8'      # Using PostgreSQL instead
  gem 'rspec-rails', '2.13.1'   # Rspec

  # Guard/Spork stuff
  gem 'guard-rspec', '2.5.0'    # Guard
  gem 'spork-rails', '4.0.0'    # Spork
  gem 'guard-spork', '1.5.0'    # Guard-Spork integration
  gem 'childprocess', '0.3.6'

end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'       # Navigates pages for testing
end

gem 'sass-rails', '4.0.1'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

group :development do
  gem 'quiet_assets'            # Tells log to shut up
end
