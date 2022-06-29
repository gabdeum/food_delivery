class CustomersView
  def ask_user_for_customer(stuff)
    puts "Enter customer #{stuff}"
    print "> "
    return gets.chomp
  end

  def display(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1} - #{customer.name}: #{customer.address}"
    end
  end
end
