class BooksController < ApplicationController
  def new
    @book = Book.new
    @books = Book.page(params[:page])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    redirect_to book_path(@book)
  end

  def edit
    @book = Book.find(params[:id])
  end

  #投稿データのストロングラパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
