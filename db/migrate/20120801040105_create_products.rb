class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price, :precision => 5, :scale => 2
      t.integer :featured
      t.date :avaliable_on
      t.timestamps
    end
  end
end
