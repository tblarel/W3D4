class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.timestamps
      t.integer :poll_id, null: false
      t.string :text, null:false
    end

    add_index :questions, :poll_id
  end
end
