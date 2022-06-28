require 'csv'
require_relative '../models/customer'

class CustomerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @customers = File.exist?(csv_file) ? load_csv(csv_file) : []
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end

  def create(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_csv(@csv_file)
  end

  def all
    return @customers
  end

  def find(id)
    result = nil
    @customers.each do |customer|
      result = customer if customer.id == id
    end
    return result
  end

  private

  def load_csv(csv_file)
    customers = []
    CSV.foreach(csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      customers << Customer.new(row)
    end
    return customers
  end

  def save_csv(csv_file)
    CSV.open(csv_file, 'w') do |csv|
      csv << [ "id", "name", "address" ]
      @customers.each do |customer|
        csv << [ customer.id, customer.name, customer.address ]
      end
    end
  end

end
