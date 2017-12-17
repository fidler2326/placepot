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

require 'test_helper'

class LeagueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
