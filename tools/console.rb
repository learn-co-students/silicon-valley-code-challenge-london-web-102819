require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

s1 = Startup.new ("company", "John smith", "domain1")
s2 = Startup.new ("2ndComp", "Jake Smith", "Domain2")
s3 = Startup.new ("3rdComp", "Grace Smith", "Dom3")

v1 = VentureCapitalist.new("JJ", 1000000)
v2 = VentureCapitalist.new("elite", 98752)
v3 = VentureCapitalist.new("vk", 2377483)


# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
p 'eof' #leave this here to ensure binding.pry isn't the last line