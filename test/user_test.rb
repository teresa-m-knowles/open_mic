require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'
require 'pry'

class UserTest < MiniTest::Test
  def test_it_exists
    sal = User.new("Sal")
    assert_instance_of User, sal
  end

  def test_it_can_read_the_name

    sal = User.new("Sal")
    assert_equal "Sal", sal.name
  end

  def test_user_starts_with_zero_jokes

    sal = User.new("Sal")
    assert sal.jokes.empty?
  end

  def test_user_can_learn_jokes

    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    sal = User.new("Sal")
    sal.learn(joke_1)
    sal.learn(joke_2)
    assert_equal [joke_1, joke_2], sal.jokes
  end

  def test_user_can_tell_jokes_and_other_user_learns_them
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    sal = User.new("Sal")
    ali = User.new("Ali")
    sal.tell(ali, joke_1)

    assert_equal [joke_1], ali.jokes

    sal.tell(ali, joke_2)
    assert_equal [joke_1, joke_2], ali.jokes
  end

  def test_that_we_can_use_the_joke_id_to_return_the_joke
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    sal = User.new("Sal")
    ali = User.new("Ali")
    sal.tell(ali, joke_1)
    sal.tell(ali, joke_2)
    assert_equal joke_1, ali.joke_by_id(1)

    assert_equal joke_2, ali.joke_by_id(2)

  end
end
