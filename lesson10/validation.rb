module Validation
  class << self
    def included(base)
      base.extend ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      attr_reader :validation_sets

      def validate(name, valid_type, sets = nil)
        @validation_sets = {}
        @validation_sets[name] = []
        @validation_sets[name] << { valid_type: valid_type, sets: sets }
      end
    end

    module InstanceMethods
      def valid?
        validate!
      rescue StandardError
        false
      end

      def presence_validation(attr_name, *)
        raise 'No attribute name' if attr_name.nil? || attr_name == ''
      end

      def format_validation(attr_name, format)
        raise 'Wrong format' if attr_name !~ format
      end

      def type_validation(attr_name, type)
        raise 'Wrong type' if attr_name.is_a?(type)
      end

      def validate!
        self.class.validation_sets.each do |name, valid|
          attr_name = instance_variable_get("@#{name}".to_sym)
          valid.each do |validation|
            method_is = "#{validation[:valid_type]}_validation".to_sym
            send(method_is, attr_name, validation[:sets])
          end
        end
      end
    end
  end
end
