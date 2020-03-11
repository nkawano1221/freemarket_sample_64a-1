class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image_file, null: false
      t.timestamps
    end
  end
end