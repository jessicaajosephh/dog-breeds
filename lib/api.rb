class API

    def initialize
        @url = "https://api.thedogapi.com/v1/breeds"
    end

    def get_breed_data
        breed_hash = HTTParty.get(@url)
        breed_array = breed_hash
        self.create_breed_objects
    end



end