# == Schema Information
#
# Table name: races
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  time       :time
#  meeting_id :integer
#

class Race < ActiveRecord::Base
  belongs_to :meeting
  has_many :horses
end
