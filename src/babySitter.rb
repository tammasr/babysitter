#######################
#BabySitter Kata
#@author: Sravya Tamma
#Date : 04/02/2016
#Code assumes timings are entered in 24 hour fashion
#######################

class BabySitter
    MIDNIGHT_TIME = 24
    RATE_BEFORE_BED_TIME = 12
    RATE_AFTER_BED_TIME = 8
    RATE_AFTER_MIDNIGHT = 16

    def initialize(start_time, bed_time, end_time)
        @start_time = start_time
        @end_time = end_time
        @bed_time = bed_time
    end

    def receives_12_per_hour
        if @end_time.between?(1,4)
    	   return (@bed_time - @start_time) * RATE_BEFORE_BED_TIME if @start_time < @bed_time
        else
            if @end_time > @bed_time
                return (@bed_time - @start_time) * RATE_BEFORE_BED_TIME 
            else
                return (@end_time - @start_time) * RATE_BEFORE_BED_TIME 
            end
        end
        return 0 
    end

    def receives_8_per_hour
        if @end_time.between?(1,4)
            return (MIDNIGHT_TIME - @start_time) * RATE_AFTER_BED_TIME if @start_time < MIDNIGHT_TIME && @start_time > @bed_time
    	    return (MIDNIGHT_TIME - @bed_time) * RATE_AFTER_BED_TIME   if @start_time < MIDNIGHT_TIME && @bed_time < MIDNIGHT_TIME
        else
            return (@end_time - @bed_time) * RATE_AFTER_BED_TIME if @end_time > @bed_time && @start_time <= @bed_time
            return (@end_time - @start_time) * RATE_AFTER_BED_TIME if @end_time > @bed_time && @start_time >= @bed_time
        end
        return 0
    end

    def receives_16_per_hour
        if @end_time.between?(1,4)
            return @end_time * RATE_AFTER_MIDNIGHT if @end_time.between?(1, 4)
        end
        return 0
    end

    def calculate
        #if babysitter started after midnight
        if (@start_time.between?(1,4))
            return receives_16_per_hour() 
        else
            #if babysitter started before midnight i.e., b/w 17 (5PM) and 24 (12AM)
            return receives_12_per_hour() + receives_8_per_hour() + receives_16_per_hour()
        end
    end
end




