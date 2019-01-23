class CreatePersonsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :persons_tables do |t|
      t.string :name, null: false
      t.integer :house_id, null: false

      t.timestamps
    end
    add_index :people, :house_id
  end
end
