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

    def pivot(new_domain, new_name)
        @domain = new_domain
        @name = new_name 
    end

    def self.all
        @@all
    end 

    def self.find_by_founder(name)
        self.all.find { |s| s.founder == name }
    end

    def self.domains
        self.all.map { |s| s.domain }.uniq
    end 

    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)
    end 

    def funding_rounds 
        FundingRound.all.select { |fr| fr.startup == self }
    end 
    
    def num_funding_rounds 
        funding_rounds.count
    end 

    def total_funds
        investment = funding_rounds.map { |fr| fr.investment }
        investment.reduce(:+)
    end 

    def investors
        funding_rounds.map { |fr| fr.venture_capitalist }.uniq
    end 

    def big_investors
        tcc = VentureCapitalist.tres_commas_club 
        big_i = tcc & investors 
    end 

end
