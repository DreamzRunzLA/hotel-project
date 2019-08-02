require_relative "room"

class Hotel
    def initialize(name, hash)
        @name = name
        @rooms = Hash.new
        hash.keys.each do |ele|
            @rooms[ele] = Room.new(hash[ele])
        end
    end

    def name
        @name.split(' ').map {|word| word.downcase.capitalize}.join(' ')
    end

    def rooms
        @rooms
    end

    def room_exists?(roomName)
        if self.rooms.keys.include?(roomName)
            true
        else
            false
        end
    end

    def check_in(person, roomer)
        if self.room_exists?(roomer)
            if self.rooms[roomer].add_occupant(person)
                puts 'check in successful'
            else
                puts 'sorry, room is full'
            end
        else
            puts 'sorry, room does not exits'
        end
    end

    def has_vacancy?
        return !self.rooms.values.all?{|room| room.full?}
    end

    def list_rooms
        self.rooms.keys.each do |name|
            puts name + self.rooms[name].available_space.to_s
        end
    end
end
