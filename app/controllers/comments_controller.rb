class CommentsController < ApplicationController
    def new
        @board = Board.find(params[:board_id])
        @task = @board.tasks.find(params[:task_id])
        @comment = @task.comments.build
    end

    def create
        @board = Board.find(params[:board_id])
        @task = @board.tasks.find(params[:task_id])
        @comment = @task.comments.build(comment_params)
        if @comment.save
            redirect_to board_task_path(@board, @task), notice: 'Save successful'
        else
            flash.now[:error] = 'Could not save'
            render :new
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:description)
    end
end