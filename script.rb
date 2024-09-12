# Друкуємо всі аргументи, передані в скрипт
puts "Arguments passed: #{ARGV}"

# Отримуємо перший аргумент (вибір користувача)
user_choice = ARGV[0]

# Перевіряємо, чи вибір користувача коректний
if ["rock", "scissors", "paper"].include?(user_choice)
  # Комп'ютер вибирає випадковий варіант
  choices = ["rock", "scissors", "paper"]
  computer_choice = choices.sample

  # Виводимо вибір користувача і комп'ютера
  puts "Your choice: #{user_choice}"
  puts "Computer's choice: #{computer_choice}"

  # Перевіряємо результат
  if user_choice == computer_choice
    puts "It's a tie!"
  elsif (user_choice == "rock" && computer_choice == "scissors") ||
        (user_choice == "scissors" && computer_choice == "paper") ||
        (user_choice == "paper" && computer_choice == "rock")
    puts "You win!"
  else
    puts "You lose!"
  end
else
  puts "Invalid choice. Choose rock, scissors, or paper."
end
