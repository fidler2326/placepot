# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  league_id  :integer
#  user_id    :integer
#

class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :league
end
