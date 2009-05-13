class Fish < ActiveRecord::Base
  
  has_attached_file :image, :styles => { :thumb=> "150x81>", :small => "350x190>" },
                    :whiny_thumbnails => true,
                    :url => "/images/fish/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/fish/:id/:style/:basename.:extension"
                    
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg','image/pjpeg', 'image/png', 'image/x-png']
  
  validates_presence_of :genus_name, :species_name, :common_name
  
  def scientific_name
    [genus_name, species_name].join(' ')
  end
end
