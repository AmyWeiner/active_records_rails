# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :string(255)
#  date         :date
#  time         :time
#  location_url :string(255)
#  artist       :string(255)
#  venue_id     :integer
#  city_id      :integer
#  category_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Event < ActiveRecord::Base

  has_many :screenings, as: :screenable

  belongs_to :city
  belongs_to :venue
  belongs_to :category

  def self.cached_find_by_day requestedDay
    day_str = requestedDay.to_s
    lower = requestedDay
    upper = requestedDay+1.day

    Rack::MiniProfiler.step "fetch events" do
      Rails.cache.fetch ['events'+day_str] do
        Event.where(:datetime => lower..upper)
      end
    end

    Rack::MiniProfiler.step "load json" do
      Rails.cache.fetch ['json'+day_str] do
        (Rails.cache.read 'events'+day_str).to_json(:include => [:venue, :category, :screenings])
      end
    end
  end

end
