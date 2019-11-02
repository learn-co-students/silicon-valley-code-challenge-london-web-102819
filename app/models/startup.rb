class Startup

    @@all = []
    attr_reader :founder, :domain
    attr_accessor :name

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(new_domain, new_name)
        @domain = new_domain
        @name = new_name
    end

    def self.find_by_founder(sought_founder)
        self.all.find{|startup| startup.founder == sought_founder}
    end

    def self.domains
        self.all.map{|s| s.domain}.uniq
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist,type, investment)
    end

    def num_funding_rounds
        FundingRound.all.count{|fr| fr.startup == self}
    end

    def funding_rounds
        FundingRound.all.select{|fr| fr.startup == self}
    end

    def investors
        funding_rounds.map{|fr| fr.venture_capitalist}.uniq
    end

    def big_investors
        investors.select{|i| i.total_worth > 1_000_000_000}
    end

  
end
