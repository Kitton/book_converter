class WelcomeController < ApplicationController
  def index
    if flash[:book_to_show].present?
      @book_to_show = flash[:book_to_show]
      @book_path = "upload_books/#{@book_to_show}"
    end
  end
end
