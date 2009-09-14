require File.join(File.dirname(__FILE__), "/generated_model/App" )

module App
  class Member

    def password=(pass)
      self.md5_password = Member.encrypt(pass+self.pid)
    end

    def admin?
      #self.permission_level == -1 || self.id == 1
      true
    end


    def self.authenticate(email, pass)
      current_user = Member.find_by_email(email)
      return nil if current_user.nil?
      return current_user if Member.encrypt(pass+email) == current_user.md5_password
      nil
    end

    def self.find_by_email(email)
      Xampl.transaction($transaction_context) do
        Member[email]
      end
    end

    protected
    def self.encrypt(pass)
      Digest::SHA1.hexdigest(pass)
    end

    def self.random_string(len)
      #generate a random password consisting of strings and digits
      chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
      newpass = ""
      1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
      return newpass
    end
  end
end
