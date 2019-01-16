class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.references :profile, foreign_key: true
      t.string :standard
      t.string :start
      t.string :end
      t.string :from_where
      t.string :school_college
      t.string :university
      t.timestamps
    end
  end
end
