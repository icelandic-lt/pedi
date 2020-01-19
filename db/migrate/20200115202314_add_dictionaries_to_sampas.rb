class AddDictionariesToSampas < ActiveRecord::Migration[6.0]
  def change
    add_reference :sampas, :dictionary, foreign_key: true
  end
end
