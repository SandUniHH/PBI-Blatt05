#!/usr/bin/env ruby

# Bocher Diedrich Sandmeier

# a
print "\na: "
(1..10).step(2) {|i|
                  print "#{i} "
                }

# b
print "\nb: "
(5..18).step(3) {|i|
                  print "#{i} "
                }

# c
print "\nc: "
x = (13..19)
(x.last).downto(x.first).each{|i|
			    print "#{i} "
			    }
puts
puts