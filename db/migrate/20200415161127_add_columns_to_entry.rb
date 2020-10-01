class AddColumnsToEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :dictionaries, :version, :integer, default: '1'
    add_column :entries, :pos, :string
    add_column :entries, :lang, :string, default: 'IS'
    add_column :entries, :is_compound, :boolean, default: false
    add_column :entries, :comp_part, :string
    add_column :entries, :prefix, :boolean, default: false
    add_column :entries, :dialect, :string
  end
end
