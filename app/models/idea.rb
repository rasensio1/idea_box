class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  
  validates :title, :body, presence: true,
                                     uniqueness: true
  validates :user_id, presence: true
end

