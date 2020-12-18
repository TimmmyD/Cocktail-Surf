require 'pry'
require 'net/http'
require 'open-uri'

require_relative "./cocktail_surf/version"
require_relative "./cocktail_surf/cocktail"
require_relative "./cocktail_surf/api"
require_relative "./cocktail_surf/cli"
module CocktailSurf
  class Error < StandardError; end
  
end
