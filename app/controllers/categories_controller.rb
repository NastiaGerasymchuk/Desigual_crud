class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @categories}
      format.json { render json: @categories}
    end
  end

  def new
  end

  def show
    @category=Category.find_by_id(params[:id])

  end

  def create
    @category=Category.new(params.require(:category).permit(:name))
    redirect_to @category
    end


end

