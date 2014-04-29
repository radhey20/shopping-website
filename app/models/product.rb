class Product < ActiveRecord::Base
has_many :line_items
before_destroy :ensure_not_referenced_by_any_line_item
scope :unreleased, where(:released_at => nil)


attr_accessible :title
attr_accessible :price
attr_accessible :category
attr_accessible :avaliable_on
attr_accessible :photo
attr_accessible :description, :size, :colour, :quantity
has_attached_file :photo, :styles => { :medium => "280x280>", :thumb => "160x200>" }

  # Validations
  validates_presence_of :title
  validates_presence_of :price

private

def ensure_not_referenced_by_any_line_item
	if line_items.empty?
	return true
		else
		errors.add(:base, 'Line Items present')
		return false
	end
end


end
