class Book < ApplicationRecord
	belongs_to :user
	has_attached_file :image,
                    styles: { large: ["612x792#", :jpg] }
	validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
    has_attached_file :document
    validates_attachment :document, :content_type => { :content_type => %w(application/pdf 
                        application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
    validates :user_id, presence: true
    validates :content, presence: true, length: { maximum: 140 }
    validates :title, presence: true
    validates :facility ,presence: true
    def self.search(search)
      if search
        where('title LIKE ?', "%#{search}%")
      else
        order('title asc')
      end
    end

end
