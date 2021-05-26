# frozen_string_literal: true

# route methods for error handling

class ErrorController < ApplicationController
  # error routes

  get '/acct_error' do
    erb :'/error/user_error'
  end

  get '/pass_error' do
    erb :'/error/password_error'
  end

  get '/student_error' do
    erb :'/error/no_student'
  end

  get '/acct_exists' do
    erb :'/error/account_exists'
  end
end
