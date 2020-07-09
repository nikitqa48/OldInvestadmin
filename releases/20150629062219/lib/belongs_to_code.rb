module BelongsToCode
  def self.included base
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def belongs_to_code name
      belongs_to name, :foreign_key => "#{name}_code", :primary_key => "code"
    end
  end
end