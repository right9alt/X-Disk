class User < ApplicationRecord
  # Логин не должен превышать 15 символов
  validates :login, uniqueness: true, length: { maximum: 15 }
  # Пароль должен содержать буквы, цифры и спецсимволы,
  # быть не менее 8 и не более 30 символов в длину
  PASSWORD_FORMAT = /\A
    (?=.*\d)           # должна быть хотя бы одна цифра
    (?=.*[a-z])        # должна быть хотя бы одна строчная буква
    (?=.*[A-Z])        # должна быть хотя бы одна заглавная буква
    (?=.*[[:^alnum:]]) # должен быть хотя бы один спецсимвол
    .{8,30}            # должен быть не менее 8 и не более 30 символов в длину
  \z/x

  has_secure_password
  validates :password, presence: true, length: { minimum: 8, maximum: 30 }, format: { with: PASSWORD_FORMAT }
  validates :password_confirmation, presence: true
  
  # Пароль должен совпадать в полях "пароль" и "пароль повторно" при отправке формы
  validates_confirmation_of :password

  has_many :uploads, dependent: :destroy

  # Проверка доступного места для пользователя
  def available_space
    10.megabytes - self.uploads.sum { |upload| upload.file.size }

  end
end
