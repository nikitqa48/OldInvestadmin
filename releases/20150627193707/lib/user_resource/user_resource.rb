module UserResource
  def self.included base
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def user_resource
      has_one :owner, class_name: 'User', foreign_key: :owner_id
      validates :owner_id, presence: true
    end
  end
end