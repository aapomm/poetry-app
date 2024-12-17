class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.integer :state
      t.string :code
      t.string :host

      t.integer :round, default: 1
      t.integer :current_round, default: 1

      t.string :current_player

      t.text :players

      t.timestamps
    end
  end
end
