def debug obj
  Debugger.obj = obj
end

def d
  Debugger.obj
end

class Debugger

  @@obj = nil

  def self.obj= obj
    puts "debugging (d = #{obj})"
    @@obj = obj
  end

  def self.obj
    @@obj
  end

end
