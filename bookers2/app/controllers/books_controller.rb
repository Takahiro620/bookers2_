class BooksController < ApplicationController
  def new
  @book = Book.new
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
    @user = current_user
    @users = User.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to books_path(@book.id)
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
    @book.update(book_params)
    flash[:notice] = "successfully"
    redirect_to book_path(@book.id)
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
end
