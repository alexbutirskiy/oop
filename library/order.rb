class Order
  attr_reader :book, :reader, :date

  def initialize book, reader, date
    @book, @reader, @date = book, reader, date
  end

  def to_s
    "#{book.title} was given to #{reader} on #{date}"
  end
end
