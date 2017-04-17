class CreateInstallations < ActiveRecord::Migration[5.0]
  def change
    create_table :installations do |t|
      t.string :locality
      t.boolean :active
      t.timestamp :active_at
    end
  end
end
