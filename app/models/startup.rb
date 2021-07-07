

class Startup
    
    attr_accessor :name
    attr_reader :founder, :domain
    
    @@startups = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@startups << self
    end

    def self.all
        @@startups
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def find_by_founder(founder)
        Startup.all.select {|company| company.founder == founder}
    end

    def domains
        Startup.all.collect {|company| company.domain}
    end 

    def sign_contract(capitalist, type, investment)
        FundingRound.new(self, capitalist, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.startup == self}
    end

    def num_funding_rounds
        self.funding_rounds.count
    end

    def total_funds
        
        self.funding_rounds.collect {|round| round.investment}.sum
    end 

    def investors
        self.funding_rounds.collect {|round| round.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.select {|investor| investor.total_worth > 1000000000}
    end


end
