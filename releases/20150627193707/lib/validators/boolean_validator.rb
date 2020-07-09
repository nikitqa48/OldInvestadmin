class BooleanValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if !!value != value and !(options[:allow_nil] and value.nil?)
      record.errors[attribute] << (options[:message] || I18n.t('messages.validation.must_be_a_boolean'))
    end
  end
end
