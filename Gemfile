source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use this gem for nested forms
# gem 'cocoon'

# Use translit for russian names
gem 'translit'

# Lets make this site SEO friendly
gem 'metamagic' 
gem 'sitemap_generator'

# Nifty gem for placeholder images
gem 'placeholdit'

# For better text formatting
# Fuck ckeditor! Fuck trix!! Lets use bootsy
gem 'bootsy'

# Lets store some environment variables
gem 'figaro'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Jquery turbolinks are required because elsewise javascript won't work after loading a page (only if you refresh this page)
gem 'jquery-turbolinks'


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

#Image uploading
gem 'carrierwave'
gem 'mini_magick'
# Using remotipart for ajax remote file uploads
gem 'remotipart'

# Fonts
gem "font-awesome-rails"
gem 'bootstrap-glyphicons'

# Use HAML for a nice html markup
gem "haml-rails"

# Use Unicorn as the app server
# gem 'unicorn'

# Pagination gem for pagination
gem 'will_paginate'

# Only puma gets us right!
gem 'puma'

# Handle users
gem 'devise'

# Use Capistrano for deployment
group :development do
    gem 'capistrano',         require: false
    gem 'capistrano-rvm',     require: false
    gem 'capistrano-rails',   require: false
    gem 'capistrano-bundler', require: false
    gem 'capistrano3-puma',   require: false
    gem 'capistrano-figaro-yml'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'better_errors'

  # Rspec for testing
  gem 'rspec-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

