# == Schema Information
#
# Table name: tips
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  tip           :integer
#  horse_ids     :integer          default("{}"), is an Array
#  horse_id      :integer
#  horse_options :boolean          default("{}"), is an Array
#  horses        :text
#  user_id       :integer
#  league_id     :integer
#

require 'test_helper'

class TipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
