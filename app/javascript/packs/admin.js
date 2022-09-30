import Rails from '@rails/ujs'
import 'channels'
require('stylesheets/admin.css')
import '@fortawesome/fontawesome-free/js/all'
window.$ = window.jQuery = require('jquery')

const images = require.context('../images/', true)
const imagePath = (name) => images(name, true)

Rails.start()
