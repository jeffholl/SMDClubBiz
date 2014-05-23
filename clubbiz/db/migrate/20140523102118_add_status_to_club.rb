class AddStatusToClub < ActiveRecord::Migration
  def change
  	add_column :clubs, :status, :string
  end
end
