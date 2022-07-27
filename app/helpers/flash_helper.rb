module FlashHelper
  FLASH = {
    'success' => 'text-green-700 bg-green-100 rounded-lg p-4 mb-4',
    'info' => 'text-blue-700 bg-blue-100 rounded-lg p-4 mb-4',
    'warning' => 'text-yellow-700 bg-yellow-100 rounded-lg p-4 mb-4',
    'danger' => 'text-red-700 bg-red-100 rounded-lg p-4 mb-4',
  }.freeze

  def flash_class(type)
    FLASH[type]
  end
end
