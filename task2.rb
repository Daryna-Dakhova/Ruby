# Функція для визначення пріоритету операторів 
def precedence(operator)
  case operator
  when '+', '-'
    return 1
  when '*', '/'
    return 2
  else
    return 0
  end
end

# Функція, щоб перевірити, чи це оператор
def is_operator?(char)
  return char == '+' || char == '-' || char == '*' || char == '/'
end

# Функція для перевірки ділення на нуль
def division_by_zero?(tokens)
  tokens.each_with_index do |token, i|
    if token == '/' && tokens[i + 1] == '0'
      return true
    end
  end
  return false
end

# Функція для перевірки синтаксичних помилок
def valid_expression?(tokens)
  return false if is_operator?(tokens.last) # Останній символ не повинен бути оператором

  tokens.each_with_index do |token, i|
    if is_operator?(token) && is_operator?(tokens[i + 1]) # Два оператори поспіль
      return false
    end
  end
  return true
end

# Функція для перетворення інфіксного виразу у RPN
def to_rpn(expression)
  tokens = expression.split(' ')  # Розбиваємо вираз на частини

  if division_by_zero?(tokens)
    return "Помилка: ділення на нуль"
  elsif !valid_expression?(tokens)
    return "Помилка: некоректний синтаксис"
  end

  output = []
  operators = []

  tokens.each do |token|
    if token.match?(/\d+/)  # Якщо це число
      output << token
    elsif is_operator?(token)  # Якщо це оператор
      while !operators.empty? && precedence(operators.last) >= precedence(token)
        output << operators.pop
      end
      operators << token
    end
  end
  
  # Виводимо всі залишкові оператори
  while !operators.empty?
    output << operators.pop
  end

  return output.join(' ')  # Повертаємо результат
end

# Отримання введення виразу з клавіатури
puts "Введіть математичний вираз (наприклад, 2 + 3 * 4):"
input = gets.chomp

# Обробка виразу та виведення результату
rpn_output = to_rpn(input)
puts "RPN результат: #{rpn_output}"
