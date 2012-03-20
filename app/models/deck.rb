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
  
  def self.find_by_alphadecimal(pressi_id)
    Deck.find(pressi_id.alphadecimal.to_i)
  end
  
    # for each step, create div tag with attributes of step object
    # => close div attributes tag
    # => fill text with content data for that step
    # => create closing tag for div
  # def generate_step_html
  #    
  #   output = "<div class='step" << (step.border? ? " slide' " : "' ")
  #   output << "data-x='#{step.x_position}' "      if step.x_position != 0
  #   output << "data-y='#{step.y_position}' "      if step.y_position != 0
  #   output << "data-z='#{step.z_position}' "      if step.z_position != 0
  #   output << "scale='#{step.scale}' "            if step.scale != 1
  #   output << "data-rotate-x='#{step.rotate_x}' " if step.rotate_x != 0
  #   output << "data-rotate-y='#{step.rotate_y}' " if step.rotate_y != 0
  #   output << "data-rotate='#{step.rotate_z}' "   if step.rotate_z != 0
  #   output << ">\n"
  #   output << " #{step.content}\n"
  #   output << "</div>\n"
  #   
  #   output
  # # end
  
  
  # def html
  #   
  #   output = ""
  #   
  #   deck_data.each do |step|
  #     
  #     output << "<div class='step" << (step.border ? " slide' " : "' ")
  #     
  #     output << "data-x='#{step.position_x}' "      if step.position_x.to_i != 0
  #     output << "data-y='#{step.position_y}' "      if step.position_y.to_i != 0
  #     output << "data-z='#{step.position_z}' "      if step.position_z.to_i != 0
  #     output << "scale='#{step.scale}' "            if step.scale.to_i != 1
  #     output << "data-rotate-x='#{step.rotate_x}' " if step.rotate_x.to_i != 0
  #     output << "data-rotate-y='#{step.rotate_y}' " if step.rotate_y.to_i != 0
  #     output << "data-rotate-z='#{step.rotate_z}' " if step.rotate_z.to_i != 0
  #     output << ">\n"
  #     output << " #{step.content}\n"
  #     output << "</div>\n"
  #   end
  #   
  #   output
  #   
  # end
  
  def content?
    return false unless deck_data.kind_of?(Array)
    return false if deck_data.empty?
    message = true
    deck_data.each { |step| return message = false unless step['content'] }
    message
  end
end
# 
# class Step
#   attr_accessor :content, :border, :position_x, :position_y, :position_z,
#                 :rotate_x, :rotate_y, :rotate_z, :scale
# end