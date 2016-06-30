class CreateRecips < ActiveRecord::Migration
  def change
    create_table :recips do |t|
 t.string :name
      t.string :group
      t.string :cost
      t.string :costprice
		t.string :qty
t.string :size
t.string :tax
t.string :unittype
      t.timestamps null: false
      t.timestamps null: false
    end
  end
end
