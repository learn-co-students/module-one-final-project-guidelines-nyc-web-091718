module ApiController
  def ApiController.request_and_parse(input)
    JSON.parse(RestClient.get(input))
  end
end
