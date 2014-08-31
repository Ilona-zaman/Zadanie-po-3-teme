#Задание 1
a=[1,5,3,7,2,6,12]
for i in a
	print "#{i}"+" "
end
puts 

i=0
while i<a.size do
	print a[i].to_s+" "
	i+=1
end
puts

i=0
b=3
begin
	print (a[i]+b).to_s+" "
	i+=1
end while i<a.size
puts

a.each{|el| print "#{el} "}
puts

#Задание 2
5.upto(1000){|i| print "#{i} "}
puts

range = Range.new(1,1000)
range.each{|el| print "#{el} "}
puts

(1..999).step(2) do |n|
print n,' '
end
puts

i=0
loop do puts "Hello,Ruby"
i+=1
break if i==10
end

#Задание 3
def season(day, year)
answer="incorrect data"
	if year%4==0 then
		if day>60 && day<=152 then
			answer= "now spring in a leap year"
		elsif day>152 && day<=244 then
			answer= "now summer in a leap year"
		elsif day>244 && day<=335 then
			answer= "now autumn in a leap year"
		elsif day>335 && day<367 || day<=60 && day>0 then
			answer= "now winter in a leap year" 
		end
	else  
		if day>59 && day<=151 then
			answer= "now spring in the normal year"
		elsif day>151 && day<=243 then
			answer= "now summer in the normal year"
		elsif day>243 && day<=334 then
			answer= "now autumn in the normal year"
		elsif day>334 && day<367 || day<=59 && day>0 then
			answer= "now winter in the normal year"
		end 
	end
return answer
end

puts season(0, 2016)
puts season(5, 2016)
puts season(380, 2016)
puts season(25, 2011)
puts season(76, 2015)

#Задание 4
def each_value(hash, &block)
i=0
mass=hash.to_a
while i<mass.size
	if block_given? then
		block.call(mass[i])
	end
	i+=1
end
end

people={"Юра"=>23, "Илона"=>20, "Вася"=>50}

each_value(people){|i| print "#{i}"}
puts

#Задание 5
def find_each(array, element, &block)
i=0
find=Array.new
while i<array.size do
	if array[i]>20 then
		find.push(array[i])
		if block_given? then
			block.call(array[i])
		end
	end
i+=1
end
return find
end

arr=[5,2,3,8,45,65,47,21,15,3,4]

print find_each(arr, 10){|el| puts "найдено число "+"#{el}"+", удовлетворяющее запросу "}
puts
print find_each(arr, 10)
puts

#Задание 6
def each_value(hash, some_proc)
i=0
mass=hash.to_a
while i<mass.size
	some_proc.call(mass[i])
	i+=1
end
end

people={"Юра"=>23, "Илона"=>20, "Вася"=>50}

proc=Proc.new do |i|
  print "#{i}"
end

each_value(people, proc)
puts



def find_each(array, element, some_proc=nil)
i=0
find=Array.new
while i<array.size do
	if array[i]>20 then
		if some_proc != nil then
			some_proc.call(array[i])
		end
		find.push(array[i])
	end
i+=1
end
return find
end

finding=Proc.new do |el|
  puts "найдено число "+"#{el}"+", удовлетворяющее запросу "
end

arr=[5,2,3,8,45,65,47,21,15,3,4]

print find_each(arr, 10, finding)
puts
print find_each(arr, 10)
puts

#Задание 7
def check(array, function=nil, &block)
i=0
correct=Array.new
while i<array.size do
	if block_given? then
		a=block.call(array[i])
	end 
	if function != nil then
		b=function.call(array[i])	
	end
	if a == true || b == true || a==true && b==true then 
		correct.push(array[i]) 
	end
i+=1
end
return correct
end


items=["my_string", 1,77,64,nil]

check_functoin=Proc.new{|item| item.is_a?(Integer) && item> 50}

print check(items) {|item| item.is_a?(String)}
puts
print check(items, check_functoin) 
puts
print check(items, check_functoin){|item| item.is_a?(NilClass)}
puts


