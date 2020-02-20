class CreateAvatarEyes < ActiveRecord::Migration[5.2]
  def change
    create_table :avatar_eyes do |t|

      t.timestamps
    end
  end
end
