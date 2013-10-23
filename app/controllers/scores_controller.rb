class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :edit, :destroy]
  before_action :set_game, only: [:new, :index, :show, :edit, :destroy, :create]
  
  def index
    @scores = Score.all
  end

  def show
  end
  
  def new
    #@score = @game.scores.create
  end
  
  def create
    @game = Game.find(params[:game_id])
    @score = @game.scores.create(score_params)

    respond_to do |format|
      if @score.save
        format.html { redirect_to @game, notice: "Score was successfully logged for #{@score.player}." }
        format.json { render action: 'show', status: :created, location: @score }
      else
        format.html { render action: 'new' }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @score.destroy
    respond_to do |format|
      format.html { redirect_to game_url @game }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:game_id])
    end
    
    def set_score
      @score = Score.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.require(:score).permit(:player,:rank)
    end
  
end
