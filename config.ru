# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require 'rack/cors'

run Rails.application

use Rack::Cors do
  
  allow do
    origins ENV['FRONTEND_URL']
    resource '*', 
        :headers => :any, 
        :methods => [:get, :post, :delete, :put, :options]
  end
end