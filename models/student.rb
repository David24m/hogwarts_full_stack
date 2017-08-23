require_relative("../db/sql_runner")

class Student

  attr_reader(:id)
  attr_accessor(:first_name, :last_name, :house, :age)

  def initialize(details)
    @id = details["id"].to_i
    @first_name = details["first_name"]
    @last_name = details["last_name"]
    @house = details["house"]
    @age = details["age"].to_i
  end

  def save()
    sql = 'INSERT INTO students (first_name, last_name, house, age) VALUES ($1, $2, $3, $4) RETURNING id;'
    values = [@first_name, @last_name, @house, @age]
    students = SqlRunner.run(sql, values).first
    @id = students['id'].to_i
  end

  def self.find ()
    sql = 'SELECT * FROM students;'
    values= []
    student_hash = SqlRunner.run(sql, values)
    students = student_hash.map { |student| Student.new(student) }
    return students
  end

  def self.find_id ()
    sql = 'SELECT * FROM students WHERE id = $1'
    values = [@id]
    student_hash = SqlRunner.run(sql, values)
    students = student_hash.map { |student| Student.new(student) }
    return students
  end

end
