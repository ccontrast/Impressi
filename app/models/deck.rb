require "#{Rails.root}/lib/templates/html_converter.rb"

class Deck < ActiveRecord::Base
  belongs_to :user
  serialize :deck_data
  before_save :content?
  
  attr_accessible :name, :template, :html_template
  
  validates :name, presence: true,
                   uniqueness: true
                  
  def url
    "/pressi/#{id.alphadecimal}"
  end
  
  include HTMLConverter
  
  def html_template
    # return empty string so that html form is blank
    ''
  end
  
  def html_template=(html)
    # function defined to replace the handling of the :html_template entry in the form when params[:deck] is called
    self.deck_data = html_to_deck(html)
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
