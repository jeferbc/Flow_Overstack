class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.datetime :active, default: Time.now
      t.integer :viewed, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
