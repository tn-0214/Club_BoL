class CreateRoomUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :room_users do |t|
      t.references :user,                    foreign_key: true, type: :integer
      t.references :room,                    foreign_key: true
      t.timestamps
    end
  end
end
