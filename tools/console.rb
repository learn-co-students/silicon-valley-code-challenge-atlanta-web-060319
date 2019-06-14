require_relative '../config/environment.rb'
require_relative '../app/models/funding_round.rb'
require_relative '../app/models/startup.rb'
require_relative '../app/models/venture_capitalist.rb'

require 'pry'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


hop = Startup.new("Hop", "Josh Riser", "hop.com")
drop = Startup.new("Drop", "Kate Mitchell", "drop.com")
roll = Startup.new("Roll", "Bill Jones", "roll.com")

bill = VentureCapitalist.new("Bill Gates", 10000000000000)
frank = VentureCapitalist.new("Frank Harris", 5000000000)
jane = VentureCapitalist.new("Jane Doe", 999999999)


round_1 = FundingRound.new(hop, frank, "Seed", 100000)
round_5 = FundingRound.new(hop, bill, "Pre Seed", 30000)
round_6 = FundingRound.new(hop, jane, "Seed", 50000)
round_7 = FundingRound.new(hop, bill, "Seed", 40000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line