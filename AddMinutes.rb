#AddMinutes - Object-Oriented Sample

class Minutes
  def initialize(timestamp)
    @timestamp = timestamp
  end

  def timestamp(timestamp)
    @timestamp = timestamp
  end

  def add(m)
    toks = @timestamp.split()
    tokens = toks[0].split(':')
    _is_pm = toks[-1].to_s.upcase == 'PM'
    hours = tokens[0].to_i
    if (hours < 0) || (hours > 12)
      raise('WARNING:Invalid Hours')
    end
    minutes = tokens[-1].to_i
    if (minutes < 0) || (minutes > 59)
      raise('WARNING:Invalid Minutes')
    end
    ms_per_minute = 60*1000
    ms_per_hour = 60*ms_per_minute
    ms = (hours*ms_per_hour) + (minutes*ms_per_minute) + (m*ms_per_minute)

    _hours = ms / ms_per_hour
    _ms = ms - (_hours*ms_per_hour)
    _minutes = (_ms / ms_per_minute)

    if (hours < 12) && (_hours >= 12)
      _is_pm = true
    end

    _hours.to_s+':'+(_minutes < 10 ? '0' : '')+_minutes.to_s+' '+(_is_pm ? 'PM' : 'AM')
  end

end

m = Minutes.new('09:22 AM')
puts m.add(20)

m.timestamp('11:48 AM')
puts m.add(13)

m.timestamp('00:22 AM')
puts m.add(20)

puts "="*40

m.timestamp('00:00 AM')
1.upto(100) {|i|
  puts m.add("#{i}".to_i)
}

