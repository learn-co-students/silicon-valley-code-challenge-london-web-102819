require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
s1 = Startup.new("Monzo", "John Monzo", "FinTech")
s2 = Startup.new("Uber", "Jack Uber", "Transport")
s3 = Startup.new("Flatiron", "Mr Flatiron", "Education")

vc1 = VentureCapitalist.new("Elon Musk", 1200000000)
vc2 = VentureCapitalist.new("Ashton Kutcher", 50000000)
vc3 = VentureCapitalist.new("Joe Bloggs", 1200000)

s1.sign_contract(vc1, "Angel", 50000.00)
s2.sign_contract(vc1, "Angel", 100000.00)
s1.sign_contract(vc3, "Angel", 123000.00)
s1.sign_contract(vc2, "Seed 2", 60000.00)

vc3.offer_contract(s3, "Seed 1", 10000.00)
vc2.offer_contract(s1, "Angel", 20000.00)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line