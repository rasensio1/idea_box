require 'rails_helper'

RSpec.describe Idea, type: :model do
  it "is valid" do
    idea = Idea.new(title: "first idea", body: "this is th boooody", user_id: 1)
    expect(idea).to be_valid
  end

  it "is not valid without title" do
    idea = Idea.new(body: "this is th boooody")
    expect(idea).to_not be_valid
  end

  it "is not valid without body" do
    idea = Idea.new(title: "title")
    expect(idea).to_not be_valid
  end

  it "is not valid without user_id" do
    idea = Idea.new(title: "title", body: "booody")
    expect(idea).to_not be_valid
  end

  it "cannot save duplicate usernames" do
    Idea.create(title: "first idea", body: "this is th boooody", user_id: 1)
    idea = Idea.new(title: "first idea", body: "this is th boooody", user_id: 1)
    expect(idea).to_not be_valid 
  end
end
