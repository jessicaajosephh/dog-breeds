class CLI

    def initialize
        API.new.get_breed_data
    end

    def call
        greeting
        menu
    end

    def greeting
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
        puts "Welcome! Start searching for dog breeds now!"
        puts ""
        puts "--To search for dog breeds, enter 'breeds'"
        puts ""
        puts "--If there is nothing you would like to do at the moment, enter 'exit'"
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    end   

    def menu
        input = gets.strip.downcase

        if input == "breeds"
            list_of_breeds
        elsif input == "exit"
            goodbye
        else
            invalid_entry
        end
    end

    def goodbye
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 
        puts "Goodbye! Thanks for stopping in!"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
    end

   
    def list_of_breeds
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
        puts "Select which breed you would like information on:"
        puts ""
        DogBreed.all.each_with_index do |breed, index|
            puts "#{index + 1}. #{breed.name}"
        end
        input = gets.strip.downcase
        breed_selection(input)
    end

    def breed_selection(breed)
        breed = DogBreed.find_by_name(breed) 
        if breed 
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            puts "Name of Breed: #{breed.name}"
            puts "Approximate Weight: #{breed.get_metric_weight}"
            puts "Approximate Height: #{breed.get_metric_height}"
            puts "Bred For: #{breed.bred_for}"
            puts "Breed Group: #{breed.breed_group}"
            puts "Average Life Span: #{breed.life_span}"
            puts "Temperament: #{breed.temperament}"
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            puts ""
            puts "To continue searching for breeds, enter 'breeds'."
            puts "If there is nothing else you would like to do, enter 'exit'."
            puts ""
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            menu
        else
            invalid_entry
        end
    end

    def invalid_entry
        puts ""
        puts "Hmmmmmm, I'm not understanding, please try again."
        puts ""
        menu
    end

    #binding.pry


end