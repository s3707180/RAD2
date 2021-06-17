class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :sessionid
      t.string :questionid
      t.text :question

      t.timestamps
    end
  end
end
