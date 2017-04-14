class LogsController < ApplicationController
  before_action :set_log, only: [:destroy]

  # GET /logs
  def index
    @logs = current_user.logs.all
  end

  # GET /logs/new
  def new
    @log = Log.new
  end


  # POST /logs
  def create
    @log = current_user.logs.new(log_params)

    if @log.save
      redirect_to logs_path, notice: 'Log was successfully created.'
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def log_params
      params.require(:log).permit(:player_two, :played_date, :player_one_score, :player_two_score)
    end
end
