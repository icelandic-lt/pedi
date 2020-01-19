class CreateSampas < ActiveRecord::Migration[6.0]
  def change
    create_table :sampas do |t|
      t.string :name
      t.text :phonemes

      t.timestamps
    end
  end
end
