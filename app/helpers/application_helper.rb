module ApplicationHelper
  def username
    $client ? $client.username : 'Аноним' 
  end

  def categs
    Category.all
  end
end
