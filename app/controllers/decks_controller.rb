class DecksController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @deck = current_user.decks.new
  end

  def create
    @deck = current_user.decks.new(params[:deck])
    if @deck.save
      flash[:succes] = "hey it worked"
      redirect_to @deck
    else
      render 'new'
    end  
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
