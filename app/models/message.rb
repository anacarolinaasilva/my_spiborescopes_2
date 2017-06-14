class Message
  include ActiveModel::Model
  # module ActiveModel
  #   module Model
  #     def initialize(params={})
  #       params.each do |attr, value|
  #         self.public_send(\"\#{attr}=\", value)
  #       end if params
  #     end
  #   end
  # end
  attr_accessor :name, :email, :phone, :company, :body
  validates :name, :email, :phone, :company, :body, presence: true
end
