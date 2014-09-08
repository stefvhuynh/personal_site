class Post < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_text, against: [:title, :body]  
  
  belongs_to :user
  has_many :comments
  validates :title, :body, :user_id, presence: true
    
  def preview
    "#{self.body[0..500]} 
    <br><br>
    <a class='read-more' href='/posts/#{self.id}'>
      Read more
    </a>".html_safe
  end
  
end
