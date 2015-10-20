require 'yaml'
require_relative './library/library'
require_relative './library_init'

puts "\n1. Get all Library data from file(s)"
  print "\tTrying to read stored data... "
  begin
    f = File.open('library.yaml', 'r')
    library = YAML.load f.read
  rescue
    puts 'Failed'
    library = library_init
    puts "\t Defaults loaded"
  else
    puts "Ok."
    puts "\tLibrary statistics:"
    puts "\t\tBooks\t#{library.books.size}"
    puts "\t\tAuthors\t#{library.authors.size}"
    puts "\t\tReaders\t#{library.readers.size}"
    puts "\t\tOrders\t#{library.orders.size}"
  ensure
    f.close unless f.nil?
  end

# Perform some random maipulations
# Give random book to random reader
  book = library.books.sample
  reader = library.readers.sample
  library.orders << Order.new(book, reader, (Time.now + (rand(30) - 30).days))

puts "\n2. Who often takes the book?"
  library.permanent_readers.each { |a| puts "\t#{a.name}" }

puts "\n3. What is the most popular book?"
  puts "\t#{library.top_books(1)[0][0]}"

puts "\n4. How many people ordered one of the three most popular books"
  library.top_books(3).each do |a|
    puts "\t#{a[0]} was ordered #{library.who_ordered(a[0]).size} times."
  end

puts "\n5. Save all Library data to file(s)"
  begin
    f = File.open('library.yaml', 'w')
    f.write library.to_yaml
  rescue
    puts "\tSomething goes wrong"
  else
    puts "\tCompleted!"
  ensure
    f.close unless f.nil?
  end
