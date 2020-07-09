Object.class_eval do
  def to_jsonp params
    callback_name = ""
    if params.is_a? Hash
      callback_name = params["callback"]
    elsif params.is_a? String
      callback_name = params
    end
    callback_name.to_s + "(" + self.to_json + ")"
  end
end