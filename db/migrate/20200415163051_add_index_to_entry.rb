class AddIndexToEntry < ActiveRecord::Migration[6.0]
  def change
    add_index :entries, :pos
    add_index :entries, :lang
    add_index :entries, :is_compound
    add_index :entries, :comp_part
    add_index :entries, :prefix
    add_index :entries, :dialect
  end
end
