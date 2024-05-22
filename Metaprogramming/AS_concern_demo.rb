class Object
  def tap2(&block)
    instance_eval(&block)
    self
  end
end

class MyClass
  def initialize
      @var = "instance var"
  end
  def foo
      "MyClass#foo"
  end

  private
  def bar
    "MyClass#bar"
  end
end
obj = MyClass.new
puts obj.tap2 { puts @var }.send(:bar)