class BoardsController < ApplicationController

  before_action :set_target_board, only: %i[show edit update destroy]

  def index
    @boards = Board.page(params[:page])
  end

  def new
    @board = Board.new
  end

  def create
    board = Board.create(board_params)
    redirect_to board
    #https://rebellhq.slack.com/services/3185198262914
    notifier = Slack::Notifier.new('https://hooks.slack.com/services/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',channel: '#' + 'note作成')
    #notifier.ping "#{board.name}が作成されました"
    flash[:notice] = "「#{board.title}」の掲示板を作成しました"
  end

  def show
  end

  def edit
  end

  #インスタンスをviewに渡す必要がないためローカル変数に代入に修正
  def update
    @board.update(board_params)
    redirect_to @board
  end

  def destroy
    @board.delete
    redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました" }
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

  def set_target_board
    @board = Board.find(params[:id])
  end

end
