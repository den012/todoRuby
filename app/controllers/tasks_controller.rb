class TasksController < ApplicationController
  def create
    @todo_list = current_user.todo_lists.find(params[:todo_list_id])
    @todo_list.tasks.create(task_params)
    redirect_to root_path
  end

  def destroy
    @todo_list = current_user.todo_lists.find(params[:todo_list_id])
    @todo_list.tasks.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end
end