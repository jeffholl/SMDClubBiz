class RemoveOldIdCols < ActiveRecord::Migration
  def change
  	remove_column :clubs, :club_id
    remove_column :events, :event_id
  end
end
