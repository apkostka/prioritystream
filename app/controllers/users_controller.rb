class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :show, :destroy]
  before_filter :admin_user, only: [:new, :create, :destroy]

	def index
    @users = User.all
	end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "New user created!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
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
    if current_user == User.find(params[:id])
      flash[:error] = "What the hell are you doing?"
      redirect_to users_url
    else
    	User.find(params[:id]).destroy
      flash[:success] = "User destroyed."
      redirect_to users_url
    end
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path, notice: "Who do you think you are? Shame on you." unless current_user?(@user)
    end

    def admin_user
      redirect_to root_path, notice: "You are not allowed to do that." unless current_user.admin?
    end

end