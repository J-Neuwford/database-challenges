require_relative './lib/database_connection'
require_relative './lib/recipe_repository'

DatabaseConnection.connect('recipes_directory')

