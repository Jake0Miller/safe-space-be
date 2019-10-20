class Geocoder < BaseService
  def initialize(address)
    @address = address
  end

  def coords
    get_json("maps/api/geocode/json")[:results][0][:geometry][:location]
  end

  private

  def conn
    @_conn ||= Faraday.new(url: "https://maps.googleapis.com/") do |faraday|
      faraday.params["key"] = ENV['GEO_KEY']
      faraday.params["address"] = @address
      faraday.adapter Faraday.default_adapter
    end
  end
end
