require 'active_support/all'
require_relative './author'
require_relative './book'
require_relative './reader'
require_relative './order'

class Library
  attr_accessor :books, :orders, :readers, :authors

  def initialize books = [], orders = [], readers = [], authors = []
    @books, @orders, @readers, @authors = books, orders, readers, authors
  end

  # top_readers finds the most active readers
  #   top_readers takes number of readers to return (if not provided - 
  #     returns all readers)
  #   top_readers returns sorted array: [[first_reader_obj, orders_count], ...]
  def top_readers size = nil
    return [] if !size.nil? && size < 1
    rating = Hash.new {|h, k| h[k] = 0}
    orders.each { |o| rating[o.reader] += 1 }
    rating.to_a.sort{ |x, y| x[1] <=> y[1] }.reverse[0..(size || 0) - 1]
  end

  # permanent_readers finds readers who takes not less 'book_count' books
  # during last 'period'
  #   it takes book_count and period
  #   it returns array of permanent readers
  def permanent_readers book_count = 2, period = 1.month
    readers = Hash.new {|h, k| h[k] = 0}
    orders.each { |o| readers[o.reader] += 1 if o.date > Time.now - period }
    readers.select! { |k, v| v >= book_count }
    readers.to_a.map { |a| a[0] }
  end

  # top_books finds the most active readers
  #   top_books takes number of readers to return (if not provided - 
  #     returns all books)
  #   top_books returns sorted array: [[first_book_obj, orders_count], ...]
  def top_books size = nil
    return [] if !size.nil? && size < 1
    rating = Hash.new { |h, k| h[k] = 0 }
    orders.each { |o| rating[o.book] += 1 }
    rating.to_a.sort{ |x, y| x[1] <=> y[1] }.reverse[0..(size || 0) - 1]
  end

  # who_ordered returns array of readers who ordered given book one or more 
  # times
  def who_ordered book
    readers = []
    orders.each { |o| readers << o.reader if o.book == book }
    readers.uniq
  end
end
