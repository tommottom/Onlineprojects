class CreateYoutubes < ActiveRecord::Migration
  def change
    create_table :youtubes do |t|

      t.timestamps null: false
    end
  end
end
