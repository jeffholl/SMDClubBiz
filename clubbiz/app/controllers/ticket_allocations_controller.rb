class TicketAllocationsController < ApplicationController
  before_action :set_ticket_allocation, only: [:show, :edit, :update, :destroy]
# before_action :set_ticket, only: [:new, :edit]
# before_action :set_user, only: [:new, :edit]

  def index
    @ticket_allocations = TicketAllocation.all
  end

  def show
  end

  def new
    @ticket_allocation = TicketAllocation.new
  end

  def edit
  end

  def create
    @ticket_allocation = TicketAllocation.new(ticket_allocation_params)
    
    respond_to do |format|
      if @ticket_allocation.save
        format.html { redirect_to ticket_allocations_path, notice: 'Ticket Allocation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ticket_allocation }
      else
        format.html { render action: 'new' }
        format.json { render json: @ticket_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ticket_allocation.update(ticket_allocation_params)
        format.html { redirect_to @ticket_allocation, notice: 'Ticket Allocation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket_allocation.destroy
    respond_to do |format|
      format.html { redirect_to ticket_allocations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_allocation
      @ticket_allocation = TicketAllocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_allocation_params
      params.require(:ticket_allocation).permit(:user_id, :ticket_id, :status, :quantity)
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @club = Ticket.find(params[:ticket_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @club = User.find(params[:user_id])
    end

end
