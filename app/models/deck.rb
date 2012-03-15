class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :steps
  
  def generate_html
  end
  
end
