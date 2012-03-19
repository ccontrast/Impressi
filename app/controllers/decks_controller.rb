class DecksController < ApplicationController
  #before_filter :authenticate_user!
  
  def new
    @templates = Deck.find_all_by_template(true)
    @template_names = @templates.map { |template| template.name }
    @deck = Deck.new
  end

  def create
    @template = Deck.find_by_name(params[:deck][:template])
    @new_deck = @template.dup
    @new_deck.name = params[:deck][:name]
    @new_deck.template = false
    
    if @new_deck.save
      render :edit
    else
      redirect new_deck_path
    end
  end
  
  def edit
    
  end

  def update
    
  end

  def delete
    
  end

  def show
    @deck = Deck.find_by_template(true)
  end
end
