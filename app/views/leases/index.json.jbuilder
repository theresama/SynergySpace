json.array!(@leases) do |lease|
  json.extract! lease, :id, :user, :space, :startdate, :enddate, :message, :accepted
  json.url lease_url(lease, format: :json)
end
