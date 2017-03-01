class AuthorsController < ApplicationController

  def index
    @authors = if params[:term]
      Author.where('first_name LIKE ? OR last_name LIKE ? OR age = ?',
      "%#{params[:term]}%", "%#{params[:term]}%", "#{params[:term].to_i}")
    else
      Author.all
    end
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to root_path, notice: 'Author successfully created.'
    else
      render :new, alert: '<strong>Could not save</strong> invalid data.'
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find_by(id: params[:id])

    if @author && @author.update_attributes(book_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @author = Author.find_by(id: params[:id])

    if @author
      @author.destroy
      redirect_to root_path, notice: 'Author successfully deleted'
    else
      redirect_to root_path, alert: 'AuthorS does not exist'
    end
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :age, :term)
  end
end
