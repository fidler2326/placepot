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
#  join_code  :integer
#  admin      :boolean          default("false")
#

require 'test_helper'

class LeagueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
