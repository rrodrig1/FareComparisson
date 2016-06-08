class CreateAnticipations < ActiveRecord::Migration
  def change
    create_table :anticipations do |t|
      t.integer :advance
      t.string :description

      t.timestamps

    end
  end
end
