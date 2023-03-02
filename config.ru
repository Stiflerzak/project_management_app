require 'sinatra/base'

class MyApp < Sinatra::Base
  get '/' do
    'Hello world!'
  end
end

run MyApp


require './app/models/project'
require 'active_record'

ActiveRecord::Base.establish_connection(
  YAML.load_file('./config/database.yml')[ENV['RACK_ENV']]
)

