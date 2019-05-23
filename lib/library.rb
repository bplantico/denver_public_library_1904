class Library
  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author

    @books << author.books
    @books = @books.flatten
  end

  def publication_time_frame_for(author)
    years_published = author.books.map { |book| book.publication_year.to_i }
    earliest_year = years_published.sort.first.to_s
    latest_year = years_published.sort.last.to_s
    hash = { start: earliest_year, end: latest_year }
  end

end
