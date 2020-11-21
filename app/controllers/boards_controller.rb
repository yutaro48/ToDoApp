class BoardsController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update]

    def index
        @boards = Board.all
    end

    def show
    end

    def new
        @board = Board.new
    end

    def create
        @board = Board.new(board_params)
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
        board = Board.find(params[:id])
        board.destroy!
        redirect_to root_path, notice: 'Delete successful'
    end

    private
    def board_params
        params.require(:board).permit(:name, :description)
    end

    def set_article
        @board = Board.find(params[:id])
    end

end