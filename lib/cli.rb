class CLI

    def call
        greeting
    end

    def greeting
        puts "Welcome! Start searching for dog breeds now!"
        puts "To search for dog breeds, enter 'start'"
        puts "If there is nothing you would like to do at the moment, enter 'exit'"
    end   

    def menu
        input = gets.strip.downcase

        if input == "start"
            list_of_breeds
        elsif input == "exit"
            goodbye
        else
            invalid_entry
        end
    end

    def goodbye
        puts "Goodbye! Thanks for stopping in!"
    end

    def invalid_entry
        puts "Hmmmmmm, I'm not understanding, please try again."
    end


    




end