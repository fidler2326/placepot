class Race < ActiveRecord::Base
  belongs_to :meeting
  has_many :horses
end
