require './person'
# Inherit from Person class
class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    @classroom = classroom
    super(age, name, parent_permission)
  end

  def play_hookey
    "¯\(ツ)/¯"
  end
end
