module ApplicationHelper
  def username
    $client ? $client.username : 'Аноним' 
  end

  def categs
    Category.all
  end

  def client_phone
   $client.phone != nil ? $client.phone : "Не указано"
  end
end
