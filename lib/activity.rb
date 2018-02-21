class Activity
  attr_reader :name,
              :participants,
              :cost

  def initialize(name, participants)
    @name = name
    @participants = [participants]

  end

  def participant_names
    @participants.map do |participant|
      participant[:name]
    end
  end

  def finding_cost
    @participants.map do |participant|
      participant[:cost]
    end
  end

  def add_participants(participant)
    @participants << participant
  end

  def total_cost
    finding_cost.sum
  end

  def splitting_cost
    finding_cost.sum / @participants.count
  end

  def paying_evenly
    @participants.map do |participant|
      splitting_cost - participant[:cost]
    end
  end
end
