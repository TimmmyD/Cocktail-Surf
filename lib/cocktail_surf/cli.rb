class CLI
    def run
        welcome
        user_selection
    end

    def welcome
        puts "Welcome to Cocktail Surf! Please select your favorite type of Liquor well do the rest!"
    end

    def user_selection
        puts "Please chose an ingredient from the selction"
        input = gets.strip.downcase
        API.find_cocktails(input)
    end
end