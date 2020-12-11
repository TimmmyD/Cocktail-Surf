class CLI
    def run
        welcome
        user_selection
    end

    def welcome
        puts "---------------------------------------------------------------------------------------"
        puts "Welcome to Cocktail Surf! Please select your favorite type of Liquor we'll do the rest!"
    end

    def user_selection
        puts "Please choose an ingredient from the selection (Vodka, Gin, Tequila, Whiskey, etc)"
        input = gets.strip.downcase
        API.find_cocktails(input)
        Cocktail.all.each do |drink|
            puts drink.name 
            puts drink.id 
            puts drink.glass_type
            puts drink.ingredient_list
        end

    end
end