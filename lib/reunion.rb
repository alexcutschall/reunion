class Reunion
  attr_reader :location,
              :activity

  def initialize(location, activity)
    @location = location
    @activity = [activity]
    @cost = []
  end

  def add_activities(activity)
    @activity << activity
  end

  def find_participant_costs
    @activity.map do |activity|
      activity.finding_cost
    end.flatten
  end

  def total_cost
    find_participant_costs.sum
  end

  def total_number_of_participants
    @activity.map do |activity|
      activity.participants.count
    end.sum
  end

  def splitting_reunion_evenly
    total_cost / total_number_of_participants
  end

  def cost_for_participants
    @cost = []
    @activity.each do |activity|
      @cost << activity.participants.each do |participant|
        participant[:owe] = splitting_reunion_evenly - participant[:cost]
      end
    end
  end

  def cost
    cost_for_participants
    @cost
  end
end
