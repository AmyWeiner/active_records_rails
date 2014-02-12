# == Schema Information
#
# Table name: venues
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  type        :string(255)
#  street1     :string(255)
#  street2     :string(255)
#  city        :string(255)
#  district    :string(255)
#  zip         :string(255)
#  country     :string(255)
#  email       :string(255)
#  phone       :string(255)
#  web         :string(255)
#  transport   :string(255)
#  lat         :string(255)
#  lon         :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Venue < ActiveRecord::Base

  has_many :events

  has_many :screenings
  has_many :films, through: :screenings

  def self.cached_all
    #Rack::MiniProfiler.step "fetch venues" do
      Rails.cache.fetch ['venues'] do
        Venue.all
      end
    #end

    #Rack::MiniProfiler.step "load venue json" do
      Rails.cache.fetch ['json_venue'] do
        (Rails.cache.read 'venues').to_json
      end
    #end
  end

  def self.cached_all_cinemas
    Rack::MiniProfiler.step "fetch cinemas" do
      Rails.cache.fetch ['cines'] do
        Venue.where(kind: 'cine')
      end
    end

    Rack::MiniProfiler.step "load cinema json" do
      Rails.cache.fetch ['json_cine'] do
        (Rails.cache.read 'cines').to_json
      end
    end
  end


end
