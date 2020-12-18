require 'httparty'


class API


    def self.find_cocktails(ingredient)
        url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
        response = HTTParty.get(url)
        
        
        drinks_hash = JSON.parse(response.body)
        drinks_array = drinks_hash["drinks"]
        
        drinks_array.each do |hash|
            
           

            Cocktail.new({name: hash["strDrink"], id: hash["idDrink"]}) #ingredient_list: ingredient_list, glass_type: drink_info_hash["strGlass"]})
            
        end
        
        
        
        
    end

    def self.find_cocktail_info(cocktail)
        
        
        id_url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{cocktail.id}"
        id_response = HTTParty.get(id_url)
        
        
        
       
        drink_info_hash = id_response["drinks"][0]
        
        ingredient_list = Array.new
        ingredient_list << drink_info_hash["strIngredient1"]
        ingredient_list << drink_info_hash["strIngredient2"]
        ingredient_list << drink_info_hash["strIngredient3"]
        ingredient_list << drink_info_hash["strIngredient4"]
        ingredient_list << drink_info_hash["strIngredient5"]
        cocktail.ingredient_list = ingredient_list
        cocktail.glass_type = drink_info_hash["strGlass"]
    end
end