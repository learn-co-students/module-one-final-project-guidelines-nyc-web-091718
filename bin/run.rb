require_relative '../config/environment'

def request_and_parse(input)
  JSON.parse(RestClient.get(input))
end


binding.pry
