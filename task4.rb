def valid_ipv4?(ip)
  parts = ip.split(".")
  return false if parts.length != 4

  parts.each do |part|
    return false if part.to_i.to_s != part || part.to_i < 0 || part.to_i > 255 || part.start_with?('0') && part != '0'
  end

  true
end

# Приклади використання
puts valid_ipv4?("10.0.0.1")       # true
puts valid_ipv4?("172.16.254.1")   # true
puts valid_ipv4?("192.168.100.256") # false (число більше 255)
puts valid_ipv4?("001.1.1.1")      # false (ведучі нулі)
puts valid_ipv4?("192.168")        # false (неповна адреса)
puts valid_ipv4?("192.300.1.1")    # false (число більше 255)
