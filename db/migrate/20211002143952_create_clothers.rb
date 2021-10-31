class CreateClothers < ActiveRecord::Migration[7.0]
  def change
    create_table :clothers do |t|
      t.string :description
      t.decimal :price
      t.string :image
      t.integer :trend_id
      t.integer :nominal_id
      t.integer :gender_id
      t.integer :category_id

      t.timestamps
    end
  end
end
