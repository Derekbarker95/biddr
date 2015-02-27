class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :description
      t.float :reserve
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
