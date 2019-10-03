class ToDoListController < ApplicationController
  def index
    @projects = Project.all
    @todos = Todo.all
    @projects_titles=Project.all.map{|u| [ u.title, u.id ] }
  end

  def update
  end

  def create
    @todo=Todo.new(todo_params)
    @todo.save
    redirect_to action: "index"
  end
end
