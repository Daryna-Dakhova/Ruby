# Функція для пошуку родзинок у торті
def find_raisins(cake)
  cake.each_with_index.flat_map do |row, r|
    row.chars.each_index.map { |c| [r, c] if row[c] =~ /[оo]/ }.compact
  end
end

# Функція для перевірки, чи містить прямокутник одну родзинку
def contains_one_raisin?(cake, r1, r2, c1, c2)
  (r1..r2).sum { |r| cake[r][c1..c2].count(/[оo]/) } == 1
end

# Функція для нарізки торта на n прямокутних частин
def cut_cake(cake)
  raisins = find_raisins(cake)
  n = raisins.size
  rows = cake.size
  cols = cake[0].size
  slices = []

  # Спробувати горизонтальну нарізку
  if rows >= n
    slice_height = rows / n
    (0...n).each do |i|
      r1 = i * slice_height
      r2 = [r1 + slice_height - 1, rows - 1].min
      if contains_one_raisin?(cake, r1, r2, 0, cols - 1)
        slices << cake[r1..r2]
      else
        break
      end
    end
  end

  # Спробувати вертикальну нарізку
  if cols >= n && slices.empty?
    slice_width = cols / n
    (0...n).each do |i|
      c1 = i * slice_width
      c2 = [c1 + slice_width - 1, cols - 1].min
      if contains_one_raisin?(cake, 0, rows - 1, c1, c2)
        slices.concat(cake.map { |row| row[c1..c2] })
      else
        break
      end
    end
  end

  # Виведення результатів
  if slices.empty?
    puts 'Неможливо нарізати торт на задану кількість частин з родзинками.'
  else
    slices.each_with_index do |slice, index|
      puts "Шматок #{index + 1}:"
      slice.each { |row| puts row }
      puts "--------"
    end
  end
end

# Функція для розподілу торта за родзинками
def divide_cake_by_raisins(cake)
  return puts 'У всіх рядках має бути однакова кількість елементів.' unless cake.all? { |row| row.length == cake[0].length }

  cake_matrix = cake.map { |row| row.chars.map { |cell| cell =~ /[оo]/ ? 0 : 1 } }
  raisin_count = cake_matrix.flatten.count(0)

  return puts 'Неможливо поділити торт: немає родзинок.' if raisin_count.zero?
  area = cake_matrix.size * cake_matrix[0].size

  return puts 'Неможливо поділити торт: площа не ділиться на кількість родзинок.' if area % raisin_count != 0

  rect_area = area / raisin_count
  possible_sizes = (1..rect_area).select { |h| rect_area % h == 0 }

  rectangles = []
  possible_sizes.each do |size|
    height, width = size, rect_area / size
    next unless cake_matrix.size % height == 0 && cake_matrix[0].size % width == 0

    valid = true
    (0...cake_matrix.size).step(height) do |r|
      (0...cake_matrix[0].size).step(width) do |c|
        if (0...height).sum { |i| cake_matrix[r + i][c, width].count(0) } != 1
          valid = false
          break
        end
      end
      break unless valid
    end

    if valid
      (0...cake_matrix.size).step(height) do |r|
        (0...cake_matrix[0].size).step(width) do |c|
          rectangles << (0...height).map { |i| cake[r + i][c, width] }
        end
      end
      break
    end
  end

  if rectangles.empty?
    puts 'Неможливо поділити торт так, щоб у кожному прямокутнику була одна родзинка.'
  else
    rectangles.each_with_index do |rectangle, index|
      puts "Шматок #{index + 1}:"
      rectangle.each { |row| puts row }
      puts "--------"
    end
  end
end

# Введення трьох тортів
cakes = [
  [
    '.о......',
    '......o.',
    '....o...',
    '..o.....'
  ],
  [
    '........',
    '......o.',
    '........',
    '..o.....'
  ],
  [
    '.о..o...',
    '........',
    '..o.....',
    '......o.'
  ]
]

# Виводимо торт та результат нарізки
cakes.each_with_index do |cake, index|
  puts "Торт #{index + 1}:"
  puts cake.join("\n")
  divide_cake_by_raisins(cake)
  puts "\n"
end
