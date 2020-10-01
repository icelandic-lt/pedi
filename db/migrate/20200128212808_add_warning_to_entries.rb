class AddWarningToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :warning, :boolean
  end
end
