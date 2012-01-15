class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :body
      t.integer :member_id
    end
  end

  def self.down
    drop_table :polls
  end
end

