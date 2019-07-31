class Room
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        if self.occupants.length < self.capacity
            return false
        else
            return true
        end
    end

    def available_space
        return self.capacity - self.occupants.length
    end

    def add_occupant(name)
        if self.full?
            return false
        else
            self.occupants << name
            return true
        end
    end

    
end
