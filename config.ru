require 'sinatra'
require 'sinatra/activerecord'

# Load the database configuration from YAML file
db_config = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection(db_config['development'])

# Define your routes and models here
