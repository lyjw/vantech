class EventsController < ApplicationController # :nodoc:
  def index
    create_event_objects
    @events = Event.all
  end

  def show
    # show
  end
end
