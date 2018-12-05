class OpenMic

  attr_reader :location,
              :date,
              :performers

  def initialize(event_info)
    @location = event_info[:location]
    @date = event_info[:date]
    @performers = []
  end

  def welcome(performer)
    @performers << performer
  end
  
end
