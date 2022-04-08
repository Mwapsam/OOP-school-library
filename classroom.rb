class Classroom
  attr_accessor :label, :students

  def initialize(lebal)
    @lebal = lebal
    @student = []
  end

  def add_student(student)
    @student.push(student)
    student.classroom = self
  end
end
