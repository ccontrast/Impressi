class DecksController < ApplicationController
  #before_filter :authenticate_user!
  
  def new
    @deck = current_user.decks.new
  end

  def create
  end
  
  def edit
    
  end

  def update
    
  end

  def delete
    
  end

  def show
    @deck = Deck.first
    # redirect_to 'decks/show/#/step-1'
  end
end
