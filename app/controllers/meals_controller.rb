require_relative '../repositories/meal_repository'
require_relative '../models/meal'
require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def add
    meal = @meals_view.ask_user_for_meal
    @meal_repository.create(meal)
  end

  def list
    @meals_view.display_meals(@meal_repository.all)
  end
end
