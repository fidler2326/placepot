# == Schema Information
#
# Table name: meetings
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  racecourse :string
#  tip_id     :integer
#

class Meeting < ActiveRecord::Base
  has_many :races
  accepts_nested_attributes_for :races, reject_if: :all_blank, allow_destroy: true
end
