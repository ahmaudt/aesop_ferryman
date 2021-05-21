# frozen_string_literal: true

# controller for routes between primary application functions and views
require './config/environment'
require_relative '../helpers/helpers'

class ApplicationController < Sinatra::Base
  configure do
    enable :sessions unless test?
    set :session_secret, ENV["SESSION_SECRET"]
    set :public_folder, 'public'
    set :public_folder, 'public/images'
    set :views, 'app/views'
    enable :static
  end

  # get routes
  #
  get '/public/images/:img' do
    send_file('public/images/'+params[:img])
  end

  get '/' do
    erb :welcome
  end

  get '/login' do
    erb :sign_in
  end

  get '/dashboard' do
    @user = Advisor.find_by_id(session[:user_id])
    erb :dashboard
  end

  get '/account/new' do
    erb :create_acct
  end

  get '/account' do
    @advisor = Advisor.find_by_id(session[:user_id])
    erb :view_acct
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/petitions' do
    erb :petitions
  end

  # get '/petitions/:id' do
  #   @petition = Petition.find_by_id(params[:id])
  #   erb :view_petition
  # end

  get '/petitions/permit_override/new' do
    erb :new_permit_override
  end

  get '/petitions/exception/new' do
    erb :new_exception
  end

  get '/petitions/substitution/new' do
    erb :new_substitution
  end

  get '/petitions/waiver/new' do
    erb :new_waiver
  end

  get '/petitions/new' do
    erb :new_petition
  end

  get '/petitions/:id' do
    @student = Student.find_by(uga_myid: params[:uga_myid])
    @petition = Petition.find_by_id(params[:id])
    if @petition.petition_type == "waiver"
      erb :view_waiver
    elsif @petition.petition_type == "permit-override"
      erb :view_permit_override
    elsif @petition.petition_type == "exception"
      erb :view_exception
    elsif @petition.petition_type == "substitution"
      erb :view_substitution
    end
  end

  get '/students' do
    @students = Student.all
    erb :students
  end

  get '/students/new' do
    erb :new_student
  end

  get '/students/:id' do
    @student = @student.find_by_id(params[:id])
    erb :view_student
  end

  # post routes

  post '/login' do # routes login data for verification
    @advisor = Advisor.find_by(uga_myid: params[:uga_myid])
    if @advisor != nil && @advisor.authenticate(params[:password])
      session[:user_id] = @advisor.id
      redirect '/dashboard'
    elsif @advisor == nil
      redirect to('/acct_error')
    elsif !!@advisor.authenticate(params[:password])
      redirect to('/pass_error')
    end
  end

  post '/account/new' do
    @acct = Advisor.find_by(uga_myid: params[:uga_myid])
    if @acct != nil
      redirect to('/acct_exists')
    end
    @advisor = Advisor.create(first_name: params[:first_name], last_name: params[:last_name], uga_myid: params[:uga_myid], password: params[:password])
    @advisor.save
    if @advisor.save
      redirect '/login'
    else
      redirect '/pass_error'
    end
  end

  post '/petitions' do
    @student = Student.find_by(uga_myid: params[:uga_myid])
    if @student != nil
      @petition = Petition.create(petition_type: params[:petition_type], content: params[:content], advisor_id: session[:user_id], student_id: @student.id, course_id: params[:course_id], audit_block: params[:audit_block], course_substituted_for: params[:course_substituted_for], waived_requirement: params[:waived_requirement], course_taken: params[:course_taken], permit_override: params[:permit_override])
      redirect to "/petitions/#{@petition.id}"
    else
      redirect to('/student_error')
    end
  end

  post '/students' do
    @advisor = Advisor.find_by_id(session[:user_id])
    @student = Student.create(first_name: params[:first_name], last_name: params[:last_name], uga_myid: params[:uga_myid], matriculation_term: params[:matriculation_term], graduation_term: params[:graduation_term], advisor_id: session[:user_id])
    @major = Major.find_by_id(params[:major_id])
    if @major != nil
      @major = Major.create(id: params[:major_id])
      @student.major_id = @major.id
    end
    @advisor.students << @student
    redirect to("/students/#{@student.id}")
  end

  # patch routes

  patch '/petitions/:id' do
    @petition = Petition.find_by_id(params[:id])
    @petition.content = params[:content]
    @petition.petition_type = params[:petition_type]
    @petition.save
    redirect "/petitions/#{@petition.id}"
  end

  patch '/students/:id' do
    @student = Student.find_by_id(params[:id])
    @student.major_id = params[:major_id]
    @student.graduation_term = params[:graduation_term]
    @student.advisor_id = session[:user_id]
    redirect to("/students/#{@student.id}")
  end

  patch '/account' do
    @advisor = Advisor.find_by_id(session[:user_id])
    @advisor.password = params[:password]
  end

  # delete routes

  delete '/petitions/:id' do
    @petition = Petition.find_by_id(params[:id])
    @petition.delete
    redirect to('/petitions')
  end

  delete '/students/:id' do
    @student = Student.find_by_id(params[:id])
    @student.delete
    redirect to('/students')
  end

  # error routes

  get '/acct_error' do
    erb :user_error
  end

  get '/pass_error' do
    erb :password_error
  end

  get '/student_error' do
    erb :no_student
  end

  get '/acct_exists' do
    erb :account_exists
  end
end
