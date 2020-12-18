class CLI
    def run
        welcome
        user_selection
        display_cocktails
        cocktail_selection
    end

    def welcome
        puts "---------------------------------------------------------------------------------------"
        puts "Welcome to Cocktail Surf! Please select your favorite type of Liquor we'll do the rest!"
    end

    def user_selection
        puts "Please choose an ingredient from the selection (Vodka, Gin, Tequila, Whiskey, etc)"
        input = gets.strip.downcase
        API.find_cocktails(input)
        #puts drink.glass_type
        #puts drink.ingredient_list
    end
    
    def display_cocktails
        @cocktails = Cocktail.all
        @cocktails.each.with_index(1) do |drink, i|
            puts "#{i}. #{drink.name}"
            puts drink.id 
        end

    end

    def cocktail_selection
        puts "Please select the cocktail you would like to know more of"
        input = gets.strip.to_i
        if input.between?(1, @cocktails.length)
            cocktail = @cocktails[input - 1]
            API.find_cocktail_info(cocktail)
           cocktail.display_cocktail_info
        else
            puts "wrong input, please type a number between 1 and #{@cocktails.length}"
            cocktail_selection
        end
    end

        
end