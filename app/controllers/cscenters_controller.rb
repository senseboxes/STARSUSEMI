class CscentersController < ApplicationController
  before_action :set_cscenter, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [ :index, :show ]
  # GET /cscenters
  # GET /cscenters.json
  def index
    @cscenters = Cscenter.order(created_at: :desc)
  end

  # GET /cscenters/1
  # GET /cscenters/1.json
  def show
  end

  # GET /cscenters/new
  def new
    @cscenter = Cscenter.new
  end

  # GET /cscenters/1/edit
  def edit
  end

  # POST /cscenters
  # POST /cscenters.json
  def create
    @cscenter = Cscenter.new(cscenter_params)
    @cscenter.user = current_user

    respond_to do |format|
      if @cscenter.save
        format.html { redirect_to @cscenter, notice: 'Cscenter was successfully created.' }
        format.json { render :show, status: :created, location: @cscenter }
      else
        format.html { render :new }
        format.json { render json: @cscenter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cscenters/1
  # PATCH/PUT /cscenters/1.json
  def update
    respond_to do |format|
      if @cscenter.update(cscenter_params)
        format.html { redirect_to @cscenter, notice: 'Cscenter was successfully updated.' }
        format.json { render :show, status: :ok, location: @cscenter }
      else
        format.html { render :edit }
        format.json { render json: @cscenter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cscenters/1
  # DELETE /cscenters/1.json
  def destroy
    @cscenter.destroy
    respond_to do |format|
      format.html { redirect_to cscenters_url, notice: 'Cscenter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cscenter
      @cscenter = Cscenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cscenter_params
      params.require(:cscenter).permit(:title, :content, :user_id)
    end
end
