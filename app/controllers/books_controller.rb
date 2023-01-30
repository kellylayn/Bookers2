class BooksController < ApplicationController
   before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "投稿成功！successfully !"
      redirect_to book_path(@book.id)
    else
      @user =current_user
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    # @user = Book.user.id
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "更新成功！successfully !"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "削除成功！successfully !"
    redirect_to '/books'
  end

   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    @book = Book.find(params[:id])
    user_id = @book.user_id
    unless user_id == current_user.id
      redirect_to books_path
    end
  end
end
