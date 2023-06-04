module Api # same name as folder in services
  module Users # same name as file in folder above
    def self.new_user(params)
      user = User.new(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], password: params[:password])

      begin
        # is the user valid when trying to save it
        user.save!
      rescue
        # return a false unless the user is valid
        return ServiceContract.error("Error saving message") unless user.valid?
      end

      # if the user was successful, return a sucess and payload
      ServiceContract.success(user)
    end

    def self.update_user(params)
      user = User.find(params[:id])
      return ServiceContract.success(user) if user.update(email: params[:email], first_name: params[:first_name], last_name: params[:last_name])

      ServiceContract.error(user.errors.full_messages)
    end
  end
end
