class ClothersController < ApplicationController
  CLOTHER_PER_PAGE=3
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
    text="clother created"
    TelegramMailer.send_group_message(text).deliver_now
    user=session[:user_id]
    TelegramMailer.send_private_message(text,user).deliver_now
    redirect_to @clother, notice: :"Successfully checked in"

  end

  def new
  end
  def index
    @page=params.fetch(:page, 0).to_i
    @clothers = Clother.offset(@page*CLOTHER_PER_PAGE).all.order('price DESC', 'created_at').limit(CLOTHER_PER_PAGE)
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
      flash[:notice] = 'Clother updated!';
      text="clother updated"
      TelegramMailer.send_group_message(text).deliver_now
      user=session[:user_id]
      TelegramMailer.send_private_message(text,user).deliver_now
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
    text="clother deleted"
    TelegramMailer.send_group_message(text).deliver_now
    user=session[:user_id]
    TelegramMailer.send_private_message(text,user).deliver_now
    flash[:notice] = 'Clother has been deleted'
    redirect_to action: :index
  end

end
