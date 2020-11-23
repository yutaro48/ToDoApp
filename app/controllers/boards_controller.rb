class BoardsController < ApplicationController
    before_action :set_article, only: [:edit, :update]
    before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]

    def index
        @boards = Board.all
    end

    def show
        @board = Board.find(params[:id])
        @tasks = @board.tasks
    end

    def new
        @board = current_user.boards.build
    end

    def create
        @board = current_user.boards.build(board_params)
        if @board.save
            redirect_to board_path(@board), notice: 'Save successful'
        else
            flash.now[:error] = 'Could not save'
            render :new
        end
    end

    def edit
    end

    def update
        if @board.update(board_params)
            redirect_to board_path(@board), notice: 'Update successful'
        else
            flash.now[:error] = 'Could not update'
            render :edit
        end
    end

    def destroy
        board = current_user.boards.find(params[:id])
        board.destroy!
        redirect_to root_path, notice: 'Delete successful'
    end

    private
    def board_params
        params.require(:board).permit(:name, :description)
    end

    def set_article
        @board = current_user.boards.find(params[:id])
    end

end