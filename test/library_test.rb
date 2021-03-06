require 'minitest/autorun'
require 'minitest/test'
require './lib/book'
require './lib/author'
require './lib/library'

class LibraryTest < Minitest::Test

  def setup
    @dpl = Library.new("Denver Public Library")
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_it_has_a_name
    assert_equal "Denver Public Library", @dpl.name
  end

  def test_it_initializes_without_books_or_books
    assert_empty @dpl.books
    assert_empty @dpl.authors
  end

  def test_it_can_have_authors
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    assert_equal [@charlotte_bronte, @harper_lee], @dpl.authors
  end

  def test_it_can_have_books
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    expected = [@jane_eyre, @professor ,@villette, @mockingbird]

    assert_equal expected, @dpl.books
  end

  def test_it_knows_publication_time_for_an_author
    expected_cb = {:start=>"1847", :end=>"1857"}
    expected_hl = {:start=>"1960", :end=>"1960"}

    assert_equal expected_cb, @dpl.publication_time_frame_for(@charlotte_bronte)
    assert_equal expected_hl, @dpl.publication_time_frame_for(@harper_lee)
  end

end
