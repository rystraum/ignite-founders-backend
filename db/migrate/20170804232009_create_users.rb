class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :birth_date
      t.string :email
      t.json :data

      t.timestamps
    end
  end
end
