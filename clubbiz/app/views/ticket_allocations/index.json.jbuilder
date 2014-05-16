json.array!(@events) do |event|
  json.extract! event, :id, :event_name, :event_description, :start_datetime, :end_datetime, :external_url
  json.url event_url(event, format: :json)
end
