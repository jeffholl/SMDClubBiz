class FixEventCommentColumnName < ActiveRecord::Migration
  def change
  	rename_column :event_comments, :club_id, :event_id
  end
end
