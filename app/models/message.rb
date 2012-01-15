class Message < ActiveRecord::Base
  belongs_to :member

  validates_presence_of :body
  validates_length_of :body, :in => 4..240, :allow_nil => false

  def self.find_all_messages(total=3)
    Message.find(:all, :limit => total, :order => 'id desc')
  end
  
end

