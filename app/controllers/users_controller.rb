class UsersController < ApplicationController

	def index

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
  		flash[:success] = "New user created!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	if @user.destroy
  		flash[:success] = "User deleted!"
  		render 'home'
  	end
  end
end