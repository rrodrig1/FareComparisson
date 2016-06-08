class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :user_id
      t.integer :passengers
      t.string :frecuency
      t.time :departure
      t.string :destination
      t.string :source
      t.integer :anticipation_id
      t.string :name

      t.timestamps

    end
  end
end
