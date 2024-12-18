class CreateWords < ActiveRecord::Migration[8.0]
  def change
    create_table :words do |t|
      t.string :word
      t.integer :difficulty

      t.timestamps
    end

    create_table :turns_words, id: false do |t|
      t.timestamps

      t.belongs_to :turn
      t.belongs_to :word
    end
  end
end
