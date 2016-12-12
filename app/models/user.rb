class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :books ,dependent: :destroy
  attr_accessor :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #:authentication_keys[:login]
  has_attached_file :avatar,
                  styles: { thumb: ["64x64#", :jpg] }

  validates_attachment :avatar,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates_uniqueness_of :username


end
