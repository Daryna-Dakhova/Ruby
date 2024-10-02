def cut_cake(cake)
  raisins = []
  rows = cake.size
  cols = cake[0].size

  # Збираємо координати родзинок
  cake.each_with_index do |row, r|
    row.chars.each_with_index do |cell, c|
      raisins << [r, c] if cell == 'o'
    end
  end

  num_raisins = raisins.size
  pieces = []

  # Розрізаємо пиріг на n частин, кожна з яких містить одну родзинку
  raisins.each do |(row, col)|
    piece = []

    # Визначаємо, скільки рядків і стовпців буде в шматку
    top = [0, row].min
    bottom = [rows - 1, row + (num_raisins - 1)].min
    left = [0, col].min
    right = [cols - 1, col + (num_raisins - 1)].min

    (top..bottom).each do |r|
      piece_row = cake[r][left..right].gsub(' ', '.')
      piece << piece_row
    end

    pieces << piece
  end

  # Вибір кращого варіанту (максимальна ширина першого шматка)
  best_result = pieces.uniq.max_by { |piece| piece[0].length }

  best_result
end

# Приклад використання
cake = [
  '.o......',
  '......o.',
  '....o...',
  '..o.....'
]

result = cut_cake(cake)

# Виводимо результат у потрібному форматі
if result
  puts "Результат:"
  result.each_with_index do |piece, index|
    puts "Шматок #{index + 1}:"
    puts piece
    puts # Додаємо порожній рядок для відступу
  end
else
  puts "No valid pieces found"
end
