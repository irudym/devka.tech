class CreateAvatarHairs < ActiveRecord::Migration[5.2]
  def change
    create_table :avatar_hairs do |t|
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
