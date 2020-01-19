class AddForeignKeyToSampas < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key "dictionaries", "sampas"
  end
end
