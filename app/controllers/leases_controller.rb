class LeasesController < ApplicationController
  before_filter :authenticate_user!

  before_action :set_lease, only: [:show, :edit, :update, :destroy]

  # GET /leases
  # GET /leases.json
  def index
    @leases = Lease.all
  end

  # GET /leases/1
  # GET /leases/1.json
  def show
  end

  # GET /leases/new
  def new
    @lease = Lease.new
  end

  # GET /leases/1/edit
  def edit

  end

  # POST /leases
  # POST /leases.json
  def create
    @space = Space.find(params[:space_id])
    @lease = @space.leases.build(lease_params)
    @lease.user_id = current_user.id

    respond_to do |format|
      if @lease.save
        format.html { redirect_to @lease, notice: 'Lease was successfully created.' }
        format.json { render :show, status: :created, location: @lease }
      else
        format.html { render :new }
        format.json { render json: @lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leases/1
  # PATCH/PUT /leases/1.json
  def update
    respond_to do |format|
      if @lease.update(lease_params)
        if @lease.accepted == true
          vac = @space.vacancies - 1
          @space.update_attribute(:vacancies, vac)
        end
        format.html { redirect_to @lease, notice: 'Lease was successfully updated.' }
        format.json { render :show, status: :ok, location: @lease }
      else
        format.html { render :edit }
        format.json { render json: @lease.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    lease_id = params[:lease_id]
    lease = Lease.where(id: lease_id).first
    if lease
      lease.approved = true
    end
    render :json =>  { :status => :ok }
  end



  # DELETE /leases/1
  # DELETE /leases/1.json
  def destroy
    @lease.destroy
    respond_to do |format|
      format.html { redirect_to leases_url, notice: 'Lease was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lease
      @lease = Lease.find(params[:id])
      @space = Space.find_by(id: @lease.space)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lease_params
      params.require(:lease).permit(:user, :space, :startdate, :enddate, :message, :accepted)
    end
end
