class Link < ActiveRecord::Base
  belongs_to :tenant
  validates_presence_of :title, :url
end
