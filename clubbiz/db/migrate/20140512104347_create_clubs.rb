class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :clunName
      t.string :clubDescription
      t.string :clubWebsite
      t.string :regoNumber

      t.timestamps
    end
  end
end
