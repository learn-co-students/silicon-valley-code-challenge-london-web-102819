require 'Pry'

class FundingRound

    attr_reader :startup, :venture_capitalist, :type

    @@all = []

    def initialize(startup, venture_capitalist)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment > 0.to_f
    end 

    def self.all
        @@all
    end 

end
