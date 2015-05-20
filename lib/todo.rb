require 'csv'

class Todo

  def initialize(file_name)
    @file_name = file_name
    @todos = CSV.read(@file_name, headers: true)

# log_data = CSV.read('logs.csv', headers: true)
    # You will need to read from your CSV here and assign them to the @todos variable. make sure headers are set to true
  end

  def start
    loop do
      system('clear')

      puts "---- TODO.rb ----"

      view_todos

      puts
      puts "What would you like to do?"
      puts "1) Exit 2) Add Todo 3) Mark Todo As Complete"
      print " > "
      action = gets.chomp.to_i
      case action
      when 1 then exit
      when 2 then add_todo
      when 3 then mark_todo
      else
        puts "\a"
        puts "Not a valid choice"
      end
    end
  end

  def view_todos
      puts "Unfinished"
      print "1) finish homework"
      print "Completed"
  end

  def add_todo
    print "Name of Todo > "
    response = get_input
    @todos << "#{response},no\n"
    save!
  end

  def mark_todo
    print "Which todo have you finished?"
    response = get_input
     @todos[1]["completed"] = "yes"
  end

  def todos
    @todos
  end

  private
  def get_input
    gets.chomp
  end

  def save!
    File.write(@file_name, @todos.to_csv)
  end
end
