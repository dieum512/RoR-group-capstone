require 'rails_helper'

RSpec.describe 'Foods index page', type: :feature do
    before(:each) do
        @user = User.create(name: 'syed', email: 'test@gmail.com', password: 'testest')
        @food1 = Food.create(name: 'Apple', measurement_unit: 'kg', price: 100, quantity: 2, user_id: @user.id)
        @food2 = Food.create(name: 'Apple', measurement_unit: 'kg', price: 100, quantity: 2, user_id: @user.id)
    
        visit new_user_session_path
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button 'Log in'
        visit foods_path
      end

      it 'I can see add food button' do
        expect(page).to have_content('Add Food')
      end

      it 'I can see add food name' do
        expect(page).to have_content(@food1.name)
        expect(page).to have_content(@food2.name)
      end

      it 'Displays the maesurement unit' do
        expect(page).to have_content(@food1.measurement_unit)
        expect(page).to have_content(@food2.measurement_unit)
      end

      it 'Displays the price' do
        expect(page).to have_content(@food1.price)
        expect(page).to have_content(@food2.price)
      end
end