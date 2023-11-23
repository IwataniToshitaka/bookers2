class BooksController < ApplicationController
  def new
    @book = Book.new
    @books = Book.page(params[:page])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path(@book)
  end

  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @books = @user.books.page(params[:page])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "You have updated book successfully." #updateアクションが成功したら遷移先画面でコメント表示
    redirect_to book_path(book.id)
  end


  #投稿データのストロングラパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
