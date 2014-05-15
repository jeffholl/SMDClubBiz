json.array!(@clubs) do |club|
  json.extract! club, :id, :club_name, :club_description, :club_website, :rego_number
  json.url club_url(club, format: :json)
end
