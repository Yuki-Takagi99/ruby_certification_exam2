Foo = "main"

class Bar
  Foo = "foo"

  def self.foo
    ::Foo
  end
end

p Bar.foo
