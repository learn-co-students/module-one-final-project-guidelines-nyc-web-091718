

class ApiStuff
  name = Faker::Name.unique.name
  race = ApiController.race_hash.sample
  age = Random.new.rand(15..90)
  #binding.pry
end

# ApiController.request_and_parse()
