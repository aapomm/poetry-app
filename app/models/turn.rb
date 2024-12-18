class Turn < ApplicationRecord
  belongs_to :game
  has_and_belongs_to_many :words

  enum :state, { active: 0, done: 1 }, default: :active

  before_create :set_words

  def end_turn!
    self.done!
    self.ended_at = Time.now

    # Delete unused words
  end

  private

  def set_words
    previous_words = Word.joins(:turns).where(turns: { game_id: self.game_id })

    self.words = (Word.all - previous_words).sample(5)
  end
end
