class Author
  attr_reader :name
  attr_accessor :biography

  def initialize name, biography = ''
    @name, @biography = name, biography
  end

  def to_s
    "#{name}"
  end
end
