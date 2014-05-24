class EventCommentsController < ApplicationController

  before_action :set_event_comment, only: [:edit, :update, :destroy]
  before_action :set_event, only: [:new]

  def new
    @event_comment = EventComment.new
  end

  def edit
    @event = @event_comment.event
  end

  def create
    @event_comment = EventComment.new(event_comment_params)
    
    respond_to do |format|
      if @event_comment.save
        format.html { redirect_to @event_comment.event, notice: 'Event comment was successfully created.' }
        format.js {}
        format.json { render action: @event_comment.event, status: :created, location: @event_comment }
      else
        format.html { render action: @event_comment.event }
#        format.json { render json: @event_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event_comment.update(event_comment_params)
        format.html { redirect_to @event_comment.event, notice: 'Event comment was successfully updated.' }
#        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
#        format.json { render json: @club_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event_comment.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@event_comment.event_id) }
      format.json { head :no_content }
    end
  end

private
  def set_event_comment
    @event_comment = EventComment.find(params[:id])
  end

  def event_comment_params
    params.require(:event_comment).permit(:comment_type, :comment_title, :comment_body, :comment_url, :user_id, :event_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
