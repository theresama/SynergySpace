json.array!(@spaces) do |space|
  json.extract! space, :id, :name, :spacetype, :streetnum, :street, :city, :state, :areacode
  json.url space_url(space, format: :json)
end
