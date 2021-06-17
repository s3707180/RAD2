class CreateAttempts < ActiveRecord::Migration[6.1]
  def change
    create_table :attempts do |t|
      t.datetime :dateandtime
      t.string :category
      t.string :difficulty
      t.string :questionsList
      t.integer :questionnum
      t.integer :questioncorrect

      t.timestamps
    end
  end
end
