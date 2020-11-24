class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.integer :score
      t.boolean :answered

      t.timestamps
    end
  end
end
