def valid_ipv4?(ip)
  # Розділяємо IP-адресу на частини по крапках
  parts = ip.split(".")
  
  # Перевіряємо, чи є рівно 4 частини
  if parts.length != 4
    return false
  end

  # Перевіряємо кожну частину IP-адреси
  parts.each do |part|
    # Перевіряємо, чи частина є числом і чи лежить у діапазоні від 0 до 255
    if part.to_i.to_s != part || part.to_i < 0 || part.to_i > 255
      return false
    end
  end

  # Якщо всі частини пройшли перевірку, повертаємо true
  return true
end

# Приклади використання
puts valid_ipv4?("10.0.0.1")       # true
puts valid_ipv4?("172.16.254.1")   # true
puts valid_ipv4?("192.168.100.256") # false (число більше 255)
puts valid_ipv4?("001.1.1.1")      # false (ведучі нулі)
puts valid_ipv4?("192.168")        # false (неповна адреса)
puts valid_ipv4?("192.300.1.1")    # false (число більше 255)
