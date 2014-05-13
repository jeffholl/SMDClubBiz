json.array!(@clubs) do |club|
  json.extract! club, :id, :club_name, :club_descrption, :club_website, :rego_number
  json.url club_url(club, format: :json)
end
