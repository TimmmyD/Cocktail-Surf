class Cocktails
    
    attr_accessor :liquor, :name, :recipe

    @@all = []

    def initialize(liquor, name, recipe)
        @@all << self
    end

    def self.all 
        @@all
    end