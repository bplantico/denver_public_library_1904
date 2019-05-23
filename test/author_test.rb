require 'minitest/autorun'
require 'minitest/test'
require './lib/book'
require './lib/author'

class AuthorTest < Minitest::Test

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_it_has_attributes
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
  end

  def test_it_initializes_with_empty_books_array
    assert_empty @charlotte_bronte.books
  end

  def test_it_can_write_a_book

    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    assert_instance_of Book, jane_eyre
  end

  def test_it_has_a_title

    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    assert_equal "Jane Eyre", jane_eyre.title
  end

  def test_books_author_writes_stored_in_array
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = @charlotte_bronte.write("Villette", "1853")

    assert_equal [jane_eyre, villette], @charlotte_bronte.books

  end

end
