class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.integer :state
      t.string :code
      t.string :host

      t.integer :rounds, default: 2

      t.text :players

      t.timestamps
    end
  end
end
