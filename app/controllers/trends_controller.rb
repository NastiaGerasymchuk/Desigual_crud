class TrendsController < ApplicationController
  def show
    @trend = Trend.find_by_id(params[:id])
  end

  def create
    @trend = Trend.new(params.require(:trend).permit(:name))
    @trend.save
    redirect_to @trend
  end

  def new

  end

  def index
    @trends = Trend.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @trends}
      format.json { render json: @trends}
    end
  end

end
