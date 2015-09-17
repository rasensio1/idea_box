class Idea < ActiveRecord::Base
  belongs_to :user
  
  validates :title, :body, :user_id, presence: true,
                                     uniqueness: true
end

