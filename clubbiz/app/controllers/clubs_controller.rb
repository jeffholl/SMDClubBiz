class ClubsController < ApplicationController
  
  before_action :admin_redirect, except: :update
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.all
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
    @events = @club.events
    @fevent = @club.get_next_event #altered to make work when club has no events error
    @club_comments = @club.club_comments
    @club_comment = ClubComment.new
    @membership = Membership.new
    @club_news = ClubComment.new
  end

  # GET /clubs/new
  def new
    @club = Club.new
    @membership = Membership.new
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(club_params)

    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, notice: 'Club was successfully created.' }
        format.js {}
        format.json { render action: 'show', status: :created, location: @club }
      else
        format.html { render action: 'new' }
        format.json { render :json => { :error => @club.errors.full_message }, :status => 422 }
      end
    end
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: 'Club was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:club_name, :club_description, :club_website, :rego_number, :status)
    end

    def admin_redirect
      if signed_in? && current_user.admin?
        redirect_to admins_dashboard_path
      end
    end
end
