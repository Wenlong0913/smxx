class MobilePhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A1[358]\d{9}\z/i
      record.errors[attribute] << (options[:message] || "is not an mobile")
    end
  end
end
