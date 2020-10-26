class Ritual < ActiveRecord::Base
    belongs_to :category
    belongs_to :user
    validates :title, presence: true
end 