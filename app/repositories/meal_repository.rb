require 'csv'
require_relative "../models/meal"

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = File.exist?(csv_file) ? load_csv(csv_file) : []
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def create(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv(@csv_file)
  end

  def all
    return @meals
  end

  def find(id)
    result = nil
    @meals.each do |meal|
      result = meal if meal.id == id
    end
    return result
  end

  private

  def load_csv(csv_file)
    meals = []
    CSV.foreach(csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      meals << Meal.new(row)
    end
    return meals
  end

  def save_csv(csv_file)
    CSV.open(csv_file, 'w') do |csv|
      csv << [ "id", "name", "price" ]
      @meals.each do |meal|
        csv << [ meal.id, meal.name, meal.price ]
      end
    end
  end

end
