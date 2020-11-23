# frozen_string_literal: true
class User < ActiveRecord::Base
  extend Devise::Models #added this line to extend devise model
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthabledevise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
end