require_relative '../models/meal'

class View
  def ask_user_for_meal
    puts "\r\nEnter meal to add"
    print "Name: "
    name = gets.chomp
    print "Price: "
    price = gets.chomp.to_i
    return Meal.new(name: name, price: price)
  end

  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name} - $#{meal.price}"
    end
  end
end
