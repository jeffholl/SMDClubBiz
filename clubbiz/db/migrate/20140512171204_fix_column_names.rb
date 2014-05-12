class FixColumnNames < ActiveRecord::Migration
  def change
  	rename_column :Club, :clunName, :club_name
  	rename_column :Club, :clubDescription, :club_description
  	rename_column :Club, :clubWebsite, :club_website
  	rename_column :Club, :regoNumber, :rego_number
  end
end