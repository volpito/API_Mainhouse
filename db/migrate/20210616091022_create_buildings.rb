class CreateBuildings < ActiveRecord::Migration[6.1]
  def change
    create_table :buildings do |t|
      t.belongs_to :agency, index: true
      t.string :name
      t.string :reference
      t.string :city
      t.string :adress
      t.string :zipcode
      t.text :building_image
      t.timestamps
    end
  end
end
