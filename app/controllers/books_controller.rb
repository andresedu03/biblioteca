class BooksController < ApplicationController

  before_action :set_book, only: %i[show edit update destroy]

  def index
    @q = Book.ransack(params[:q])
    @book = @q.result(distinct: true)
  end

  def new
    @book = Book.new
    @statuses = Book.statuses.keys.to_a
  end

  def show
    
  end

  def create
    @book = Book.create(book_params)
    respond_to do |format|
      if @book.save
        format.html {redirect_to root_path}
      else
        
        format.html {render :new}
      end
    end

  end

  def edit
    @statuses = Book.statuses.keys.to_a
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  def update
    respond_to do |f|
      if @book.update(book_params)
        f.html {redirect_to @book}
      else
        f.html{render :edit}
      end
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
      params.require(:book).permit(:title, :author, :status, :book_lent_on, :book_returned_on)
  end
end
