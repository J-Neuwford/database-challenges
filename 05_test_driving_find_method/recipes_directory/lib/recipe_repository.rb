require_relative './recipe'
class RecipeRepository
  def all
     sql = 'SELECT * FROM recipes;'
     result_set = DatabaseConnection.exec_params(sql, [])
     recipes = []

    result_set.each do |record|
      recipe = Recipe.new
      recipe.id = record['id'].to_i
      recipe.name = record['name']
      recipe.avg_cooking_time_in_mins = record['avg_cooking_time_in_mins'].to_i
      recipe.rating = record['rating'].to_i

      recipes << recipe
    end
    
    return recipes
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    sql =  'SELECT id, name, avg_cooking_time_in_mins, rating FROM recipes WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set.first
    p record 
    # Returns a single recipe object.
    recipe = Recipe.new
    recipe.id = record['id'].to_i
    recipe.name = record['name']
    recipe.avg_cooking_time_in_mins = record['avg_cooking_time_in_mins'].to_i
    recipe.rating = record['rating'].to_i

    return recipe
  end
end