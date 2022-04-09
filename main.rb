require './app'

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
      method.list_books
    when 2
      method.list_people
    when 3
      method.create_person
    when 4
      method.create_book
    when 5
      method.create_rental
    when 6
      method.list_rentals
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
