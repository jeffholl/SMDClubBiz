class RemoveDoubleManyToManyAssoc < ActiveRecord::Migration
  def change
  	drop_table :moderators

  	add_column :shared_events, :role, :string

  	add_column :memberships, :role, :string
  end
end
