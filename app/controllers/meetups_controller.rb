class MeetupsController < ApplicationController

  def index
    @meetups = Meetup.all

    respond_to do |format|
      format.json { render json: @meetups.to_json }
    end
  end

  def new
    @meetup = Meetup.new
  end

  def create
    meetup_params = params.require(:meetup).permit(:title)
    @meetup = Meetup.new(meetup_params)
    @meetup.url = "/#{meetup_params[:title]}/events?&sign=true&photo-host=public&page=20"

    respond_to do |format|
      if @meetup.save
        within_three_months = Date.today + 3.months
        @meetup.seed_events(within_three_months)

        format.html { render }
        format.js { render :create_success }
      else
        format.html { render }
        format.js { render :create_failure }
      end
    end
  end

  def destroy
    @meetup = Meetup.find params[:id]
    @meetup.destroy

    respond_to do |format|
      format.js { render :delete_success }
    end
  end

end
