class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :word
      t.string :sampa
      t.string :comment
      t.datetime :modified

      t.timestamps
    end
  end
end
