class Freebie < ActiveRecord::Base
  belongs_to :dev
  belongs_to :company

  def print_details
    #should return a string formatted as follows: {insert dev's name} owns a {insert freebie's item_name} from {insert company's name}
    "#{dev.name} owns a #{item_name} from #{company.name}"
  end

end
