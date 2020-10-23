class User < ActiveRecord::Base
    has_many :categories
    has_many :rituals, through: :categories
end 