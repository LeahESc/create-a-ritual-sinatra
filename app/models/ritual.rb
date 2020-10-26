class Ritual < ActiveRecord::Base
    belongs_to :categories
    belongs_to :users
    validates :title, presence: true
end 