class Post < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_title_and_body, against: [:title, :body]
  default_scope { order(created_at: :desc) }
  
  belongs_to :user
  has_many :comments
  validates :title, :body, :user_id, presence: true
    
  def preview
    "#{highlighted_body[0..497]}... 
    <br><br>
    <a class='read-more' href='/posts/#{self.id}'>
      Read more
    </a>".html_safe
  end
  
  def display
    highlighted_body.html_safe
  end
  
  def highlighted_body
    code_sections = self.body.scan(/(?<=<code>).*(?=<\/code>)/)
    #
    # highlighted_code = code_sections.each_with_object([]) do |section, array|
    #   array << CodeRay.scan(section, :ruby).div(line_numbers: :table)
    # end
    #
    # highlighted_body = self.body.dup
    # code_sections.each_with_index do |section, index|
    #   highlighted_body.gsub!(section, highlighted_code[index])
    # end
    #
    # highlighted_body
  end
  
end
