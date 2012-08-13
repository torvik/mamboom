class TasksController < ApplicationController
	#before_filter :signed_in_user , only: [:create, :destroy]

  def index
  end

  def create
    @task = current_user.tasks.build(params[:task])
    if @task.save
      flash[:success] = "Task created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    #@task.destroy
    flash[:success] = "Task destroyed."
    redirect_to root_path
  end

  private

    def correct_user
      @task = current_user.tasks.find(params[:id])
    rescue
      redirect_to root_path
    end

end
