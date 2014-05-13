class AddEventsToClub < ActiveRecord::Migration
  def change
    rename_column :clubs, :id, :club_id
    rename_column :events, :id, :event_id
    add_column :events, :club_id, :integer
  end
end
