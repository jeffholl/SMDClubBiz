class SharedEventsController < ApplicationController
  
	before_action :set_shared_event, only: [:edit, :update, :destroy]

  def edit
  end

  def create
  	@shared_event = SharedEvent.new(shared_event_params)
    
    respond_to do |format|
      if @shared_event.save
        format.html { redirect_to @shared_event.event, notice: 'Club comment was successfully created.' }
        format.json { render action: @shared_event, status: :created, location: @shared_event }
      else
        format.html { render action: 'new' }
#        format.json { render json: @shared_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shared_event.update(shared_event_params)
        format.html { redirect_to @shared_event.event, notice: 'shared_event was successfully updated.' }
#        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
#        format.json { render json: @shared_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shared_event.destroy
    respond_to do |format|
      format.html { redirect_to club_path(@shared_event.club_id) }
      format.json { head :no_content }
    end
  end

  private
  	def set_shared_event
  		@shared_event = SharedEvent.find(params[:id])
  	end

   	def shared_event_params
    	params.require(:shared_event).permit(:club_id, :event_id, :role, :status)
  	end
end
