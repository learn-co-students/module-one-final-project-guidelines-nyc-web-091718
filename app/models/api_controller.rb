module ApiController
  def ApiController.request_and_parse(input)
    JSON.parse(RestClient.get(input))
  end

  def ApiController.race_hash
    races = ApiController.request_and_parse("http://www.dnd5eapi.co/api/races/")["results"]
    races.map do |race_type|
      race_type["name"]
    end
  end


end
