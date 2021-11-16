class NominalsController < ApplicationController
  def new
  end

  def create
    @nominal = Nominal.new(params.require(:nominal).permit(:name))
    @nominal.save
    redirect_to @nominal
  end

  def show
    @nominal=Nominal.find_by_id(params[:id])
  end

  def index
    @nominals = Nominal.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @nominals}
      format.json { render json: @nominals}
    end
  end
end
