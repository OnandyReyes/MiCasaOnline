class Property < ActiveRecord::Base
  belongs_to :agent
  belongs_to :property_type
  belongs_to :property_category
  belongs_to :city

  has_many :property_photos

  mount_uploader :photo, PhotoUploader

  scope :with_category, -> (pc) {
    where(property_category_id: pc)
  }
  scope :with_type, -> (pt) {
    where(property_type_id: pt)
  }
  scope :with_price, -> (v) {
    where('price BETWEEN ? AND ?', v.split('/')[0], v.split('/')[1])
  }
  scope :with_city, -> (c) {
    where(city_id: c)
  }

end
