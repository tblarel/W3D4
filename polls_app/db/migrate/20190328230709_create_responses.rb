class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.timestamps
      t.integer :respondent, null: false
      t.integer :question_id, null: false
    end

    add_index :responses, :respondent
    add_index :responses, :question_id
  end
end
