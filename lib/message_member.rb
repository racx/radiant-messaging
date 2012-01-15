module MessageMember
  def self.included(base)
    base.class_eval {
      has_many :messages
    }
  end
  
end
