class Comment < ActiveRecord::Base
  belongs_to :post
  validates :name, :body, presence: true
  validates :name, uniqueness: true
end
