class FundingRound

    attr_accessor :type, :investment
    attr_reader :startup, :venture_capitalist

    @@round = []

    def initialize (startup, venture_capitalist, type=nil, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment
        @@round << self
    end

    def self.all
        @@round
    end


end
