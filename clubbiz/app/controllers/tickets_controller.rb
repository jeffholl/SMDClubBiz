class TicketsController < ApplicationController
  
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:new]

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to tickets_show_path(:id => @ticket.id), notice: 'Ticket was successfully created.' }
 #       format.json { render action: 'show', status: :created, location: @ticket }
      else
        format.html { render action: 'new' }
#        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
#        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
#        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
#      format.json { head :no_content }
    end
  end

 private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:ticket_type, :ticket_cost, :start_sale_datetime, :end_sale_datetime, :quantity, :event_id)
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:event_id])
    end

end
