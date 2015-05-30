def set_no_days(year, month)
    case month
      when 4 then 1..30
      when 6 then 1..30
      when 9 then 1..30
      when 11 then 1..30
      when 2 then 1..28
      when 2 && Date.gregorian_leap?(year) then 1..29
      else 1..31
    end
end

def setup_month(year, month, no_of_days)
   @all_days_in_month = Array.new(0)
   first_day_name = Date.parse("#{year}-#{month}-01").strftime("%A")
   
   case first_day_name
    when "Monday" then
        no_of_days.each {|day| @all_days_in_month << day  }
    when "Tuesday" then
        @all_days_in_month[0] = nil
        no_of_days.each {|day| @all_days_in_month << day  }
    when "Wednesday" then
        @all_days_in_month[0] = nil
        @all_days_in_month[1] = nil
        no_of_days.each {|day| @all_days_in_month << day  }
    when "Thursday" then
        @all_days_in_month[0] = nil
        @all_days_in_month[1] = nil
        @all_days_in_month[2] = nil
        no_of_days.each {|day| @all_days_in_month << day  }
    when "Friday" then
        @all_days_in_month[0] = nil
        @all_days_in_month[1] = nil
        @all_days_in_month[2] = nil
        @all_days_in_month[3] = nil
        no_of_days.each {|day| @all_days_in_month << day  }
    when "Saturday" then
        @all_days_in_month[0] = nil
        @all_days_in_month[1] = nil
        @all_days_in_month[2] = nil
        @all_days_in_month[3] = nil
        @all_days_in_month[4] = nil
        no_of_days.each {|day| @all_days_in_month << day  }
    when "Sunday" then
        @all_days_in_month[0] = nil
        @all_days_in_month[1] = nil
        @all_days_in_month[2] = nil
        @all_days_in_month[3] = nil
        @all_days_in_month[4] = nil
        @all_days_in_month[5] = nil
        no_of_days.each {|day| @all_days_in_month << day  }
   end
end

def draw_days (no_of_days)
  flow width: 210, height: 50 do
    stack width: 30, height: 30 do
      para "Mo", align: "center"
    end
    stack width: 30, height: 30 do
      para "Tu", align: "center"
    end
    stack width: 30, height: 30 do
      para "We", align: "center"
    end
    stack width: 30, height: 30 do
      para "Th", align: "center"
    end
    stack width: 30, height: 30 do
      para "Fr", align: "center"
    end
    stack width: 30, height: 30 do
      para "Sa", align: "center"
    end
    stack width: 30, height: 30 do
      para "Su", align: "center"
    end
    
    @all_days_in_month.each do |day|
      stack width: 30, height: 30 do
        unless day == nil
            button day.to_s, width: 30, height: 30 do
              @selected_date = "#{@year}-#{@month}-#{day.to_s}" 
              alert @selected_date
            end
        end
      end
    end
  end
end

def draw_year_slot
  @year_slot.clear
  @year_slot.append {para "Year: #{@year}", :align => "center"}
end

def draw_month_slot
  @month_slot.clear
  @month_slot.append {para "Month: #{@month}", :align => "center"}
end

def draw_days_slot
  @days_slot.clear
  @days_slot.append {draw_days(@no_of_days)}
end