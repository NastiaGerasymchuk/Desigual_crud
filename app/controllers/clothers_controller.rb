class ClothersController < ApplicationController
  def show
    @clother = Clother.find_by_id(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @clother}
      format.json { render json: @clother}
    end
  end

  def create
    @clother = Clother.new(params.require(:clother).permit(:price, :description, :image, :trend_id, :nominal_id, :gender_id, :category_id))
    @clother.save
    p @clother
    redirect_to @clother, notice: :"Successfully checked in"

  end

  def new
  end
  def index
    @clothers = Clother.all.order('price DESC', 'created_at')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @clothers}
      format.json { render json: @clothers}
    end
  end
  def edit
    @clother = Clother.find(params[:id])
  end

  def update
    @clother = Clother.find(params[:id])
    if @clother.update_attribute(:description, params[:clother][:description])&&
      @clother.update_attribute(:price, params[:clother][:price])&&
      @clother.update_attribute(:image, params[:clother][:image])&&
      @clother.update_attribute(:trend_id, params[:clother][:trend_id])&&
      @clother.update_attribute(:nominal_id, params[:clother][:nominal_id])&&
      @clother.update_attribute(:gender_id, params[:clother][:gender_id])&&
      @clother.update_attribute(:category_id, params[:clother][:category_id])
      flash[:notice] = 'Clother updated!'
      redirect_to @clother
    else
      flash[:error] = 'Failed to edit clother!'
      render :edit
    end
  end
  def destroy
    @clother = Clother.find(params[:id])
    @clother.destroy
    params[:id] = nil
    flash[:notice] = 'Clother has been deleted'
    redirect_to action: :index
  end

end
