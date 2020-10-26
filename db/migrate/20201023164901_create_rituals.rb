class CreateRituals < ActiveRecord::Migration
  def change
    create_table :rituals do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.integer :user_id
    end
  end
end
