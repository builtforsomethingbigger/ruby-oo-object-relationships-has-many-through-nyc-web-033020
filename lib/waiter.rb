class Waiter

    attr_accessor :name, :yrs_experience #why don't we need an attr_ for Meal???

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip = 0)
        Meal.new(self, customer, total, tip) #QUESTION: why does the instance of self come first compared to the customer new_meal instance method?
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end


    #ask about this entire instance method
    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b| #iteration to find the largest of two arrays
            meal_a.tip <=> meal_b.tip #spaceship operator compares two arrays
        end
       
        best_tipped_meal.customer #return the result of customer for the iteration
    end

end 