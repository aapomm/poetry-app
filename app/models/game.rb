class Game < ApplicationRecord
  serialize :players

  enum :state, waiting: 0, playing: 1, finished: 2

  # after_update_commit do
  #   broadcast_replace_to self, :players, partial: "games/players", locals: { game: self, players: self.players }
  # end

  before_create do
    code = generate_code
    while Game.exists?(code: code)
      code = generate_code
    end

    self.code = code
  end

  def add_player(id, name)
    self.players ||= []
    self.players << { id: id, name: name, score: 0 } unless self.players.any? { |player| player[:id] == id }
    save

    realtime_replace
  end

  def remove_player(id)
    new_players = self.players.reject { |player| player[:id] == id }
    self.players = new_players
    save

    realtime_replace
  end

  private

  def realtime_replace
    broadcast_replace target: "players_game_#{self.id}", partial: "games/players", locals: { game: self, players: self.players }
  end

  def generate_code
    (0...4).map { ('A'..'Z').to_a[rand(26)] }.join
  end
end
