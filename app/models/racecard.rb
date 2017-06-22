# == Schema Information
#
# Table name: racecards
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  selection  :boolean
#

class Racecard < ActiveRecord::Base
  has_many :meetings
end
