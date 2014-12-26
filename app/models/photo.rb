class Photo < ActiveRecord::Base
  belongs_to :album

  has_attached_file :photo,
                    :styles => {  :large => "640*480",  :medium => "300*300>",  :thumb => "100*100>" },
                    :default_url => "/images/:style/missing.png",
                    :path => ":rails_root/public/storage/#{Rails.env}#{ENV['RAILS_TEST_NUMBER']}/attachments/:id/:style/:basename.:extension",
                    :url => "/storage/#{Rails.env}#{ENV['RAILS_TEST_NUMBER']}/attachments/:id/:style/:basename.:extension"
  validates_attachment :photo,
                       :content_type => { :content_type => /\Aimage\/.*\Z/, :message => "must be an image (only png, gif or jpg files)" }

 after_validation :clean_paperclip_errors

 def clean_paperclip_errors
   errors.delete(:photo)
 end
end
