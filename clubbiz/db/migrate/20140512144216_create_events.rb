class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_description
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :external_url

      t.timestamps
    end
  end
end
