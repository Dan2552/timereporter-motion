module MotionModel
  module Model
    def cast_to_date(arg)
      case arg
        when String
          formatter = NSDateFormatter.new
          formatter.setDateFormat "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
          result = formatter.dateFromString arg
          return result
        else
          return arg
      end
    end
  end
end
