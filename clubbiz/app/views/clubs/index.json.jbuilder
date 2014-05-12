json.array!(@clubs) do |club|
  json.extract! club, :id, :clunName, :clubDescription, :clubWebsite, :regoNumber
  json.url club_url(club, format: :json)
end
