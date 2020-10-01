class AddFinishedToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :finished, :boolean
  end
end
