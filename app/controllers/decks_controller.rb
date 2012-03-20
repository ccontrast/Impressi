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
    
    respond_to do |format|
      if @new_deck.save
        flash[:notice] = 'Deck successfully created.'
        format.html { redirect_to(edit_deck_path(@new_deck.id)) }
      else
        format.html { redirect_to(new_deck_path) }
      end
    end
  end
  
  def edit
    @deck = Deck.find(params[:id])
  end

  def update
    deck = Deck.find(params[:id])
    new_content = params[:content]
    deck.deck_data.each_with_index do |step, i|
      step[:content] = new_content[i] + 'test'
    end
    if deck.save
      render :nothing => true
    else
      redirect_to(edit_deck_path(deck.id))
    end
  end

  def delete
    
  end

  def show
    @sample = Deck.find(1)
    render :json => @sample 
    #respond_to do |format|
    #  format.html { 
    #    @templates = Deck.find_all_by_template(true)
    #    @template_names = @templates.map { |template| template.name }
    #    @deck = Deck.new
    #    render :new
    #  }
    #  format.json { :json => @sample }
    #end
  end
end
