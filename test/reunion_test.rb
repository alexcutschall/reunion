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
end
