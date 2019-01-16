class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :fixed_address
      t.string :temp_address
      t.string :profession
      t.string :company
      t.boolean :employee_employer
      t.timestamps
    end
  end
end
