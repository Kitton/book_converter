class BookController < ApplicationController
  def create
    uploaded_io = params[:book]
    File.open(Rails.root.join('public', 'upload_books', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    redirect_to action: :show
  end

  def show
  end
end