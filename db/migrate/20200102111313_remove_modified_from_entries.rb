class RemoveModifiedFromEntries < ActiveRecord::Migration[6.0]
  def change

    remove_column :entries, :modified, :datetime
  end
end
