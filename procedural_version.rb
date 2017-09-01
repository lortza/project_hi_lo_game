# original version from:
# https://www.vikingcodeschool.com/dashboard#/falling-in-love-with-ruby/procedural-ruby

hidden_num = rand(1..10)

puts "Hey, thanks for playing hi/lo!"
puts "You have three gueses to find the number 1-10"
puts "Make your first guess:"
print "> "

guess = gets.chomp.to_i

puts "Your guess was #{guess}!"

if guess == hidden_num
  puts "You WIN! It was indeed #{guess}!"
  exit
elsif guess > hidden_num
  puts "Go lower..."
else
  puts "Go higher..."
end


puts "Make your second guess:"
print "> "

guess = gets.chomp.to_i

puts "Your guess was #{guess}!"

if guess == hidden_num
  puts "You WIN! It was indeed #{guess}!"
  exit
elsif guess > hidden_num
  puts "Go lower..."
else
  puts "Go higher..."
end


puts "Make your final guess:"
print "> "

guess = gets.chomp.to_i

puts "Your guess was #{guess}!"

if guess == hidden_num
  puts "You WIN! It was indeed #{guess}!"
else
  puts "YOU LOSE! It was actually #{hidden_num}."
end