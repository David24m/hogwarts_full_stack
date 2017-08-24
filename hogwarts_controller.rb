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

#DELETE route
post '/hogwarts/:id/delete' do
  @students = Student.find_id( params[:id] )
  @students.delete
  redirect '/hogwarts'
  erb(:delete)
end

#EDIT route
get '/hogwarts/:id/edit' do
  @student = Student.find_id( params[:id] )
  @houses = House.all
  erb(:edit)
end

#UPDATE route
post '/hogwarts/:id' do
  student = Student.new( params)
  student.update()
  # erb(:update)
  redirect to "/hogwarts/all"
end
