class Ritual < ActiveRecord::Base
    belongs_to :category
    belongs_to :user
    validates :title, :description, presence: true
end 