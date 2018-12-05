require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require 'pry'

class JokeTest < MiniTest::Test

  def test test_it_exists
    joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    assert_instance of Joke, joke
  end

  def test_it_can_read_the_joke_id
    joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    assert_equal 1, joke.id
  end

  def test_it_can_read_the_setup
    joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    assert_equal "Why did the strawberry cross the road?", joke.setup
  end

  def test_it_can_read_the_punchline
    joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    assert_equal "Because his mother was in a jam.", joke.punchline
  end
end
