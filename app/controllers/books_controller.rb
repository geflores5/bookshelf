class BooksController < ApplicationController
  def index
    @books = if params[:term]
      Book.where('title LIKE ?', "%#{params[:term]}%").or(Book.where('author LIKE ?', "%#{params[:term]}%")).or(Book.where('genre LIKE ?', "%#{params[:term]}%")).or(Book.where('classification LIKE ?', "%#{params[:term]}"))
    #elsif params[:term].is_a?(Integer) == true
    #  Book.where('year LIKE ?', "%#{params[:term]}%")
    else
      Book.all
    end
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

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :classification, :year, :term)
  end

end
