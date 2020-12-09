class Cocktail
    
    #attr_accessor :liquor, :name, :recipe

    @@all = []

    def initialize(attrs)
        attrs.each do |k,v|

    self.class.attr_accessor k
    self.send("#{k} =", v)

        end
        @@all << self
    end

    def self.all 
        @@all
    end
end