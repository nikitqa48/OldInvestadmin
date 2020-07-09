module Export
  def self.included base
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def export
      self.all.map{|a| a.respond_to?(:export) ? a.export : a.attributes}
    end
  end
end