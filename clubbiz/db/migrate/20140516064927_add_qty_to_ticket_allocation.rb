class AddQtyToTicketAllocation < ActiveRecord::Migration
  def change
  	add_column :ticket_allocations, :quantity, :integer
  end
end
