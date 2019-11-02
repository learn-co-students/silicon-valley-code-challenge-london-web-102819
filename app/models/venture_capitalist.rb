class VentureCapitalist

    @@all = []
    attr_reader :name
    attr_accessor :total_worth

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_comma_club
        self.all.select{|vc| vc.total_worth > 1_000_000_000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup,self,type, investment)
    end

    def funding_rounds
        FundingRound.all.select{|fr| fr.venture_capitalist == self}.uniq
    end

    def portfolio
        funding_rounds.map{|fr| fr.startup}
    end

    def biggest_investment
        funding_rounds.map{|fr| fr.investment}.max
    end

    def invested(sought_domain)
        funding_rounds.select{|fr| fr.domain == sought_domain}.map{|fr| fr.investment}.sum
    end

end
