# here are the operations I support
operations = {}
operations[:+]  = %w(+ add addition plus)
operations[:-]  = %w(- sub subtract subtraction minus)
operations[:*]  = %w(* multiply times multiplication)
operations[:/]  = %w(/ div divide division)
operations[:**] = %w(** exponents powers power exp)
operations[:%]  = %w(% modulo mod modulus)

# get our numbers
puts "Hi! ^_^ Number, pls!"
user_input1 = gets.chomp

puts "kk. Moar number pls!"
user_input2 = gets.chomp

# let's make sure that I've got numbers
first_number  = user_input1.to_f
second_number = user_input2.to_f

# a non-0 number means successful cast; a 0 number requires an additional check
validate_first  =  first_number != 0 || ['0', '0.0'].include?(user_input1.squeeze)
validate_second = second_number != 0 || ['0', '0.0'].include?(user_input2.squeeze)

if !(validate_first && validate_second)
  puts "Hey hey hey, wait a minute. '#{ user_input1 }' & '#{user_input2}' are supposed to be numbers! :("
  exit
end

# ask the user for an operation
puts "And what, exactly, shall I do with #{first_number} & #{second_number}?"
desired_operation = gets.chomp

# try to match up the user's desired operation with an
# operation that I know how to do by operators' array of aliases
# and trying to match one to the operation
found_operator = nil
operations.each do |operation, aliases|
  if aliases.include?(desired_operation)
    found_operator = operation
  end
end

if found_operator
  result = first_number.send(found_operator, second_number)
  puts "Psh. I got this: #{ first_number } #{ found_operator } #{ second_number } = #{ result }"
else
  puts " :( I don't know what you want from me. '#{ desired_operation }' isn't something I understand."
end
