class BookController < ApplicationController
  def create
    uploaded_io = params[:book]
    sanitized_filename = uploaded_io.original_filename.gsub(/[^0-9A-z.\-]/, '_')
    File.open(Rails.root.join('public', 'upload_books', sanitized_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    mobi_sanitized_filename = "#{sanitized_filename}.mobi"
    exec("ebook-convert #{Rails.root.join('public', 'upload_books', sanitized_filename)} #{Rails.root.join('public', 'upload_books', mobi_sanitized_filename)}")
    flash[:book_to_show] = mobi_sanitized_filename
    redirect_to controller: :welcome, action: :index
  end
end