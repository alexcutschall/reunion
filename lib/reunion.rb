class Reunion
  attr_reader :location,
              :activity

  def initialize(location, activity)
    @location = location
    @activity = [activity]
  end

  def add_activities(activity)
    @activity << activity
  end
end
