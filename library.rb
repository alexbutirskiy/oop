require_relative './author'
require_relative './book'
require_relative './reader'
require_relative './order'

class Library
  attr_accessor :books, :orders, :readers, :authors

  def initialize books = [], orders = [], readers = [], authors = []
    @books, @orders, @readers, @authors = books, orders, readers, authors
  end

end

