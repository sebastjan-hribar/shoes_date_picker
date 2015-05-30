require "shoes_date_picker/version"
require_relative 'shoes_date_picker/dp_helpers.rb'
require 'date'

class ShoesDatepicker < Shoes::Widget
  def initialize(color = deepskyblue)
    window title: "Date picker", margin: 35, width: 210, height: 430 do
      background color
      @month = Time.now.month
      @year = Time.now.year
      @day = Time.now.day
      @today = "#{@year}-#{@month}-#{@day}"
      @no_of_days = set_no_days(@year, @month)
      setup_month(@year, @month, @no_of_days)
      
      @year_slot = stack margin_bottom: 5 do
        para "Year: #{@year}", :align => "center"
      end
  
      @month_slot = stack margin_bottom: 5 do
        para "Month: #{@month}", :align => "center"
      end
  
      @today_slot = flow do
        button "#{@today}", margin_bottom: 15 do
          @selected_date = @today
          alert @selected_date
        end
      end
  
      @year_buttons_slot = flow height: 60 do
        para "Change year"
  
        button "<" do
          @year = @year - 1
          @no_of_days = set_no_days(@year, @month)
          draw_year_slot
          @month = 1
          setup_month(@year, @month, @no_of_days)
          draw_month_slot
          draw_days_slot
        end
  
        button ">" do
          @year = @year + 1
          @no_of_days = set_no_days(@year, @month)
          draw_year_slot
          @month = 1
          setup_month(@year, @month, @no_of_days)
          draw_month_slot
          draw_days_slot
        end
      end
  
      @month_buttons_slot = flow height: 60 do
        para "Change month"
  
        button "<" do    
          @month = @month - 1
          if @month == 0
            @month = 12
            @year = @year - 1
            @no_of_days = set_no_days(@year, @month)
            setup_month(@year, @month, @no_of_days)
            draw_month_slot
            draw_year_slot
            draw_days_slot
          
          else
            @no_of_days = set_no_days(@year, @month)
            setup_month(@year, @month, @no_of_days)
            draw_month_slot
            draw_year_slot
            draw_days_slot
          end
        end
  
        button ">" do
          @month = @month + 1
          if @month == 13
            @month = 1
            @year = @year + 1
            @no_of_days = set_no_days(@year, @month)
            setup_month(@year, @month, @no_of_days)
            draw_month_slot
            draw_year_slot
            draw_days_slot
          else
            @no_of_days = set_no_days(@year, @month)
            setup_month(@year, @month, @no_of_days)
            draw_month_slot
            draw_year_slot
            draw_days_slot
          end
        end
      end
  
      @days_slot = flow do
        draw_days(@no_of_days)
      end
    end
  end
end


