class Category < ActiveRecord::Base
    has_many :rituals
    has_many :users

    def self.available_categories
        {:mental => 'Mental Well-Being',:physical => 'Physical Well-Being', :mind =>'Mindfulness', :personal => 'Personal Growth', :creative => 'Creative Pursuits',:emotional => 'Emotional Well-Being', :self_care => 'Self Care'}
    end
end 