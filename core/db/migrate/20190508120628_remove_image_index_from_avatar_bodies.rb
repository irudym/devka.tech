class RemoveImageIndexFromAvatarBodies < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key "avatar_bodies", "images"
  end
end
