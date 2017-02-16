class BooksController < ApplicationController
  def index
    @books = if params[:term]
      Book.where('title LIKE ? OR author LIKE ? OR genre LIKE ? OR classification LIKE ? OR year = ?',
      "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%", "#{params[:term].to_i}")
    else
      Book.all
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to root_path, notice: 'Book successfully created.'
    else
      render :new, alert: '<strong>Could not save</strong> invalid data.'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])

    if @book && @book.update_attributes(book_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy

    #raise params

    @book = Book.find_by(id: params[:id])

    if @book
      @book.destroy
      redirect_to root_path, notice: 'Book successfully deleted'
    else
      redirect_to root_path, alert: 'Book does not exist'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :classification, :year, :term)
  end

end
