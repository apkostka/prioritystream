class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :show, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update]

	def index
    @users = User.all
	end

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
  		flash[:success] = "New user created!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  	@user = User.find(params[:user])
  	if @user.destroy
  		flash[:success] = "User deleted!"
  		render 'home'
  	end
  end

  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in." unless signed_in?
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path, notice: "Who do you think you are? Shame on you." unless current_user?(@user)
    end
end