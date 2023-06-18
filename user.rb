require "./person.rb"
require "./contactable.rb"
class User < Person
    extend Contactable
    attr_accessor :email , :mobile
    @email
    @mobile
    def initialize(name,email,mobile)
        super(name)
        @email=email
        @mobile=mobile
    end
    #save user in file
    def create
        if File.read('user.txt').include?(mobile)
            puts "mobile phone is already existed"
        else
            File.open('user.txt','a') do |f|
                f.puts "#{name}: #{email} | #{mobile}"
            end
        end
    end
    # valid email
    def self.valid_email(email)
        if email.match(/^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$/)
            return true
        else
            return false
        end
    end
    #valid phone
    def self.valid_mobile(mobile)
        if mobile.match(/^0[0-9]{10}$/)
            return true
        else
            return false
        end
    end
    def self.list(*args)
        case args.count
        when 0
            raise "enter valid number"
        when 1
            if args[0]== "*"
                contact_details("*")
            else
                contact_details(args[0])
            end
        else
            raise "wrong number of arguments"
        end
    end

end
