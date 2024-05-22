require "byebug"
class ConStruct
  def self.new(*args, &block)
    Class.new do
      @args = args
      attr_accessor *args

      def initialize(*values)
        values.each_with_index do |value, index|
          send("#{self.class.args[index]}=", value)
        end
      end
      class_eval(&block) if block

      def [](key)
        send(key)
      end

      def []=(key, value)
        send("#{key}=", value)
      end

      def self.args
        @args
      end
    end
  end
end

# Product = ConStruct.new(:id, "name")
# obj = Product.new(1, "Ruby Book")
# puts obj.inspect
# puts obj.name
# puts obj[:name]
# obj[:name] = "RRR"
# puts obj.inspect
# obj["name"] = "Ruby course"
# puts obj.inspect

Product = ConStruct.new(:id, "name") do
  def to_s
    "<#{self.class} id:#{id} name:'#{name}'>"
  end
end

puts Product.new(123, "Ruby Book").to_s