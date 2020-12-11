require 'httparty'


class API


    def self.find_cocktails(ingredient)
        url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
        response = HTTParty.get(url)
        
        
        drinks_hash = JSON.parse(response.body)
        drinks_array = drinks_hash["drinks"]
        #puts Cocktail.all.size
        drinks_array.each do |hash|
            
            id_url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{hash["idDrink"]}"
            id_response = HTTParty.get(id_url)
            
            id_hash = JSON.parse(id_response.body)
            
            drink_array = id_hash["drinks"]
            
            drink_info_hash = drink_array.first
            
            ingredient_list = Array.new
            ingredient_list << drink_info_hash["strIngredient1"]
            ingredient_list << drink_info_hash["strIngredient2"]
            ingredient_list << drink_info_hash["strIngredient3"]
            ingredient_list << drink_info_hash["strIngredient4"]
            ingredient_list << drink_info_hash["strIngredient5"]
            
            Cocktail.new({name: hash["strDrink"], id: hash["idDrink"], ingredient_list: ingredient_list, glass_type: drink_info_hash["strGlass"]})
            #puts Cocktail.all.size
            #puts test.name
            #puts hash["strDrink"]
            #puts hash["idDrink"]
        end
        

        
        #puts drinks_array.first["strDrink"]
    end

    #https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin

    #https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Vodka

    # https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Whiskey

    # https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Tequila
end