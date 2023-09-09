require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'Belongs to user' do
    association = described_class.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'Has many recipe foods' do
    association = described_class.reflect_on_association(:recipe_foods)
    expect(association.macro).to eq(:has_many)
  end

  it 'Has many recipes' do
    association = described_class.reflect_on_association(:recipes)
    expect(association.macro).to eq(:has_many)
  end
end
