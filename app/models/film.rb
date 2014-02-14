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

    films = Film.includes(:screenings).where("screenings.datetime" =>lower..upper, "screenings.screenable_type" => "Film")

    films.to_json

    # films.to_json(only: [:id,:name,:description,:detail_url])

    # films.to_json(only: [:id,:name,:description,:detail_url], include: [ :category ])

    # films.to_json(only: [:id,:name,:description,:detail_url], include: [ {category: {only: [:sub,:name]}} ])

    # films.to_json(only: [:id,:name,:description,:detail_url], include: [ {category: {only: [:sub,:name]}}, :screenings ])

    # films.to_json(only: [:id,:name,:description,:detail_url], include: [ {category: {only: [:sub,:name]}}, screenings: {only: [:datetime,:omu,:ov]} ])

    # films.to_json(only: [:id,:name,:description,:detail_url], include: [ {category: {only: [:sub,:name]}}, screenings: {only: [:datetime,:omu,:ov], include: [:venue] } ])

    # films.to_json(only: [:id,:name,:description,:detail_url], include: [ {category: {only: [:sub,:name]}}, screenings: {only: [:datetime,:omu,:ov], include: [venue: {only: [:id]}] } ])

    # ( only: [:id,:name,:description,:detail_url],
    #     include: [ {category: {only: [:sub,:name]}}, screenings: {only: [:datetime,:omu,:ov], include: [venue: {only: [:id]}] } ] )
  end

end
