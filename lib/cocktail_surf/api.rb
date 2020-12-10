require 'httparty'


class API


    def self.find_cocktails(ingredient)
        url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
        response = HTTParty.get(url)
        #puts response.body
        drinks_hash = JSON.parse(response.body)
        drinks_array = drinks_hash["drinks"]
        drinks_array.each do |hash|
            puts hash["strDrink"]
        end
        
        
        
        #puts drinks_array.first["strDrink"]
    end

    #https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin

    #https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Vodka

    # https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Whiskey

    # https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Tequila
end