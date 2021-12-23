class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    #accepts an item_name (string) and returns true if any of the freebies associated with the dev has that item_name, otherwise returns false
    
    #one way to write this method
    self.freebies.find_by(item_name: item_name)

    #another way
    # self.freebies.any? do |freebie|
    #   freebie.item_name == item_name
    # end
  end

  def give_away(dev, freebie)
    #accepts a Dev instance and a Freebie instance, changes the freebie's dev to be the given dev; your code should only make the change if the freebie belongs to the dev who's giving it away

    #Ruby shorthand way
    # freebie.update(dev: dev) unless freebie.dev != self

    #if/else logic way
    if self == freebie.dev
      freebie.dev = dev
      freebie.save
    else
      "#{freebie.item_name} is not yours to give!"
    end
  end

end
