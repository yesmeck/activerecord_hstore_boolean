require 'active_support'

module ActiverecordHstoreBoolean
  extend ActiveSupport::Concern

  TRUE_VALUES = [true, 1, '1', 't', 'T', 'y', 'Y', 'yes', 'YES', 'true', 'TRUE']
  STORED_TRUE_VALUE = 'true'
  STORED_FALSE_VALUE = 'false'

  module ClassMethods
    def hstore_boolean_values(attr_name, *keys)
      keys.map!(&:to_sym)
      before_save "normalize_#{attr_name}_boolean_value"

      define_method("normalize_#{attr_name}_boolean_value") do
        self[attr_name].to_options!.each do |key, value|
          self[attr_name][key] = TRUE_VALUES.include?(value) ? STORED_TRUE_VALUE : STORED_FALSE_VALUE if keys.include?(key)
        end
      end

      define_method(attr_name) do
        self[attr_name].to_options!.each do |key, value|
          self[attr_name][key] = value == STORED_TRUE_VALUE if keys.include?(key)
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActiverecordHstoreBoolean)

