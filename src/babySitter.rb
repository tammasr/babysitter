# also evaluate initial start, end case

class BabySitter
    MIDNIGHT_TIME = 24

    def initialize(start_time, end_time, bed_time)
        @start_time = start_time
        @end_time = end_time
        @bed_time = bed_time
    end

    def receives_12_per_hour
    	return (@bed_time - @start_time) * 12 if @start_time < @bed_time
    	return 0	
    end

    def receives_8_per_hour
    	return (@bed_time - @start_time) * 8 if @bed_time < MIDNIGHT_TIME
    	return @bed_time * 8 if MIDNIGHT_TIME < @bed_time
    	return 0	
    end
end




