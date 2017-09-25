class WelcomeController < ApplicationController
  def index
    @book_to_show = flash[:book_to_show]
  end
end
