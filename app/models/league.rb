# == Schema Information
#
# Table name: leagues
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  users      :integer          default("{}"), is an Array
#  name       :text
#  user_id    :integer
#  meeting    :integer
#

class League < ActiveRecord::Base
  # belongs_to :user
  has_many :memberships
  has_many :users, :through => :memberships
end
