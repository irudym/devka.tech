class AddImagesToAvatarNoses < ActiveRecord::Migration[5.2]
  def change
    add_reference :avatar_noses, :image, foreign_key: true
  end
end
