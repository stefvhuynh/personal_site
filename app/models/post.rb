class Post < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_title_and_body, against: [:title, :body]
  default_scope { order(created_at: :desc) }
  
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
  
  def display
    self.body.html_safe
  end
  
end
