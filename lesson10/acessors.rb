module Accessors
  class << self
    def included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def attr_accessor_with_history(*names)
        names.each do |name|
          var_name = "@#{name}".to_sym
          var_name_history = "@#{name}_history".to_sym
          define_method(name) { instance_variable_get(var_name) }
          define_method("#{name}_history") { instance_variable_get(var_name_history) }
          define_method("#{name}=".to_sym) do |value|
            cur_value = instance_variable_get(var_name)
            history = instance_variable_get(var_name_history) || []
            instance_variable_set(var_name_history, history << cur_value)
            instance_variable_set(var_name, value)
          end
        end
      end

      def strong_attr_accessor(name, this_class)
        var_name = "@#{name}"
        define_method(name) { instance_variable_get(var_name) }
        define_method("#{name}=") do |value|
          raise Exception, 'Class error' unless value.is_a? this_class
          instance_variable_set(var_name, value)
        end
      end
    end
  end
end
