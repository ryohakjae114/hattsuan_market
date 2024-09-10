source 'https://rubygems.org'

gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'haml-rails'
gem 'jsbundling-rails'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

group :development, :test do
  gem 'brakeman', require: false
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
end

group :development do
  gem 'haml_lint'
  # deviseの画面をhamlに変換する必要があるので残しておく
  gem 'html2haml'
  gem 'sgcop', github: 'SonicGarden/sgcop', branch: 'main'
  gem 'web-console'
end
