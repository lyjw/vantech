class EventsController < ApplicationController # :nodoc:
  def index
    @events = Event.all.order('time')
  end

  def show
    # show
  end
end
