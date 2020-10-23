class CreateRituals < ActiveRecord::Migration
  def change
    create_table :rituals do |t|
      t.string :name
      t.text :description
      t.integer :category_id
    end
  end
end
