class TasksController < ApplicationController
  before_action :redirect_unless_logged_in

  protect_from_forgery except: :create

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to root_path, flash: { success: 'Your task has been successfully created :)' }
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update; end

  def destroy
    task = Task.find_by(id: params[:id])
    binding.pry
    task.destroy
    redirect_to root_path, flash: { success: 'Task deleted' }
  end

  private

  def task_params
    params.require(:task).permit(
      :title,
      :start_at,
      :finish_at,
      :description
    )
  end
end
