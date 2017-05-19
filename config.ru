# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

if Rails.env == 'production'
  # Since we deploy to a suburl, we need to tell rack to
  # mount our app under that URL too. If depoloying to the
  # root of a domain, remove this branch.
  map '/trvguit' do
    run Rails.application
  end
else
  run Rails.application
end
