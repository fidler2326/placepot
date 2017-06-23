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
  accepts_nested_attributes_for :horses, reject_if: :all_blank, allow_destroy: true
end
