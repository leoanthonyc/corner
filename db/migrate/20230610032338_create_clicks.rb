class CreateClicks < ActiveRecord::Migration[7.0]
  def change
    create_table :clicks do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.references :clickable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
