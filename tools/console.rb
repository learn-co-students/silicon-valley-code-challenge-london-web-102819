require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

##### Startup Class Testing ############
#(name, founder, domain)
s1 = Startup.new("PWC", "Qing", "account")
s2 = Startup.new("Flatiron", "Avi", "Programming Education")
s3 = Startup.new("Waitrose", "Tom", "Supermarket")

##### Venture_capitalist Class Testing ############
#(name, total_worth)
v1= VentureCapitalist.new("venture 1", 7000000)
v2= VentureCapitalist.new("venture 2", 2000000000)
v3= VentureCapitalist.new("venture 3", 800000000)
v4= VentureCapitalist.new("venture 4", 10000000001)

##### Founding_round Class Testing ############
#f1 =(startup, venture_capitalist, type)
f1 = FundingRound.new(s1, v1, "Series A", 2000)
f2 = FundingRound.new(s2, v2, "Series B", 3000)
f3 = FundingRound.new(s3, v3, "Series C", 4000)
f4 = FundingRound.new(s1, v4, "Series D", 50000)
f5 = FundingRound.new(s2, v2, "Series E", 500000)
f6 = FundingRound.new(s1, v2, "Series F", 1090000)
f7 = FundingRound.new(s2, v3, "Series G", 1090000)
f8 = FundingRound.new(s1, v2, "Series I", 80000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line