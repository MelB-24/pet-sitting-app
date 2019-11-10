class OwnersController < ApplicationController
  before_action :authenticate_owner_user!
  before_action :set_owner, only: [:show, :edit, :update, :destroy]

  # GET /owners
  # GET /owners.json
  def index
    @owner = current_owner_user.owner
  end

  def my_sitters
    @approved_sitters = ApprovedSitter.where(owner_id: current_owner_user.owner.id)
  end

  def destroy_approved_sitter
    
    params.permit(:approved_sitter_id)
    @approved_sitter = ApprovedSitter.find(params[:approved_sitter_id])
    @approved_sitter.destroy
    redirect_to owners_my_sitters_path

  end


  # GET /owners/1
  # GET /owners/1.json
  def show
  end

  # GET /owners/new
  def new
    @owner = Owner.new
  end

  # GET /owners/1/edit
  def edit
  end

  # POST /owners
  # POST /owners.json
  def create
    # these lines must be out of the if statement otherwise it doesnt find the id from the url to assign to devise. Ideally they should be inside so validation could be added. Since ran out of time to do validation then better to have it working. 
    @owner_user = current_owner_user
    @owner = Owner.create(owner_params)
    @owner_user.owner = @owner

    if @owner.save
      redirect_to owners_path
    else
      render :new
    end
  end

  # PATCH/PUT /owners/1
  # PATCH/PUT /owners/1.json
  def update
    respond_to do |format|
      if @owner.update(owner_params)
        format.html { redirect_to @owner, notice: 'Owner was successfully updated.' }
        format.json { render :show, status: :ok, location: @owner }
      else
        format.html { render :edit }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @owner.destroy
    respond_to do |format|
      format.html { redirect_to owners_url, notice: 'Owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      @owner = Owner.find_by_owner_user_id(current_owner_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def owner_params
      params.require(:owner).permit(:name, :owner_user_id)
    end
end
