class VentureCapitalist

    attr_accessor :name, :total_worth

    @@capitalists = []

    def initialize (name, total_worth)
        @name = name
        @total_worth = total_worth
        @@capitalists << self
    end

    def self.all
        @@capitalists
    end

    def self.tres_commas_club
        VentureCapitalist.all.select {|capitalist| capitalist.total_worth > 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end 

    def funding_rounds
        FundingRound.all.select {|rounds| rounds.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.collect {|rounds| round.startup}
    end

    def biggest_investment
        self.funding_rounds.max_ by{|round| round.investment} 
    end

    def invested(domain)
        x = funding_rounds.collect do |round|
          round.startup.domain == domain
          round.investment
        end
        x.sum
      end

end
