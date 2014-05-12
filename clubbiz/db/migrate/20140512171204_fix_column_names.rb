class FixColumnNames < ActiveRecord::Migration
  
  def change
  	rename_column :clubs, :clunName, :club_name
  	rename_column :clubs, :clubDescription, :club_description
  	rename_column :clubs, :clubWebsite, :club_website
  	rename_column :clubs, :regoNumber, :rego_number
  end

end