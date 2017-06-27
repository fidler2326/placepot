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

class Tip < ActiveRecord::Base
  belongs_to :user
  has_many :horses
  # serialize :horses, Hash
  # serialize :horses, Array
  # serialize :horses

  def points(result)
    case result
      when 'won'
        points = 3
      when 'placed'
        points = 2
      when 'lost'
        points = 1
    end
    return points
  end

end
