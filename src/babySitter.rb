#######################
#BabySitter Kata
#@author: Sravya Tamma
#Date : 04/02/2016
#Code assumes timings are entered in 24 hour format
#######################

class BabySitter
    MIDNIGHT_TIME = 24
    RATE_BEFORE_bed = 12
    RATE_AFTER_bed = 8
    RATE_AFTER_MIDNIGHT = 16

    def initialize(starttime, bedtime, endtime)
        #@start, @end, @bed represents times in 24 hour format
        @start = starttime
        @end = endtime
        @bed = bedtime
    end

    def receives_12_start_to_bedtime
        if (@start.between?(17, 24) && @start < @bed)
            if @end.between?(1,4)
    	       return (@bed - @start) * RATE_BEFORE_bed
            else
                if @end > @bed
                    return (@bed - @start) * RATE_BEFORE_bed 
                else
                    return (@end - @start) * RATE_BEFORE_bed 
                end
            end
        end
        return 0 
    end

    def receives_8_bedtime_to_midnight
        if (@start.between?(17, 24))
            if @end.between?(1,4)
                return (MIDNIGHT_TIME - @start) * RATE_AFTER_bed if @start < MIDNIGHT_TIME && @start > @bed
    	       return (MIDNIGHT_TIME - @bed) * RATE_AFTER_bed   if @start < MIDNIGHT_TIME && @bed < MIDNIGHT_TIME
            else
                return (@end - @bed) * RATE_AFTER_bed if @end > @bed && @start <= @bed
                return (@end - @start) * RATE_AFTER_bed if @end > @bed && @start >= @bed
            end
        end
        return 0
    end

    def receives_16_midnight_to_end
        if @end.between?(1,4)
            return @end * RATE_AFTER_MIDNIGHT if @start.between?(17, 24)
            return (@end - @start) * RATE_AFTER_MIDNIGHT if @start.between?(1, 4)
        end
        return 0
    end

    def calculate
        #if babysitter started after midnight
        if (@start.between?(1,4))
            return receives_16_midnight_to_end() 
        else
            #if babysitter started before midnight i.e., b/w 17 (5PM) and 24 (12AM)
            return receives_12_start_to_bedtime() + receives_8_bedtime_to_midnight() + receives_16_midnight_to_end()
        end
    end
end




