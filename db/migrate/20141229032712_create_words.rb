class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.integer :syllable_count
      t.integer :syllable_emphasis
      t.integer :rank
      t.string :pronunciation

      t.timestamps
    end
  end
end
