class CreatePostages < ActiveRecord::Migration[5.0]
  def change
    create_table :postages do |t|

      t.timestamps
    end
  end
end
uiお