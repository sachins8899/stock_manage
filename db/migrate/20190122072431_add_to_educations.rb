class AddToEducations < ActiveRecord::Migration[5.2]
  def change
    add_column :educations, :subjects ,:string
  end
end
