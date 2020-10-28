class User < ActiveRecord::Base
    has_many :rituals
    has_many :categories, through: :rituals
    has_secure_password
    validates :username, :email, :password, presence: true
    validates :email, uniqueness: true
end 