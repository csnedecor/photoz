class Photo < ActiveRecord::Base
  belongs_to :album
  belongs_to :user

  has_attached_file :photo,
                    styles: {
                      large: "910*650>",
                      medium: "700*500>",
                      thumb: "350*250"
                    },
                    default_url: "/images/:style/missing.png",
                    path: ":rails_root/public/storage/#{Rails.env}#{ENV['RAILS_TEST_NUMBER']}/attachments/:id/:style/:basename.:extension",
                    url: "/storage/#{Rails.env}#{ENV['RAILS_TEST_NUMBER']}/attachments/:id/:style/:basename.:extension",
                    processors: [:cropper]
  validates_attachment :photo,
                       content_type: {
                         content_type: /\Aimage\/.*\Z/,
                         message: "must be an image (only png, gif or jpg files)"
                       }

  after_validation :clean_paperclip_errors

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def reprocess_photo
    photo.reprocess!
  end

  private

  def clean_paperclip_errors
    errors.delete(:photo)
  end
end
