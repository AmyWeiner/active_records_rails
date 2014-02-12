class Film < ActiveRecord::Base
  has_many :screenings, as: :screenable
  has_many :venues, through: :screenings
  belongs_to :category

  def self.cached_find_by_day requestedDay
    puts "Le day:" + requestedDay.to_s
    day_str = requestedDay.to_s
    lower = requestedDay
    upper = requestedDay+1.day
    #Rails.cache.clear

    Rack::MiniProfiler.step "fetch films" do
      Rails.cache.fetch ['films'+day_str] do
        Film.includes(:screenings).where("screenings.datetime" =>lower..upper, "screenings.screenable_type" => "Film")#.select("distinct(datetime,venue_id), screenings.*")
      end
    end

    Rack::MiniProfiler.step "load json" do
      Rails.cache.fetch ['films_json'+day_str] do
        j = (Rails.cache.read 'films'+day_str).to_json( only: [:id,:name,:description,:detail_url],
          include: [ {category: {only: [:sub,:name]}}, screenings: {only: [:datetime,:omu,:ov], include: [venue: {only: [:id]}] } ] )
      end
    end
  end

end
