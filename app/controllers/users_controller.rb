class UsersController < ApplicationController

 def index
      @users = User.all
      @books = Book.new
      @user = current_user
 end

 def show
     @user = User.find(params[:id])
     @book = Book.new
     @books = @user.books
 end

 def edit
     @user = User.find(params[:id])
     if @user == current_user
      render "edit"
     else
      redirect_to user_path(current_user)
     end
 end


 def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    @user = User.find(params[:id])
    redirect_to book_path(@book)

 end
 def update
    @user = User.find(params[:id])
   if @user.update(user_params)
    flash[:notice] = "Update successfully"
    redirect_to user_path(@user)
   else
    render :edit
   end
 end
 private
  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end

end
