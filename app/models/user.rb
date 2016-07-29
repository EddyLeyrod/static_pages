class User < ApplicationRecord
	before_save { self.email = email.downcase } #antes de guardar convierte a minisculas
	validates :name, presence: true, length: { maximum: 50 }
	 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    #uniqueness: true #NO VALIDA ENTRE MAYUSCULAS Y MINIUCULAS
                    uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }                   
	
end
