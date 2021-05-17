# frozen_string_literal: true

# controller for routes between primary application functions and views
require './config/environment'
require_relative '../helpers/helpers'

class ApplicationController < Sinatra::Base
  configure do
    enable :sessions unless test?
    set :session_secret, ENV["SESSION_SECRET"]
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :welcome
  end
  get '/login' do
    erb :sign_in
  end
  get '/dashboard' do
    erb :dashboard
  end
  post '/login' do # routes login data for verification
    @advisor = Advisor.find_by(uga_myid: params[:uga_myid])
    if @advisor != nil && @advisor.authenticate(params[:password])
      session[:user_id] = @advisor.id
      redirect '/dashboard'
    end
  end
  get '/account/new' do
    erb :create_acct
  end
  post '/account/new' do
    @advisor = Advisor.create(first_name: params[:first_name], last_name: params[:last_name],
                              uga_myid: params[:uga_myid], password: params[:password])
    @advisor.save
    if @advisor.save
      redirect '/login'
    else
      redirect '/pass_error'
    end
  end
  get '/logout' do
    session.clear
    redirect '/'
  end
  get '/petitions' do
    erb :petitions
  end
  get '/petitions/:id/edit' do
    @petition = Petition.find_by_id(params[:id])
    erb :edit_petition
  end
  post '/petitions' do
    @student = Student.find_by(uga_myid: params[:uga_myid])
    @petition = Petition.create(petition_type: params[:petition_type], content: params[:content], advisor_id: session[:user_id], student_id: @student.id)
    redirect to "/petitions/#{@petition.id}/edit"
  end
  get '/petitions/new' do
    erb :new_petition
  end
  post '/petitions/new' do
    @student = Student.find_by(uga_myid: params[:uga_myid])
    @advisor = Advisor.find_by_id(session[:user_id])
    @petition = Petition.create(petition_type: params[:petition_type], content: params[:content])
    @petition.advisor_id = session[:user_id]
    @petition.student_id = @student.id
    @advisor.petitions << @petition
      redirect '/petitions/:id'
  end
  patch '/petitions/:id' do
    @petition = Petition.find_by_id(params[:id])
  end
  delete '/petitions/:id' do
  end
  get '/petitions/:dept_id' do
  end
  post '/petitions/:dept_id' do
  end
  patch '/petitions/:dept_id' do
  end
  delete '/petitions/:dept_id' do
  end
  get '/students' do
  end
  get '/students/:id' do
  end
  post '/students/:id' do
  end
  patch '/students/:id' do
  end
  delete '/students/:id' do
  end

  # error routes

  get '/acct_error' do
    erb :user_error
  end

  get '/pass_error' do
    erb :password_error
  end
end