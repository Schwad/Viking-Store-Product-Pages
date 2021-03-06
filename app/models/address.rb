class Address < ActiveRecord::Base

  belongs_to :user
  belongs_to :state
  belongs_to :city
  has_many :orders, foreign_key: :shipping_id
  has_many :orders, foreign_key: :billing_id
  has_one :shipping_user, :class_name => "User", foreign_key: :shipping_id
  has_one :billing_user, :class_name => "User", foreign_key: :billing_id

  def complete_address
    return "#{street_address}, #{city.name}, #{state.name} #{zip_code}"
  end

end
