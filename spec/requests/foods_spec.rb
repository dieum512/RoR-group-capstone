require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'dieum', email: 'test@gmail.com', password: '123456')
    sign_in @user
  end

  describe 'GET /index' do
    before do
      get '/foods/'
    end

    it 'Returns a success link' do
      expect(response).to have_http_status(:success)
    end

    it 'Displays the index' do
      expect(response).to render_template(:index)
    end
    it 'Returns the body holder' do
      expect(response.body).to include('Food')
    end
  end

  describe 'GET /create' do
    before do
      Food.create(name: 'rice', measurement_unit: 'kilogram', price: 1, quantity: 3)
      get '/foods/new/'
    end

    it 'Returns a success link' do
      expect(response).to have_http_status(:success)
    end

    it 'Displays the new' do
      expect(response).to render_template(:new)
    end

    it 'Returns the body holder' do
      expect(response.body).to include('Food')
    end
  end

  describe 'GET /recipes/:id' do
    it 'Displays a success' do
      food = Food.create(name: 'rice', measurement_unit: 'kilogram', price: 1, quantity: 3)
      get "/foods/#{food.id}/"
      expect(response).to have_http_status(:success)
    end

    it 'Displays the show' do
      recipe = Recipe.create(user: @user, name: 'test', preparation_time: 1, cooking_time: 1,
                             description: 'This description', public: true)
      get "/recipes/#{recipe.id}/"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end

    it 'Includes recipe name in the response' do
      recipe = Recipe.create(user: @user, name: 'test', preparation_time: 1, cooking_time: 1,
                             description: 'This description', public: true)
      get "/recipes/#{recipe.id}/"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('test')
    end
  end
end