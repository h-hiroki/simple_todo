class TodosController < ApplicationController

  def index
    @todo  = Todo.new
    @todos = Todo.where(deleted_at: nil).order(do_date: :asc)
  end

  def create
    @todo = Todo.new(create_params)
    if @todo.save
      redirect_to root_path, notice: '新しいタスクを追加しました。'
    else
      @todos = Todo.where(deleted_at: nil).order(do_date: :asc)
      render :index
    end
  end

  def update
    if Todo.where(id: params[:id]).update(status: 1)
      redirect_to root_path, notice: 'タスク完了しました。'
    else
      redirect_to root_path, alert: '失敗しました。やり直して下さい'
    end
  end

  def destroy
    if Todo.where(id: params[:id]).update(deleted_at: DateTime.now)
      redirect_to root_path, notice: '削除しました。'
    else
      redirect_to root_path, alert: '失敗しました。やり直して下さい'
    end
  end


  private
  def create_params
    params.require(:todo).permit(:do_date, :title)
  end

end
