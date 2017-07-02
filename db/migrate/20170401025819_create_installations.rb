class CreateInstallations < ActiveRecord::Migration[5.0]
  def change
    create_table :installations do |t|
      t.string :locality
      t.boolean :active
      t.decimal :latitude, {:precision=>10, :scale=>6}
      t.decimal :longitude, {:precision=>10, :scale=>6}
      t.timestamp :active_at
    end
  end
end
