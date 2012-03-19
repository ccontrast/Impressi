class PagesController < ApplicationController
  def home
    @title = 'Impressi'
  end
  
  def impress
    render '/jquery_test/impress.html'
  end
end
