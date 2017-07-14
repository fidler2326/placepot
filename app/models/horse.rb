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
#  horse_options :boolean          default([]), is an Array
#  result        :string
#  form          :string
#  trainer       :string
#  jockey        :string
#

class Horse < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :race

  has_many :likes
  has_many :users, through: :likes

  # acts_as_votable

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
