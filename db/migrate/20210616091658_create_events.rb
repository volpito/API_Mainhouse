class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.belongs_to :agency, index: true
      t.belongs_to :building, index: true
      t.string :title
      t.string :description
      t.datetime :datetime
      t.integer :duration

      t.timestamps
    end
  end
end
