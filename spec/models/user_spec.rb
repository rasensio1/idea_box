require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creating users' do

    it 'with valid params' do
      user = User.new(username: 'ryry62ry', password: 'hello')

      expect(user).to be_valid
      expect(user.role).to eql(0)
    end

    it 'with invalid params' do
      user = User.new()

      expect(user).to_not be_valid
    end

    it 'with duplicate un' do
      User.create(username: 'ryry62ry', password: 'hello')
      user = User.new(username: 'ryry62ry', password: 'hello')

      expect(user).to_not be_valid
    end

    it 'can set an admin' do
      user = User.new(username: 'ryry62ry', password: 'hello')
      user.update(role: 1)

      expect(user.role).to eql(1)
    end

  end
end
