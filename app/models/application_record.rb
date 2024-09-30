class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  PRODUCT_TAX = 0.1
end
