class SubTurn < ApplicationRecord
  belongs_to :turn
  delegate :game, to: :turn

  enum :state, { active: 0, done: 1 }, default: :active
end
