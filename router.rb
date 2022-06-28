# TODO: implement the router of your app.
class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "Welcome to the Restaurant"
    puts "          --             "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def display_tasks
    puts "\r\nWhat do you want to do:"
    puts "1 - Create new meal"
    puts "2 - List all meals"
    puts "3 - Exit"
    print "> "
  end

  def route_action(action)
    case action
    when 1 then puts @controller.add
    when 2 then puts @controller.list
    when 3 then stop
    else
      puts "Please press 1, 2 or 3"
    end
  end

  def stop
    @running = false
  end
end
