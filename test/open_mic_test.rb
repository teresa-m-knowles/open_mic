require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'
require './lib/open_mic'

class OpenMicTest < MiniTest::Test
  def test_it_exists
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    assert_instance_of OpenMic, open_mic
  end

  def test_it_can_read_the_open_mic_location
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    assert_equal "Comedy Works", open_mic.location
  end

  def test_it_can_read_the_open_mic_date
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    assert_equal "11-20-18", open_mic.date
  end

  def test_that_an_open_mic_begins_with_no_performers
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    assert open_mic.performers.empty?
  end

  def test_that_an_open_mic_can_add_performers
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")
    open_mic.welcome(sal)
    open_mic.welcome(ali)
    assert_equal [sal, ali], open_mic.performers
  end
end
