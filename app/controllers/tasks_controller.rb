class TasksController < ApplicationController
  before_action :all_tasks, only: [:index, :create, :update, :destroy]
  before_action :find_task, only: [:edit, :update, :destroy]
  respond_to :html, :js

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
  end

  def update
    @task.update_attributes(task_params)
  end

  def destroy
    @task.destroy
  end


  private

  def all_tasks
    @tasks = Task.all
  end

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
