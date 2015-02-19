json.array!(@spaces) do |space|
  json.extract! space, :id, :name, :spacetype, :streetnum, :street, :city, :state, :areacode, :vacancies, :description, :price
  json.url space_url(space, format: :json)
end
