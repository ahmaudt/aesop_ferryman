# frozen_string_literal: true

ENV['SINATRA_ENV'] ||= 'development'
require 'dotenv'
require 'bundler/setup'

Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller'
require './app/helpers/helpers'
require_all 'app'
