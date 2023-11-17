class BooksController < ApplicationController
  def new
    @book = Book.new
    @books = Book.page(params[:page])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def edit
  end

  #投稿データのストロングラパラメータ
  private

  def book_params
    params.require(:book).permit(:shop_name, :image, :caption)
  end

end
