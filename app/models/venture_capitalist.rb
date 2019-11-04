class VentureCapitalist
  attr_reader :name, :total_worth

  @@all = []
  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  #returns an array of all venture capitalists in the Trés Commas club 
  #(they have more then 1,000,000,000 `total_worth`)
  def self.tres_commas_club
    self.all.select {|s| s.total_worth > 1000000000}
  end

  #(startup, venture_capitalist, type，investment)
  def offer_contract(startup_object, investment_type, investment_amount)
    FundingRound.new(startup_object, self, investment_type, investment_amount)
  end

  #returns an array of all funding rounds for that venture capitalist
  def funding_rounds
    FundingRound.all.select {|fr| fr.venture_capitalist == self}
  end

  # a **unique** list of all startups this venture capitalist has funded
  def portfolio
    funding_rounds.map {|fr| fr.startup}
  end

   #returns the largest funding round given by this venture capitalist
  def biggest_investment
    funding_rounds.max_by {|fr| fr.investment}
  end

   #given a **domain string**, returns the total amount invested in that domain
  def invested(domain_lookup)
    total = 0
    funding_rounds.each do |fr| 
     if fr.startup.domain == domain_lookup
      total += fr.investment
     end
    end
    total
  end 

end

=begin
  - `VentureCapitalist#offer_contract`
  - given a **startup object**, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
- `VentureCapitalist#funding_rounds`
  - returns an array of all funding rounds for that venture capitalist
- `VentureCapitalist#portfolio`
  - Returns a **unique** list of all startups this venture capitalist has funded
- `VentureCapitalist#biggest_investment`
  - returns the largest funding round given by this venture capitalist
- `VentureCapitalist#invested`
  - given a **domain string**, returns the total amount invested in that domain

  
=end