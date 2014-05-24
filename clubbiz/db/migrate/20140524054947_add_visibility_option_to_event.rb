class AddVisibilityOptionToEvent < ActiveRecord::Migration
  def change
  	add_column :events, :access, :string
  	add_column :events, :featured, :boolean
  	add_column :events, :ticketed, :boolean
  	add_column :events, :status, :string
  end
end
