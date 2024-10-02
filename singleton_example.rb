class Singleton
  # Класова змінна для зберігання єдиного екземпляра класу
  @instance = nil

  # Метод для отримання єдиного екземпляра класу
  def self.instance
    # Якщо @instance ще не створено, створюємо новий екземпляр
    @instance ||= new
  end

  # Приватний конструктор, щоб запобігти створенню нових екземплярів
  private_class_method :new

  # Метод для демонстрації роботи синглтона
  def show_message
    puts "This is the only instance of the Singleton class!"
  end
end

# Використання патерну Singleton
singleton1 = Singleton.instance  # Отримуємо перший екземпляр
singleton2 = Singleton.instance  # Отримуємо той же екземпляр

# Перевіряємо, що обидва змінні вказують на один і той же об'єкт
puts "Are the objects the same? #{singleton1.object_id == singleton2.object_id}"  # true

# Виклик методу для демонстрації
singleton1.show_message
