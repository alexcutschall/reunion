require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require 'pry'

class ActivityTest < Minitest::Test
  def setup
    @activity = Activity.new("Hiking",
    {:name => "Ashley", :cost => 50})
  end

  def test_class_can_be_instantiated
    assert_instance_of Activity, @activity
  end

  def test_class_has_a_name
    assert_equal "Hiking", @activity.name
  end

  def test_class_has_a_function_to_get_participant_names
    assert_equal ["Ashley"], @activity.participant_names
  end

  def test_class_has_a_function_get_cost
    assert_equal [50], @activity.finding_cost
  end

  def test_can_add_participants
    assert_equal 1, @activity.participants.count

    @activity.add_participants({:name => "Mark", :cost => 100})

    assert_equal 2, @activity.participants.count
  end

  def test_can_evaluate_total_cost_of_activity
    @activity.add_participants({:name => "Mark", :cost => 100})

    assert_equal 150, @activity.total_cost
  end
end
