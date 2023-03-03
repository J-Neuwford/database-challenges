require 'recipe_repository'

RSpec.describe RecipeRepository do
  def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_recipes_table
  end

  it 'returns all the recipes' do
    repo = RecipeRepository.new
    recipes = repo.all

    expect(recipes.length).to eq 2
    expect(recipes[0].id).to eq  1
    expect(recipes[0].name).to eq 'Carbonara'
    expect(recipes[0].avg_cooking_time_in_mins).to eq 12
    expect(recipes[0].rating).to eq 5
    
    expect(recipes[1].id).to eq 2
    expect(recipes[1].name).to eq 'Bolognese'
    expect(recipes[1].avg_cooking_time_in_mins).to eq 180
    expect(recipes[1].rating).to eq 5
  end

  # 2
  # Get a single recipe
  it 'returns one of the recipes' do
    repo = RecipeRepository.new

    recipe = repo.find(2)

    expect(recipe.id).to eq 2
    expect(recipe.name).to eq 'Bolognese'
    expect(recipe.avg_cooking_time_in_mins).to eq 180
    expect(recipe.rating).to eq 5
  end

end