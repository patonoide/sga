json.array!(@records) do |record|
    json.extract! record, :id, :number, :date, :records_users, :discussion
end