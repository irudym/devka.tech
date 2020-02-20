class AddImagesToAvatarEyes < ActiveRecord::Migration[5.2]
  def change
    add_reference :avatar_eyes, :image, foreign_key: false
  end
end
