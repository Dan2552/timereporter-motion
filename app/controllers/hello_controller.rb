class HelloController < UIViewController
  extend IB

  attr_accessor :data_source

  ## ib outlets
  outlet :btn_hello

  def say_hello(sender)
    puts "hello"
  end

end
