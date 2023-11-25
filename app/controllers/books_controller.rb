class BooksController < ApplicationController
  def new
    @book = Book.new
    @books = Book.page(params[:page])
  end

  def create
    @user = current_user #currentuserのすべての情報を@userへ
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "Book created successfully."
    redirect_to book_path(@book)
    else
    flash[:notice] = "Validation error: Please check the input."
    render :index #このアクション内に定義要
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
    flash[:notice] = "You have updated book successfully." #updateアクションが成功したら遷移先画面でコメント表示
    redirect_to book_path(book.id)
    else
    flash[:notice] = "Validation error: Please check the input."
    render 'edit'
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @books = @user.books.page(params[:page])
  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user.id
      redirect_to books_path()
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  #投稿データのストロングラパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
