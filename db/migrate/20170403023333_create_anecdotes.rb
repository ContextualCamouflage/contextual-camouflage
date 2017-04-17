class CreateAnecdotes < ActiveRecord::Migration[5.0]
  def change
    create_table :anecdotes do |t|
      t.text :body
      t.references :submissions, index: true, foreign_key: true
      t.timestamps
    end
  end
end
