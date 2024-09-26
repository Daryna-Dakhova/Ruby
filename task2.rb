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

# Функція для перетворення інфіксного виразу у RPN
def to_rpn(expression)
  output = []
  operators = []

  tokens = expression.split(' ')  # Розбиваємо вираз на частини
  
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

# Приклад використання
input = "2 + 1 * 4"
rpn_output = to_rpn(input)
puts "Вхідний вираз: #{input}"
puts "RPN результат: #{rpn_output}"
