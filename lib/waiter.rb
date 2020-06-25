class Waiter
    attr_accessor :name, :age
    @@all = []
    
    def initialize(name, years)
        @name = name
        @years = years
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meals|
            meals.waiter == self
        end
    end

    def best_tipper
        sorted_tips_array = Meal.all.sort_by do |meals|
            meals.tip
        end
        sorted_tips_array.last.customer
    end
end