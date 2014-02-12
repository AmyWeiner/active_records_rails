class HomeController < ApplicationController

def events
  requestedDay = parseDay params
  res = Event.cached_find_by_day requestedDay
  render json: res
end

def films
  requestedDay = parseDay params
  res = Film.cached_find_by_day requestedDay
  render :json => res
end

def venues
  res = Venue.cached_all
  render :json => res
end

def cinemas
  res = Venue.cached_all_cinemas
  render :json => res
end

private

  def parseDay params
    day_p = params['day']
    day_a = day_p.split '-'
    DateTime.new(day_a[0].to_i,day_a[1].to_i,day_a[2].to_i)
  end

end
