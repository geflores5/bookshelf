class BooksController < ApplicationController
  def index
    @books = if params[:term]
      # Book.where('title LIKE ?', "%#{params[:term]}%")
      Book.where('author LIKE ?', "%#{params[:term]}%")
      # Book.where('genre LIKE ?', "%#{params[:term]}%")
      # Book.where('classification LIKE ?', "%#{params[:term]}%")
    else
      Book.all
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

end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.create(book_params)
    if @book.invalid?
      flash[:error] = '<strong>Could not save</strong> invalid data.'
    end
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :classification, :year, :term, tasks_attributes: [:id, :_destroy])
  end

end
