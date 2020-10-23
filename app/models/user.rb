class User < ActiveRecord::Base
    has_many :categories
    has_many :rituals, through: :categories
    validates :username, :email, :password, presence: true
end 