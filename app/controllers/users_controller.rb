class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    #アソシエーションを持っているモデル同士の記述
    #個人が投稿した全てを表示できる
  end

  def edit
  end
end
