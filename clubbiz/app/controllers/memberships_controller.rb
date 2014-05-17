class MembershipsController < ApplicationController
  
	before_action :set_membership, only: [:edit, :update, :destroy]
  before_action :set_club, only: [:new]

  def index
  	@memberships = Membership.all
  end

  def new
    @membership = Membership.new
  end

  def edit
  end
  
  def create
  	@membership = Membership.new(membership_params)

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership.club, notice: 'membership was successfully created.' }
#        format.json { render action: 'show', status: :created, location: @membership }
      else
        format.html { redirect_to @membership.club }
#        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to memberships_path, notice: 'membership was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.json { head :no_content }
    end
  end

private

  def set_membership
  	@membership = Membership.find(params[:id])
  end
	
	def membership_params
      params.require(:membership).permit(:club_id, :user_id, :status)
  end

  def set_club
    @club = Club.find(params[:id])
  end

end
