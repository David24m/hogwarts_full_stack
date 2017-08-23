require_relative("../models/student")

require('pry-byebug')

student1 = Student.new({ 'first_name' => "Harry", 'last_name' => "Potter", 'house' => "Gryffindor", 'age' => 15})
student1.save()

pry.binding
nil
