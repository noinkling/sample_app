class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :not_signed_in,  only: [:new, :create]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy


  def index
    @users = User.order(:id).paginate(page: params[:page]) # Order by id for postgres
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    unless signed_in?
      @user = User.new
    else
      flash[:error] = "You are already signed in. Sign out first if you wish to create a new user."
      redirect_to current_user
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    unless current_user?(user)
      user.destroy
      flash[:success] = "User deleted."
      redirect_to users_url
    else
      flash[:error] = "Admin users cannot delete themselves!"
      redirect_to user_url(user)
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def not_signed_in
      if signed_in?
        redirect_to current_user, notice: "You are already signed in. Sign out first if you wish to create a new user."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
