class CreateIllness < ActiveRecord::Migration[5.0]
  def change
    create_table :illnesses do |t|
      t.string :name
      t.text :body
    end
  end
end
