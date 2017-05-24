class StaticPage < ApplicationRecord

  scope :footer, -> {where(placement: 'footer')}
end
