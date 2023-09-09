require 'rails_helper'

RSpec.describe 'Recipe #index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'syed', email: 'test@gmail.com', password: 'testest')
    @recipe1 = Recipe.create(name: 'My unknown recipe', description: 'this is my unknwon recipe',
                             preparation_time: '10', cooking_time: '10', user: @user)
    @recipe2 = Recipe.create(name: 'My unknown', description: 'this is my unknwon recipe', preparation_time: '10',
                             cooking_time: '10', user: User.first)

    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'
    visit recipes_path
  end

  it 'I can see all the foods info' do
    @user.recipes.each do |recipe|
      expect(page).to have_content(recipe.name)
      expect(page).to have_content(recipe.description)
    #   expect(page).to have_content('Remove')
    end
  end

  it 'I can go recipe details page when click on a specific recipe name' do
    click_on 'My unknown recipe'
    expect(page).to have_current_path(recipe_path(@recipe1))
  end

  it 'I can see a New recipe button' do
    expect(page).to have_content('New recipe')
  end

  it 'I can go to a New recipe page' do
    click_on 'New recipe'
    expect(page).to have_current_path(new_recipe_path)
  end
end