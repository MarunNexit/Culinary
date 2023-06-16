class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    existing_user = User.find_by(email: user_params[:email])
    if existing_user
      flash.now[:alert] = 'User with this email already exists.'
      render :new
    else
      @user = User.new(user_params)
      if valid_email?(@user.email) && @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: 'Registration successful!'
      else
        flash.now[:alert] = 'Invalid email format. Please enter a valid email address.'
        render :new
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @liked_recipes = @user.likes.map(&:recipe)
    @recipes_added = @user.recipes
  end


  def liked_recipes
    @user = User.find(params[:id])
    @liked_recipes = @user.liked_recipes
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


  def valid_email?(email)
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    email.match?(email_regex)
  end
end