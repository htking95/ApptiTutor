class AddAvatarsToUsers < ActiveRecord::Migration
  def self.up
    change_table :userlogins do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :userlogins, :avatar
  end
end
