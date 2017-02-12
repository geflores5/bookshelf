class BooksController < ApplicationController
  def index
    @book = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.invalid?
      flash[:error] = '<strong>Could not save</strong> invalid data.'
    end
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :classification, :year)
  end

end
