# == Schema Information
#
# Table name: horses
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  race_id       :integer
#  name          :string
#  meeting_id    :integer
#  tip_id        :integer
#  horse_options :boolean          default("{}"), is an Array
#  result        :string
#

require 'test_helper'

class HorseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
