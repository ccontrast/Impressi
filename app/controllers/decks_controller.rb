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
  end
end
