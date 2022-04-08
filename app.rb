require_relative('./person')
require_relative('./book')
require_relative('./rental')
require_relative('./student')
require_relative('./teacher')

class Methods
  def list_books
    @books.each { |book| puts book }
  end

  def list_people
    @people.each { |person| puts person }
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'That is not a valid input'
      return
    end

    puts 'Person created successfully'
  end

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    student = Student.new(name: name, age: age, parent_permission: parent_permission, classroom: @classroom)
    @people.push(student)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(name: name, age: age, specialization: specialization)
    @people.push(teacher)
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)

    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, idx| puts "#{idx}) #{book}" }

    book_idx = gets.chomp.to_i

    puts
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |person, idx| puts "#{idx}) #{person}" }

    person_idx = gets.chomp.to_i

    puts
    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_idx], @people[person_idx])
    @rentals.push(rental)

    puts 'Rental created successfully'
  end

  def list_rentals_by_person_id
    print 'ID of person: '
    id = gets.chomp

    puts 'Rentals:'

    @rentals.each { |rental| puts rental if rental.person.id == id.to_i }
  end
end

class App
  def self.home_page
    puts 'Welcome to the School Library App!'
    puts "\n"
    puts 'Please choose an option by entering a number: '

    @content = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person id',
      '7' => 'Exit'
    }

    @content.each do |index, string|
      puts "#{index} - #{string}"
    end

    Integer(gets.chomp)
  end

  method = Methods.new

  loop do
    case home_page
    when 1
      method.book_list
    when 2
      method.people_list
    when 3
      method.create_person
    when 4
      method.create_book
    when 5
      method.create_rental
    when 6
      method.rental_list
    when 7
      puts 'Thank you for using the app!'
      exit
    else
      puts 'Choose a number between 1 to 7'
    end
  end
end

def main
  App.new
end

main
