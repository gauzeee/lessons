module Validation
  class << self
    def included(base)
      base.extend ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      attr_reader :validation_sets

      def validate(name, valid_type, params = nil)
        @validation_sets = {}
        @validation_sets[name] = []
        @validation_sets[name] << { valid_type: valid_type, params: params }
      end
    end

    module InstanceMethods
      def valid?
        validate!
      rescue StandardError
        false
      end

      def presence_validation(attr_value, *)
        raise 'No attribute name' if attr_value.nil? || attr_value == ''
      end

      def format_validation(attr_value, format)
        raise 'Wrong format' if attr_value !~ format
      end

      def type_validation(attr_value, type)
        raise 'Wrong type' unless attr_value.is_a?(type)
      end

      def validate!
        self.class.validation_sets.each do |name, valid|
          attr_value = instance_variable_get("@#{name}".to_sym)
          valid.each do |validation|
            method_is = "#{validation[:valid_type]}_validation".to_sym
            send(method_is, attr_value, validation[:params])
          end
        end
      end
    end
  end
end
