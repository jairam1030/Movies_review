class Movie < ActiveRecord::Base
<<<<<<< HEAD
=======

>>>>>>> 458f5c3
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_many :reviews
<<<<<<< HEAD
  ratyrate_rateable "visual_effects", "original_score", "costume_design", "direction", "acting" 
=======
  ratyrate_rateable 'visual_effects', 'original_score', 'director', 'costume_design'
>>>>>>> 458f5c3
end
