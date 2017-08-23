require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('./models/student.rb')

#INDEX
get '/hogwarts' do
  erb(:index)
end

#NEW
get '/hogwarts/new' do
  @houses = House.all
  erb(:new)
end

#CREATE
post '/hogwarts' do
  @students = Student.new(params)
  @students.save
  erb(:create)
end

# READ

get '/hogwarts/all' do
  @students = Student.all
  erb(:all)
end
