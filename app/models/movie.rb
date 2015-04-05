class Movie < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_many :reviews
  ratyrate_rateable "visual_effects", "original_score", "costume_design", "direction", "acting" 
  searchkick
end
