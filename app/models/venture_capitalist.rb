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

    def self.tres_commas_club
        self.all.select { |vc| vc.total_worth > 1000000000 }
    end 

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end 

    def funding_rounds 
        FundingRound.all.select { |fr| fr.venture_capitalist == self }
    end 

    def portfolio
        funding_rounds.map { |fr| fr.startup }.uniq
    end 

    def biggest_investment 
        funding_rounds.max_by { |fr| fr.investment }
    end 

    def invested(domain)
        #binding.pry
        total = 0 
        funding_rounds.each { |fr| total += fr.investment if fr.startup.domain == domain }
        total
    end 

end
