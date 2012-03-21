class TemplatesController < ApplicationController
  def new
    @template = Deck.new
  end
  
  
end
