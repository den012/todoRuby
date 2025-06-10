class TodoListsController < ApplicationController
  def index
    @todo_lists = current_user.todo_lists.includes(:tasks)
    @new_todo_list = current_user.todo_lists.build
    @new_task = Task.new
  end

  def create
    @todo_list = current_user.todo_lists.create(todo_list_params)
    redirect_to root_path
  end

  def destroy
    current_user.todo_lists.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:title)
  end
end