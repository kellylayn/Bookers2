class BooksController < ApplicationController
  def index
    @user = current_user
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
    is_matching_login_user
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def update
    is_matching_login_user
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :opinion)
  end

  def is_matching_login_user
    @book = Book.find(params[:id])
    user_id = @book.user(params[:id]).to_i
    unless user_id == current_user.id
      redirect_to books_path
    end
  end
end
