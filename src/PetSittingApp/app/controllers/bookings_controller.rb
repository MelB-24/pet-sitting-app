class BookingsController < ApplicationController
  before_action :set_user_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    # need to have seperate if statements depending on who is logged in at the time. Variables are different depending. 
    if owner_user_signed_in?
      @bookings = current_owner_user.owner.bookings
      @owner = current_owner_user.owner
    end

    if sitter_user_signed_in?
      @sitter = current_sitter_user.sitter
      if current_sitter_user.sitter.approved_sitter != nil
        @bookings = current_sitter_user.sitter.approved_sitter.bookings
      else
        # must display as an empty array so no errors occur. 
        @bookings = []
      end
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    @owner = current_owner_user.owner
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)

    # respond_to do |format|
      if @booking.save
        redirect_to bookings_path
        # format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        # format.json { render :index, status: :created, location: @booking }
      else
        # format.html { render :new }
        # format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_booking
      id = params[:id]
      if owner_user_signed_in?
        @owner = Owner.find_by_owner_user_id(current_owner_user.id)
      else
        @sitter = Sitter.find_by_sitter_user_id(current_sitter_user.id)
      end
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:start_time, :end_time, :number_of_dogs, :approved_sitter_id, :approved_booking)
    end

    
  
end
