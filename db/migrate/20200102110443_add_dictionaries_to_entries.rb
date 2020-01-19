class AddDictionariesToEntries < ActiveRecord::Migration[6.0]
  def change
    add_reference :entries, :dictionary, foreign_key: true
  end
end
