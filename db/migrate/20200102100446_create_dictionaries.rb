class CreateDictionaries < ActiveRecord::Migration[6.0]
  def change
    create_table :dictionaries do |t|
      t.string :name
      t.datetime :edited

      t.timestamps
    end
  end
end
