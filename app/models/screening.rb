class Screening < ActiveRecord::Base

  belongs_to :screenable, polymorphic: true
  belongs_to :venue

end
