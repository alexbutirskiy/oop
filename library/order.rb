class Order
  attr_reader :book, :reader, :date

  def initialize book, reader, date
    @book, @reader, @date = book, reader, date
  end

  def to_s
    "#{book.title} was given to #{reader.to_s} on #{date}"
  end
end