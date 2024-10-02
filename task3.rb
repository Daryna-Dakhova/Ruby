def cut_cake(cake)
  rows = cake.size
  cols = cake[0].size
  raisins = []

  # Збираємо координати родзинок
  cake.each_with_index do |row, r|
    row.chars.each_with_index do |cell, c|
      raisins << [r, c] if cell == 'o'
    end
  end

  # Розрізаємо горизонтально або вертикально (кілька варіантів)
  horizontal_cuts = []
  vertical_cuts = []

  # Горизонтальне розрізання
  raisins.each_cons(1) do |r1|
    horizontal_cuts << cake[0..r1[0][0]]
  end

  # Вертикальне розрізання
  raisins.each_cons(1) do |c1|
    vertical_cuts << cake[0..c1[0][1]]
  end

  # Створюємо рішення у вигляді масиву шматочків
  solutions = []

  # Горизонтальне рішення
  horizontal_solution = raisins.map do |(row, col)|
    piece = cake[row].chars.map.with_index { |cell, c| c == col ? 'o' : '.' }.join
    [piece]
  end

  solutions << horizontal_solution

  # Вибираємо найкраще рішення з найбільшою шириною першого шматка
  best_solution = solutions.max_by { |solution| solution[0][0].length }

  best_solution
end

# Приклад використання
cake = [
  '.....o..',
  '..o.....',
  '...o....',
  '.o....o.',
]

result = cut_cake(cake)

# Виводимо результат
if result.any?
  puts "Рішення:"
  result.each_with_index do |piece, index|
    puts "Шматок #{index + 1}:"
    piece.each { |row| puts row }
    puts # Порожній рядок для відступу
  end
else
  puts "No valid pieces found"
end
