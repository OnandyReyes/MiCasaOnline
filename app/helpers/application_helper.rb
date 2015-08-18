module ApplicationHelper
  def set_cities
    City.all
  end

  def set_types
    PropertyType.all
  end

  def set_categories
    PropertyCategory.all
  end

  def set_agents
    Agent.all
  end

  def price_options
    [
       ["$0-$1000", '0/1000'],
    ["$1000-$2000", '1000/2000'],
    ["$2000-$3000", '2000/3000'],
    ["$3000-$6000", '3000/6000'],
    ["$6000-$12000", '6000/12000'],
    ]
  end
end
