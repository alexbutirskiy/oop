class Author
  attr_reader :name
  attr_accessor :biography

  def initialize name, biography = nil
    @name, @biography = name, biography
  end
end