class SittersController < ApplicationController
  before_action :authenticate_sitter_user!, except: [:all_sitters, :approve_sitter]
  before_action :set_sitter, only: [:show, :edit, :update, :destroy]

  # GET /sitters
  # GET /sitters.json
  def index
    @sitter = current_sitter_user.sitter
  end

  def all_sitters
    @sitters = Sitter.all
  end

  def approve_sitter
    params.permit(:sitter_id)
    sitter_id = params[:sitter_id]
    if ApprovedSitter.find_by(sitter_id: sitter_id, owner_id: current_owner_user.owner.id)
      flash[:notice] = 'You have already approved this sitter'
    else
      @approve_sitter = ApprovedSitter.create(:owner_id => current_owner_user.owner.id, :sitter_id => params[:sitter_id])
      flash[:notice] = "Sitter succesfully approved"
    end
    redirect_to owners_sitters_path
    
    # create an approved sitter row
    # current_sitter_user call method in controller with id of the sitter
  end

  # GET /sitters/1
  # GET /sitters/1.json
  def show
  end

  # GET /sitters/new
  def new
    @sitter = Sitter.new
  end

  # GET /sitters/1/edit
  def edit
  end

  # POST /sitters
  # POST /sitters.json
  def create
    @sitter_user = current_sitter_user
    @sitter = Sitter.create(sitter_params)
    @sitter_user.sitter = @sitter

    if @sitter.save
      redirect_to sitters_path
    else
      render :new
    end
  end

  # PATCH/PUT /sitters/1
  # PATCH/PUT /sitters/1.json
  def update
    respond_to do |format|
      if @sitter.update(sitter_params)
        format.html { redirect_to @sitter, notice: 'Sitter was successfully updated.' }
        format.json { render :show, status: :ok, location: @sitter }
      else
        format.html { render :edit }
        format.json { render json: @sitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sitters/1
  # DELETE /sitters/1.json
  def destroy
    @sitter.destroy
    respond_to do |format|
      format.html { redirect_to sitters_url, notice: 'Sitter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sitter
      @sitter = Sitter.find_by_sitter_user_id(current_sitter_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sitter_params
      params.require(:sitter).permit(:name, :address, :suburb, :state, :postcode, :business_name, :price, :sitter_user_id)
    end
end
