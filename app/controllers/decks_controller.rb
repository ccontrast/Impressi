class DecksController < ApplicationController
  layout "deck", :except => :new
  
  #before_filter :authenticate_user!, :only => [:edit, :update]
  
  def new
    # random_number = rand(99999999999)
    #  user = User.create!(:email => "user#{random_number}@gmail.com", :password => "foobar", :password_confirmation => "foobar")
    #  sign_in(user)
    #  # session[:guest_user] = user.id
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
      flash[:error] = 'Looks like that presentation already exists!'
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
    puts params['content']['0']['id'].inspect
    # deck = Deck.find(params[:id])
    #     new_content = params[:content]
    #     deck.deck_data.each_with_index do |step, i|
    #       step['content'] = new_content[i]
    #     end
    #
    # deck.user_id = current_user.id if user_signed_in?
    #     
    #     respond_to do |format|
    #       if deck.save
    #         flash.now[:success] = "Presentation saved"
    #         format.js 
    #       else
    #         render :text => 'Failed Ajax call.'
    #       end
    #     end
  end

  def delete
    
  end

  def show
    deck_id = Deck.alphadecimal_to_id(params[:id])
    @deck = Deck.find(deck_id)
  end
end
