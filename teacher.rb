require './person'
# Inherit from Person class
class Teacher < Person
  def initialize(specialization, age, name = 'Unknown')
    @specialization = specialization
    super(age, name)
  end

  def can_use_services?
    true
  end
end
