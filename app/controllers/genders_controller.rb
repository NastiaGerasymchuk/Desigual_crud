class GendersController < ApplicationController
  def index
    @genders = Gender.all.order('name', 'created_at')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @genders}
      format.json { render json: @genders}
    end
  end

  def show
    @gender=Gender.find_by_id(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @gender}
      format.json { render json: @gender}
    end
  end

  def new

  end

  def edit
    @gender = Gender.find(params[:id])
  end

  def update
    @gender = Gender.find(params[:id])
    if @gender.update_attribute(:name, params[:gender][:name])
      flash[:notice] = 'Gender updated!'
      redirect_to @gender
    else
      flash[:error] = 'Failed to edit gender!'
      render :edit
    end
  end
  # def edit
  # end
  # def update
  #   respond_to do |format|
  #     if @gender.update(recipe_params)
  #       format.html { redirect_to @gender, notice: 'Gender was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @gender }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @gender.errors, status: :unprocessable_entity }
  #     end
  #   end
  #
  # end

  def create
    @gender = Gender.new(params.require(:gender).permit(:name))
    respond_to do |format|
      unless @gender.persisted?
      if @gender.save
        # Tell the UserMailer to send a welcome email after save

        format.html { redirect_to(@gender, notice: 'Gender was successfully created.') }
        format.json { render json: @gender, status: :created, location: @gender }
      else
        format.html { render action: 'new' }
        format.json { render json: @gender.errors, status: :unprocessable_entity }
      end
      end

    end
    # @gender.save
    # redirect_to @gender
  end

  def destroy
    @gender = Gender.find(params[:id])
    @gender.destroy
    params[:id] = nil
    flash[:notice] = 'Gender has been deleted'
    redirect_to action: :index
  end




end
