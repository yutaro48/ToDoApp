class TasksController < ApplicationController

    def show
        @board = Board.find(params[:board_id])
        @task = Task.find(params[:id])
        @comments = @task.comments
    end

    def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build
    end

    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params)
        if @task.save
            redirect_to board_path(board), notice: 'Save successful'
        else
            flash.now[:error] = 'Could not save'
            render :new
        end
    end

    def edit
        @board = Board.find(params[:board_id])
        @task = Task.find(params[:id])
    end

    def update
        @board = Board.find(params[:board_id])
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to board_task_path(@board, @task), notice: 'Update successful'
        else
            flash.now[:error] = 'Could not update'
            render :edit
        end
    end

    def destroy
        @board = Board.find(params[:board_id])
        @task = Task.find(params[:id])
        @task.destroy!
        redirect_to board_path(@board), notice: 'Delete successful'
    end

    private
    def task_params
        params.require(:task).permit(:name, :description, :date)
    end
end