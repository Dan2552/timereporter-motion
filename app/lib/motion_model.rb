module MotionModel
  module Model
    def cast_to_date(arg)
      case arg
        when String
          formatter = NSDateFormatter.new
          formatter.setDateFormat "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
          return formatter.dateFromString "2013-04-01T09:00:00+01:00"
        when Time
          return arg.strftime('%Y/%m/%d %H:%M').to_date # uses the SugarCube data detector
        else
          return arg
      end
    end
  end
end

