module ServiceContract
  def self.success(payload)
    # use OpenStruct to allow for . notation
    OpenStruct.new({ success?: true, payload: payload, errors: nil })
  end

  def self.error(errors)
    # use OpenStruct to allow for . notation
    OpenStruct.new({ success?: false, errors: errors })
  end
end
