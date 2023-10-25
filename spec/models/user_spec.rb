require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Has many foods' do
    association = described_class.reflect_on_association(:foods)
    expect(association.macro).to eq(:has_many)
  end

  it 'Has many recipes' do
    association = described_class.reflect_on_association(:recipes)
    expect(association.macro).to eq(:has_many)
  end
end
