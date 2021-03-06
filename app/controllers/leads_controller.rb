class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.all
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
    #@lead.origins # all origins from joint table
    #@origin.leads # all leads from joint table
    #@lead.origins = [ Origin.find(params[:origin_id]) ]
  end

  # GET /leads/1/edit
  def edit
  end


  def dashboard
    @lead = Lead.all
    #@lead.origins = [ Origin.find(params[:origin_id]) ]
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)

    respond_to do |format|
      if @lead.save
        LeadNotifierMailer.sample_email(@lead).deliver_now
        RequestMailer.lead_request(@lead).deliver_now
        format.html { redirect_to edit_lead_path(@lead), lead: @lead,  notice: 'Thank You! We just need a little more info.' }
        format.json { render :show, status: :created, location: @lead }
      else
        format.html { render :new }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        RequestMailer.lead_update(@lead).deliver_now
        format.html { redirect_to @lead, notice: 'Thank You Very Much!' }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.require(:lead).permit(:name, :email, :phone, :company, :origin, origin_ids:[])
    end
end
