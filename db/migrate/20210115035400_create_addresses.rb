class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.timestamps
      t.string      :postal_code,      null: false
      t.integer     :prefecture_id,    null: false
      t.string      :municiparity,     null: false
      t.string      :house_number,     null: false
      t.string      :building_name,    null: false
      t.string      :phone_number,     null: false
      t.references  :purchase,         foreign_key: true         
    end
  end
end
