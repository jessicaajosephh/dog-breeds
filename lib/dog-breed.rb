class DogBreed

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

    def self.find_by_name(name)
        self.all.select do |breed|
            breed.name.downcase == name
        end
    end

    def get_metric_weight
        self.weight["metric"] + " lbs"
    end



end