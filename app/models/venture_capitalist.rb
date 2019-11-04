class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end 

    def self.all
        @@all
    end 

    def self.tres_commas_club
        self.all.find {|v| v.total_worth >= 1,000,000,000}
    end 

    def offer_contract(startup, type, amount)
        FundingRound.new = (self, startup, type, amount)
    end 

    def funding_rounds
        self.all.select {|f| f.VentureCapitalist == self}
    end

    def portfolio
        funding_rounds.uniq {|s| s.startup}
    end 

    def biggest_investment
        funding_rounds.max_by {|m| m.investment}
    end

    def invested(domain_string)
        funding_round.select {|ds| ds.startup.domain== domain_string}

end
