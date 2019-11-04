class Startup

 attr_reader :founder, :domain
 attr_accessor :name

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
    
    def self.find_by_founder(founder_name)
        self.all.find {|x| x.founder == founder_name}
    end 

    def self.domain
        @@all.select {|d| d.domain }
    end 

    def sign_contract(venture_capitalist, investment, amount)
        FundingRound.new = (self, venture_capitalist, investment.to_s, amount.to_f)
    end 

    def num_funding_rounds
        FundingRound.all.collect {|x| x.startup == self}
    end 


    def total_funds
        FundingRound.all.map {|f| f.investment}.sum
    end 

    def investors 
        VentureCapitalist.all.select {|V v.venture_capitalist}.uniq
    end 

    def big_investors
        VentureCapitalist.tres_commas_club & investors 
    end 
        

end
