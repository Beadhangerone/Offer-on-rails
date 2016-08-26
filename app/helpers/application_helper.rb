module ApplicationHelper
  def username
    $client ? $client.username : 'Аноним' 
  end
end
