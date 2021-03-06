class Member < ApplicationRecord
  has_many :member_positions, dependent: :destroy
  has_many :positions, through: :member_positions

  has_many :member_projects, dependent: :destroy
  has_many :projects, through: :member_projects

  accepts_nested_attributes_for :member_positions, reject_if: :all_blank, allow_destroy: true

  def calcload
    member_load = 0
    positions.each do |position|
      member_load += position.load
    end
    member_load
  end
end
