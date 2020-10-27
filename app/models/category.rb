class Category < ActiveRecord::Base
    has_many :rituals
    has_many :users, through: :rituals
end 