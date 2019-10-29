class SittersController < ApplicationController
  before_action :authenticate_sitter_user!
  before_action :set_sitter, only: [:show, :edit, :update, :destroy]

  # GET /sitters
  # GET /sitters.json
  def index
    @sitter = current_sitter_user.sitter
  end

  # GET /sitters/1
  # GET /sitters/1.json
  def show
  end

  # GET /sitters/new

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
      redirect_to @sitter
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
