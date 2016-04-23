json.array!(@records) do |record|
  json.extract! record, :id, :date
  json.url record_url(record, format: :json)
end
