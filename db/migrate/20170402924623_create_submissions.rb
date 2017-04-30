class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.string :cookie
      t.string :relationship
      t.string :zip_code
      t.string :ip_address
      t.string :locality
      t.decimal :latitude, {:precision=>10, :scale=>6}
      t.decimal :longitude, {:precision=>10, :scale=>6}
      t.references :illness, index: true, foreign_key: true
      t.timestamps
    end
  end
end
