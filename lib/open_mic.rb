require 'pry'
class OpenMic

  attr_reader :location,
              :date,
              :performers,
              :all_jokes

  def initialize(event_info)
    @location = event_info[:location]
    @date = event_info[:date]
    @performers = []
  end

  def welcome(performer)
    @performers << performer
  end

  def repeated_jokes?
    @all_jokes = []
    @performers.each do |performer|
      @all_jokes << performer.jokes
    end
    @all_jokes.flatten!
    if @all_jokes.uniq == @all_jokes
      false
    elsif
      @all_jokes.uniq != @all_jokes
      true
    end

  end

end
