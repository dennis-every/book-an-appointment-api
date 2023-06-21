class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.text :description, null: false
      t.string :photo
      t.string :location, null: false
      t.integer :rate, null: false
      t.references :owner, null: false, foreign_key: { to_table: :users }, index: true
      t.timestamps
    end
  end
end
