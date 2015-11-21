# Task controller
class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:create, :destroy, :status]

  def create
    @task = @list.tasks.new(task_params.merge(status: false))

    respond_to do |format|
      if @task.save
        format.js
      else
        format.js { render json: 'Error', status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list.tasks.destroy(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def status
    @task = @list.tasks.find(params[:id])
    @task.status = params[:status]

    respond_to do |format|
      if @task.save
        format.json { render json: @task.status }
      else
        format.js { render json: 'Error', status: :unprocessable_entity }
      end
    end
  end

  private

  def set_list
    @list = current_user.lists.find(params[:list_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:name)
  end
end
