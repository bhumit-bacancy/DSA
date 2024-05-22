module Custom
  module Concern
    def self.included(base)
      puts "1"
      base.extend ClassMethods
    end

    module ClassMethods
      def in_class(&block)
        puts "2"
        @included_block = block
      end

      def included(base)
        base.class_eval &@included_block

        # ClassMethods = Module.new #you can't use this bcz you can't creates constants define constants in instance method

        const_set :ClassMethodss, Module.new
        const_get(:ClassMethodss).module_eval &@class_methods_block
        base.extend const_get(:ClassMethodss)
      end

      def class_methods(&block)
        @class_methods_block = block
      end
    end
  end
end

module MyModule
  include Custom::Concern

  def instance_method
    "instance method"
  end

  in_class do
    attr_accessor :foo
  end

  class_methods do
    def class_method
      "class method"
    end
  end
end

class MyClass
  include MyModule  
end

# puts MyClass.new.instance_method
# puts MyClass.instance_methods(false).inspect
# puts MyModule.methods
puts MyClass.class_method