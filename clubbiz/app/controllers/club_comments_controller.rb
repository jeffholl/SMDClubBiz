class ClubCommentsController < ApplicationController

  before_action :set_club_comment, only: [:edit, :update, :destroy]
  before_action :set_club, only: [:new]

  def new
    @new_comment = ClubComment.new
  end

  def edit
  end

  def create
    @club_comment = ClubComment.new(club_comment_params)
    
    respond_to do |format|
      if @club_comment.save
        format.html { redirect_to club_path(@club_comment.club_id), notice: 'Club comment was successfully created.' }
        format.js {}
        format.json { render action: @club_comment, status: :created, location: @club_comment }
      else
        format.html { render action: 'new' }
#        format.json { render json: @club_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @club_comment.update(club_params)
        format.html { redirect_to club_path(@club_comment.club_id), notice: 'club_comment was successfully updated.' }
#        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
#        format.json { render json: @club_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @club_comment.destroy
    respond_to do |format|
      format.html { redirect_to club_path(@club_comment.club_id) }
      format.json { head :no_content }
    end
  end

private
  def set_club_comment
    @club_comment = ClubComment.find(params[:id])
  end

  def club_comment_params
    params.require(:club_comment).permit(:comment_type, :comment_title, :comment_body, :comment_url, :user_id, :club_id)
  end

  def set_club
    @club = Club.find(params[:id])
  end
end
