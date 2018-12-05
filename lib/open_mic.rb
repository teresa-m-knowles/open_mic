class OpenMic

  attr_reader :location,
              :date

  def initialize(event_info)
    @location = event_info[:location]
    @date = event_info[:date]
  end
end
