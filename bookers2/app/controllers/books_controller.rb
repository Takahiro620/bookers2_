class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def new
  @book = Book.new
  @books = Book.all
  end




  def show
    @user = current_user
    @book = Book.new
    @books = Book.find(params[:id])
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @books = Book.all
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book)
    else
      render :new
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end
  
  
  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
  
  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user == current_user
      redirect_to books_path
    end
  end
end
