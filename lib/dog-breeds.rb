class DogBreeds

    @@all = []

    def initialize(breed_hash)
        breed_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        end
        @@all << self
    end

    def self.all
        @@all
    end


end