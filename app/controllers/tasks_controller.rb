# Task controller
class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:create, :destroy, :status]

  def create
    @task = @list.tasks.new(task_params.merge(status: false))

    respond_to do |format|
      if @task.save
        create_task @task
        format.js
      else
        format.js { render json: 'Error', status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list.tasks.destroy(params[:id])
    delete_task(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def status
    @task = @list.tasks.find(params[:id])
    @task.status = params[:status]

    respond_to do |format|
      if @task.save
        change_status @task
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

  def set_ws
    Socky::Client.new('https://morning-taiga-3393.herokuapp.com/http/to_do', 'to_do_secret_123')
  end

  def create_task(task)
    set_ws.trigger!('create_task', channel: @list.slug, data: task)
  end

  def delete_task(id)
    set_ws.trigger!('delete_task', channel: @list.slug, data: id)
  end

  def change_status(task)
    set_ws.trigger!('change_status', channel: @list.slug, data: task)
  end
end
