require 'erb'
require_relative '../lib/reunion'
require_relative '../lib/activity'

activity = Activity.new("Hiking",
{:name => "Ashley", :cost => 50})
reunion = Reunion.new("Denver", activity)

puts "This reunion costs #{<%= reunion.total_cost %>}"
