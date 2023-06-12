class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :customer, null: false, foreign_key: { to_table: :users }, index: true
      t.references :place, null: false, foreign_key: { to_table: :places }, index: true
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :bill, null: false
      t.timestamps
    end
  end
end
