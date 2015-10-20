require_relative './library/library'

# returns library class object with some data
def library_init
  teslenko  = Reader.new('Ivan Testenko',     'testenko@gmail.com',       'Dnipropetrovsk',   'Kirova blvd',  '47/404')
  pupkin    = Reader.new('Vasiliy Pupkin',    'pupkin@gmail.com',         'Dnipropetrovsk',   'K. Marxa blvd','15/64')
  obama     = Reader.new('Barak Obama',       'prezident@whitehouse.gov', 'Washington, D.C.', 'White House',  '')
  matz      = Reader.new('Yukihiro Matsumoto','matz@ruby-lang.org',       'Matsue',           '市営来美',       'アパート３')
  knuth     = Reader.new('Donald Knuth',      'knuth@gmail.com',          'Pasadena CA',      '44 Ave',       '147')
  carmack   = Reader.new('John Carmack',      'johnc@idsoftware.com',     'Mountain View CA', 'Nilda Ave',    '74')

  leo_tolstoy = Author.new('Leo Tolstoy')
  oscar_wilde = Author.new('Oscar Wilde')
  stendhal    = Author.new('Stendhal')
  devid_black = Author.new('David A. Black')

  war_and_peace = Book.new('War and Peace',               leo_tolstoy)
  red_and_black = Book.new('Red and Black',               stendhal)
  rubyist       = Book.new('The Well-Grounded Rubyist',   devid_black)
  grey          = Book.new('The Picture of Dorian Gray',  oscar_wilde)
  karenina      = Book.new('Anna Karenina',               leo_tolstoy)

  library = Library.new(
    [war_and_peace, red_and_black, rubyist, grey, war_and_peace],
    [ Order.new(war_and_peace,  teslenko, Time.now + (rand(30) - 30).days),
      Order.new(war_and_peace,  obama,    Time.now + (rand(30) - 30).days),
      Order.new(war_and_peace,  pupkin,   Time.now + (rand(30) - 30).days),
      Order.new(red_and_black,  teslenko, Time.now + (rand(30) - 30).days),
      Order.new(war_and_peace,  matz,     Time.now + (rand(30) - 30).days),
      Order.new(karenina,       matz,     Time.now + (rand(30) - 30).days),
      Order.new(rubyist,        teslenko, Time.now + (rand(30) - 30).days),
      Order.new(rubyist,        knuth,    Time.now + (rand(30) - 30).days),
      Order.new(rubyist,        pupkin,   Time.now + (rand(30) - 30).days),
      Order.new(rubyist,        matz,     Time.now + (rand(30) - 30).days),
      Order.new(rubyist,        carmack,  Time.now + (rand(30) - 30).days)],
      [teslenko, pupkin,        obama, matz, knuth, carmack],
      [leo_tolstoy, oscar_wilde, stendhal, devid_black]
    )
end
