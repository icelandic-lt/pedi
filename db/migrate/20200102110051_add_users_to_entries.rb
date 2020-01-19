class AddUsersToEntries < ActiveRecord::Migration[6.0]
  def change
    add_reference :entries, :user, foreign_key: true
  end
end
