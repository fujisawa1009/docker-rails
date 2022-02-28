class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    Board.create(board_params)
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  #インスタンスをviewに渡す必要がないためローカル変数に代入に修正
  def update
    board = Board.find(params[:id])
    board.update(board_params)
    redirect_to board
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end
