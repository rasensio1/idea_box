require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid' do
    category = Category.new(name: "Life" )
    expect(category).to be_valid
  end

  it 'is not valid without name' do
    category = Category.new()
    expect(category).to_not be_valid
  end
end
