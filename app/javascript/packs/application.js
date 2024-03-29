// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
import 'stylesheets/tailwind.css'
require('stylesheets/main.css')
import '@fortawesome/fontawesome-free/js/all'
require('js/jquery_raty.js')
require('js/profile_tabs.js')
require('js/preview.js')

window.$ = window.jQuery = require('jquery')
const images = require.context('../images/', true)
const imagePath = (name) => images(name, true)

Rails.start()
ActiveStorage.start()
