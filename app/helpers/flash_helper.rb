module FlashHelper

  def flash_class(message_type)
    case message_type
      when 'success' then 'text-green-700 bg-green-100 rounded-lg p-4 mb-4'
      when 'info' then 'text-blue-700 bg-blue-100 rounded-lg p-4 mb-4'
      when 'warning' then 'text-yellow-700 bg-yellow-100 rounded-lg p-4 mb-4'
      when 'danger' then 'text-red-700 bg-red-100 rounded-lg p-4 mb-4'
    end
  end
end
