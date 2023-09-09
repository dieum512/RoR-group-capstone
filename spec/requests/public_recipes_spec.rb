require 'rails_helper'
require 'capybara/rspec'

RSpec.describe PublicRecipesController, type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'dieum', email: 'test@gmail.com', password: '123456')
    sign_in @user
  end

  describe 'GET #index' do
    it 'Returns a success link' do
      get '/public_recipes'
      expect(response).to have_http_status(:success)
    end

    it 'Displays the index' do
      get '/public_recipes'
      expect(response).to render_template(:index)
    end
    it 'Returns the body holder' do
      get '/public_recipes'
      expect(response.body).to include('Public')
    end
  end
end