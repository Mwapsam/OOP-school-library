require_relative './nameable'
require_relative './rental'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..9999)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end

  attr_reader :id
  attr_accessor :name, :age, :rental

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age?
  end

  private :of_age?

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
