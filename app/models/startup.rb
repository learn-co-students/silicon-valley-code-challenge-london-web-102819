require "pry"
class Startup
  attr_reader :name, :founder, :domain

  @@all = []
  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(domain)
    @domain = domain
  end 

  #given a string of a **founder's name**,
  # returns the **first startup** whose founder's name matches
  def self.find_by_founder(founder_name)
    self.all.find {|s| s.founder == founder_name}
  end

  #should return an **array** of all of the different startup domains
  def self.domains
    self.all.map {|s| s.domain}
  end

  #given a **venture capitalist object**, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates 
  #it with that startup and venture capitalist.
  #(startup, venture_capitalist, type，investment)
  def sign_contract(venture_capitalist_object, investment_type, investment_amount)
    FundingRound.new(self, venture_capitalist_object, investment_type, investment_amount)
  end

  def fundings
    FundingRound.all.select {|f| f.startup == self}
  end

  #Returns the total number of funding rounds that the startup has gotten
  def num_funding_rounds
    fundings.size
  end

  #Returns the total sum of investments that the startup has gotten
  def total_funds
    (fundings.map {|f| f.investment}).sum
  end

  def investors
    fundings.map {|fr| fr.venture_capitalist}.uniq
  end


  #Returns a **unique** array of all the venture capitalists that have invested in 
  #this company and are in the Trés Commas club
  def big_investors
    tres_commas_club_investor = VentureCapitalist.tres_commas_club
    big_investor = tres_commas_club_investor & investors
  end
end

puts 0

=begin

 Startup#sign_contract`
  - given a **venture capitalist object**, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
- `Startup#num_funding_rounds`
  - Returns the total number of funding rounds that the startup has gotten
- `Startup#total_funds`
  - Returns the total sum of investments that the startup has gotten
- `Startup#investors`
  - Returns a **unique** array of all the venture capitalists that have invested in this company
- `Startup#big_investors`
  - Returns a **unique** array of all the venture capitalists that have invested in this company and are in the Trés Commas club
  
=end