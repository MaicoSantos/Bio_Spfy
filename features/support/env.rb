require 'rspec'
require 'pry'
require 'cucumber'
require 'httparty'
require 'yaml'

ENVIRONMENT = YAML.load_file('./config/environment.yml')
USER_DATA = YAML.load_file('./config/user_data.yml')
