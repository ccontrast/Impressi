class Deck < ActiveRecord::Base
  belongs_to :user
  serialize :deck_data
  before_save :content?
  
  attr_accessible :name, :template
  
  validates :name, presence: true,
                   uniqueness: true
                   
  def url
    "/pressi/#{id.alphadecimal}"
  end
  
  def self.alphadecimal_to_id(pressi_ad)
    pressi_ad.alphadecimal
  end
  
  def content?
    return false unless deck_data.kind_of?(Array)
    return false if deck_data.empty?
    message = true
    deck_data.each { |step| return message = false unless step['content'] }
    message
  end
end