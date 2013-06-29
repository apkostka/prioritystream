class TasksController < ApplicationController
	before_filter :signed_in_user, only: [:index, :create, :update, :edit, :destroy]
  before_filter :correct_user,   only: [:destroy, :edit, :update]

	def index
		@tasks = Task.all
		@user = current_user
	end

	def new
		@task = Task.new
	end

	def create
    @task = current_user.tasks.build(params[:task])
    @task.priority = Task.maximum("priority") + 1
    if @task.save
      flash[:success] = "Task created!"
      redirect_to '/tasks'
    else
      render 'tasks'
    end
	end

	def edit
    @task = Task.find(params[:id])
	end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:success] = "Profile Updated"
      redirect_to '/tasks'
    else
      render 'edit'
    end
  end

  def update_all
    params['task'].keys.each do |id|
      @task = Task.find(id.to_i)
      @task.update_attributes(params['task'][id])
    end
    redirect_to '/tasks'
  end

	def destroy
    @task.destroy
    flash[:success] = "Task Deleted"
    redirect_to @tasks
	end

  private

    def correct_user
      @task = current_user.tasks.find_by_id(params[:id])
      redirect_to root_url if @task.nil?
    end

end
