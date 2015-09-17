require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creating users' do

    it 'with valid params' do
      user = User.new(username: 'ryry62ry', password: 'hello')

      expect(user).to be_valid
    end

    it 'with invalid params' do
      user = User.new()

      expect(user).to_not be_valid
    end
  end
end
