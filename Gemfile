source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'


gem 'nokogiri', '~> 1.6.6.2'

gem 'jbuilder', '~> 2.0'

gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'symmetric-encryption', '~> 3.7.2'

gem 'sidekiq'

gem 'sinatra', :require => nil

gem 'unicorn'

gem 'bootstrap-sass', '~> 3.3.4.1'
#
# gem 'bootstrap_form'

gem 'font-awesome-sass'

gem 'clockwork'


# Use Unicorn as the app server
# gem 'unicorn'


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# gem 'bootstrap-tagsinput-rails'

gem 'figaro'
#allows auth via facebook
gem 'omniauth-facebook'
#allows auth via google
gem 'omniauth-google-oauth2'

# gem "rails-bootstrap-helpers"


group :production do
  gem 'rails_12factor'
end


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console

  gem "letter_opener", :group => :development

  gem 'pry-byebug'

  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  gem 'rspec-rails'

  gem 'capybara'

  gem 'factory_girl_rails'

end
