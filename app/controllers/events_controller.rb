class EventsController < ApplicationController # :nodoc:
  def index
    @events = Event.all
  end

  def show
    # show
  end

end
