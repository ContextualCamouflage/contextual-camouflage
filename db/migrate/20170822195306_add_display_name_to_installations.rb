class AddDisplayNameToInstallations < ActiveRecord::Migration[5.1]
  def change
    add_column :installations, :display_name, :string
  end
end
