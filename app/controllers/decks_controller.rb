class DecksController < ApplicationController
 # before_filter :authenticate_user!, :only => [:]
  
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
      flash[:notice] = "Deck successfully created. The URL for your deck is: #{@new_deck.url}"
      redirect_to(edit_deck_path(@new_deck.id))
    else
      redirect_to(new_deck_path)
    end
  end
  
  def edit
    deck_id = if params[:edit]
      Deck.alphadecimal_to_id(params[:id])
    else
      params[:id]
    end
    
    @deck = Deck.find(deck_id)
  end

  def update
    deck = Deck.find(params[:id])
    new_content = params[:content]
    deck.deck_data.each_with_index do |step, i|
      step['content'] = new_content[i]
    end
    if deck.save
      render :nothing => true
    else
      render :text => 'Failed Ajax call.'
    end
  end

  def delete
    
  end

  def show
    deck_id = Deck.alphadecimal_to_id(params[:id])
    @deck = Deck.find(deck_id)
  end
end
