# == Schema Information
#
# Table name: leagues
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  user_id    :integer
#  meeting    :integer
#  join_code  :integer
#  steward    :integer
#

class League < ActiveRecord::Base
  # belongs_to :user
  has_many :memberships
  has_many :users, :through => :memberships

  before_save :create_join_code

  def create_join_code
    self.join_code = Random.new.bytes(6).bytes.join[0,6]
  end
end
