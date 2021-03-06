ENV['SINATRA_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

database_config = {
    :development => {
        :adapter => "sqlite3",
        :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
    }
}

set :environment, ENV['SINATRA_ENV'].to_sym
set :database, database_config
require 'sinatra/base'
require 'rack-flash'

require_all 'app'