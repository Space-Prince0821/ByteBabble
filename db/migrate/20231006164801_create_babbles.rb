class CreateBabbles < ActiveRecord::Migration[7.0]
  def change
    create_table :babbles do |t|
      t.text :babble

      t.timestamps
    end
  end
end
