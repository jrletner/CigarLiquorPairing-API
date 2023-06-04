module Api # same name as folder in services
  module Auth # same name as file in folder above
    def self.login(email, password, ip)
      # will return nil if not found
      # will return false if the try method doesn't match password with email
      user = User.find_by(email: email).try(:authenticate, password)
      # if user not found
      return ServiceContract.error("User not found") if user.nil?
      # if incorrect password
      return ServiceContract.error("Incorrect password") unless user
      # if user found and password correct
      # generate token on user instance
      token = user.generate_token!(ip)
      # return the service contract
      ServiceContract.success({ user: user, token: token })
    end
  end
end
