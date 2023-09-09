require 'rails_helper'

RSpec.describe 'Recipe #show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Dieum', email: 'test@gmail.com', password: 'testest', password_confirmation: 'testest')
    @food = Food.create(name: 'Apple', measurement_unit: 'kg', price: 100, quantity: 2, user_id: @user.id)
    @recipe = Recipe.create(name: 'My unknown recipe', description: 'this is my unknwon recipe', preparation_time: '10',
                            cooking_time: '10', user: @user)
    @recipe_food1 = RecipeFood.create(quantity: 2, recipe_id: @recipe.id, food_id: @food.id)
    @recipe_food2 = RecipeFood.create(quantity: 2, recipe_id: @recipe.id, food_id: @food.id)

    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'

    visit recipe_path(@recipe)
  end

  it 'Displays a recipe name' do
    expect(page).to have_content(@recipe.name)
  end

  it 'Displays a recipe preparation time' do
    expect(page).to have_content(@recipe.preparation_time)
  end

  it 'Displays a recipe cooking' do
    expect(page).to have_content(@recipe.cooking_time)
  end

  it 'Displays a recipe description' do
    expect(page).to have_content(@recipe.description)
  end

  it 'Displays the generate shopping list button' do
    expect(page).to have_content('Generate shopping list')
  end

  it 'Displays the add ingredients button' do
    expect(page).to have_content('Add ingredients')
  end
end
