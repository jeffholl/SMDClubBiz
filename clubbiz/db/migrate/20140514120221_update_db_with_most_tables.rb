class UpdateDbWithMostTables < ActiveRecord::Migration
  def change

  	create_table :tickets do |t|
      t.string :ticket_type
      t.string :ticket_cost
      t.datetime :start_sale_datetime
      t.datetime :end_sale_datetime
      t.integer :quantity

      t.timestamps
    end
    
  	create_table :club_comments do |t|
      t.string :comment_type
      t.string :comment_title
      t.string :comment_body
      t.string :comment_url
      t.integer :user_id
      t.integer :club_id

      t.timestamps
    end
    
  	create_table :event_comments do |t|
      t.string :comment_type
      t.string :comment_title
      t.string :comment_body
      t.string :comment_url
      t.integer :user_id
      t.integer :club_id

      t.timestamps
    end

    create_table :moderators do |t|
    	t.integer :club_id
    	t.integer :user_id
    	t.string :permission

    	t.timestamps
    end

    create_table :memberships do |t|
    	t.integer :club_id
    	t.integer :user_id
    	t.string :status

    	t.timestamps
    end

    create_table :shared_events do |t|
    	t.integer :club_id
    	t.integer :event_id

    	t.timestamps
    end

    create_table :ticket_allocations do |t|
    	t.integer :ticket_id
    	t.integer :user_id
    	t.string :status

    	t.timestamps
    end

    remove_column :clubs, :clubs_id
    remove_column :events, :events_id

  end
end
