class Customer
    attr_accessor :name, :age, :waiter
  
    @@all = []
  
    def initialize(name, age)
      @name = name
      @age = age
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def new_meal(waiter, total, tip = 0)
      Meal.new(waiter, self, total, tip) #passing #self (Customer instance) as and argument for each new_meal
    end
  
    def meals
      Meal.all.select do |meal| #customer looks through all meals and...
          meal.customer == self #selects the ones that belong to the them
      end
    end
  
    def waiters
      meals.map do |meal|
          meal.waiter
      end 
    end
  
  end 