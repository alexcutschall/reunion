require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def setup
    @activity = Activity.new("Hiking",
    {:name => "Ashley", :cost => 50})

    @reunion = Reunion.new("Denver", @activity)
  end

  def test_class_can_be_instantiated
    assert_instance_of Reunion, @reunion
  end

  def test_class_has_location_and_activity
    assert_equal "Denver", @reunion.location
    assert_instance_of Activity, @reunion.activity.first
    assert_equal "Hiking", @reunion.activity.first.name
  end

  def test_can_add_activities
    new_activity = Activity.new("Tanning", {:name => "Mark", :cost => 150})
    assert_equal 1, @reunion.activity.count
    @reunion.add_activities(new_activity)
    assert_equal 2, @reunion.activity.count
  end

  def test_can_find_cost_of_each_activity
    new_activity = Activity.new("Tanning", {:name => "Mark", :cost => 150})
    @reunion.add_activities(new_activity)

    assert_equal [50, 150], @reunion.find_participant_costs
  end

  def test_can_find_total_cost_of_activities
    new_activity = Activity.new("Tanning", {:name => "Mark", :cost => 150})
    @reunion.add_activities(new_activity)

    assert_equal 200, @reunion.total_cost
  end

  def test_can_find_total_number_of_participants
    new_activity = Activity.new("Tanning", {:name => "Mark", :cost => 150})
    @reunion.add_activities(new_activity)

    assert_equal 2, @reunion.total_number_of_participants
  end

  def test_can_split_reunion_cost_evenly
    new_activity = Activity.new("Tanning", {:name => "Mark", :cost => 150})
    @reunion.add_activities(new_activity)

    assert_equal 100, @reunion.splitting_reunion_evenly
  end

  def test_can_print_status_if_someone_paid_too_much_or_too_little
    new_activity = Activity.new("Tanning", {:name => "Mark", :cost => 150})
    @reunion.add_activities(new_activity)

    assert_instance_of Activity, @reunion.cost_for_participants[0]
    assert_instance_of Activity,  @reunion.cost_for_participants[1]
  end
end
