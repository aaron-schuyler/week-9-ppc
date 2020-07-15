class Party < ApplicationRecord
  has_many :parties_supplies
  has_many :supplies, through: :parties_supplies
  belongs_to :category, dependent: :destroy, optional: true

  accepts_nested_attributes_for :supplies

    def private?
        self.private ? 'Private' : 'Public'
    end

    def supplies_attributes=(supplies)

      supplies.values.each do |supply|
        if supply[:name].present?
          new_supply = Supply.find_or_create_by(name: supply[:name])
          if supply[:quantity].present?
            new_supply.quantity = supply[:quantity].to_i
          else
            new_supply.quantity = 1
          end
          new_supply.save
          self.supplies << new_supply
        end
      end
    end

end
