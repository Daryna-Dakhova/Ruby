require 'minitest/autorun'
require_relative 'task4'  # Імпортуємо метод з task4.rb

class TestValidIPv4 < Minitest::Test
  def test_valid_ipv4
    assert_equal true, valid_ipv4?("10.0.0.1")
    assert_equal true, valid_ipv4?("172.16.254.1")
  end

  def test_invalid_ipv4
    assert_equal false, valid_ipv4?("192.168.100.256")
    assert_equal false, valid_ipv4?("001.1.1.1")
    assert_equal false, valid_ipv4?("192.168")
    assert_equal false, valid_ipv4?("192.300.1.1")
  end

  def test_edge_cases
    assert_equal true, valid_ipv4?("255.255.255.255")  # максимальна допустима IPv4 адреса
    assert_equal true, valid_ipv4?("0.0.0.0")          # мінімальна допустима IPv4 адреса
    assert_equal false, valid_ipv4?("")                  # порожній рядок
    assert_equal false, valid_ipv4?("10.0.0.1.1")       # забагато частин
    assert_equal false, valid_ipv4?("10.0.0")           # замало частин
    assert_equal false, valid_ipv4?("10.0.0.-1")        # від'ємне число
    assert_equal false, valid_ipv4?("10.0.0.256")       # число більше 255
  end
end
