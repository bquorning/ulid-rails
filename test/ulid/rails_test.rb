require "test_helper"

class ULID::RailsTest < Minitest::Test
  def test_primary_key
    user = User.create!
    assert user.id.is_a? String
    assert user.id.length == 26

    id = user.id
    user.reload
    assert id == user.id
  end

  def test_has_many
    user = User.create!
    book = user.books.create!

    assert book.user_id == user.id

    id = book.id
    book.reload
    assert id == book.id
  end

  def test_has_many_through
    # Doesn't work until https://github.com/rails/rails/issues/35839 is released
#    user = User.create!
#    article = user.articles.create!
#    user.reload
#
#    binding.irb
#
#    assert user.articles.count == 1
#    assert user.articles[0] == article

  end
end
