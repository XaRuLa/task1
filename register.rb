require 'io/console'
require 'json'

#get username
print "Enter your name : "
name = gets

#Welcome user
puts "Hai " + name + "\nHow are you ?"
situasion = gets

#Store infomations into json file
puts "\nPlease enter creadential below : "

print "Your full name : "
$fullname = gets.chomp

print "Your phone number : "
$phoneno = gets.chomp

print "Your username : "
$username = gets.chomp

print "Your password : "
$password = STDIN.noecho(&:gets).chomp

#print user data
puts "\nThis is your creadential : "
puts "Fullname : " + $fullname
puts "Phone Number : " + $phoneno
puts "Username : " + $username

print "\nThis informations is correct ? (Y/N) : "
info = gets.chomp

#create json file
def funcjson
    sipedata = {
    "Full Name" => $fullname,
    "Phone no" => $phoneno,
    "Username" => $username,
    "Password" => $password
    }
    File.open("/home/typing/intern/firstday/file.json","w") do |f|
    f.write(JSON.pretty_generate(sipedata))
    end
end

#checking process
if info == "Y"
    puts funcjson
    print "Your informations successfully store\n"

elsif info == "N"
   print "Please restart the program\n"

else 
    print "Please enter Y for yes, and N to do it again.\n"
end