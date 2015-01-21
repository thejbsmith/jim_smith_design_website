source 'https://rubygems.org'

ruby '2.2.0'

gem 'rails', '4.2.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'

# Database
gem 'pg'

# Webserver
gem 'unicorn'

# Form DSL
gem 'simple_form'

# CSS Frameworks
gem 'bootstrap-sass'

group :doc do
  gem 'sdoc', '~> 0.4.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Load .env file into ENV vars in development
  gem 'dotenv-rails'

  # Rspec Testing Framework
  gem 'rspec-rails', '~> 3.0'

  # Generate Factories for tests
  gem 'factory_girl_rails'
end

group :development do
  # Manage Procfile based application (start rails server similar to Heroku)
  gem 'foreman'
end

group :test do

end

group :production do
  # Set up Rails properly on Heroku as a 12 factor app
  gem 'rails_12factor'
end
