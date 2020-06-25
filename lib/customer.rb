class Customer
    attr_accessor :name, :age
    
    @@all = []
    
    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select do |meals|
            meals.customer == self
        end
    end

    def waiters
        self.meals.map do |meals_with_this_customer|
            meals_with_this_customer.waiter
        end
    end
end