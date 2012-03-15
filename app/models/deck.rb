class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :steps
  
  def create_impress_html_file
    # prepare a boilerplate file for writing to the middle of
    collection_of_steps = self.steps.sort_by {|x| x.order_in_deck}
    collection_of_steps.each do |step|
      boilerplate_file.write(generate_step_html step)
    end
  end
    # for each step, create div tag with attributes of step object
    # => close div attributes tag
    # => fill text with content data for that step
    # => create closing tag for div
  def generate_step_html step
    output = "<div class='step" << (step.border? ? " slide' " : "' ")
    output << "data-x='#{step.x_position}' "      if step.x_position != 0
    output << "data-y='#{step.y_position}' "      if step.y_position != 0
    output << "data-z='#{step.z_position}' "      if step.z_position != 0
    output << "scale='#{step.scale}' "            if step.scale != 1
    output << "data-rotate-x='#{step.rotate_x}' " if step.rotate_x != 0
    output << "data-rotate-y='#{step.rotate_y}' " if step.rotate_y != 0
    output << "data-rotate='#{step.rotate_z}' "   if step.rotate_z != 0
    output << ">\n"
    output << " #{step.content}\n"
    output << "</div>\n"
    
    output
  end
  
end
