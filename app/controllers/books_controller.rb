class BooksController < ApplicationController
  def new
    @book = Book.new
    @books = Book.page(params[:page])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(current_user.id)
  end

  def index
    @books = Book.all
  end

  def show
    @books = Book.all
  end

  def edit
  end

  #投稿データのストロングラパラメータ
  private

  def book_params
    params.require(:book).permit(:name, :image, :introduction, :user_id)
  end

end
