class AddSampaIdToDictionaries < ActiveRecord::Migration[6.0]
  def change
    add_column :dictionaries, :sampa_id, :integer
    add_index  :dictionaries, :sampa_id
  end
end
