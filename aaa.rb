

h = 0
m = 0
24.times do |i|
# if m == 0
m = 0
    3.times do |k|
        if m == 0
        puts h.to_s + ":00"
        puts " "
        m += 1
        elsif m == 1
            puts h.to_s + ":20"
            puts " "
            m += 1
        elsif m==2
            puts h.to_s + ":40"
            puts " "
            m += 1
        # elsif m == 3
        #     puts " "
        end
    end
     h += 1
end
        