const btnMap = document.querySelector('#btnMap')
const btnList = document.querySelector('#btnList')
const spotsMap = document.querySelector('#spotsMap')
const spotsList = document.querySelector('#spotsList')

const switchMapView = function() {
  btnMap.classList.add('hidden')
  spotsMap.classList.remove('hidden')
  btnList.classList.remove('hidden')
  spotsList.classList.add('hidden')
  btnList.classList.remove('hidden')
}

const switchListView = function() {
  btnMap.classList.remove('hidden')
  spotsMap.classList.add('hidden')
  btnList.classList.add('hidden')
  spotsList.classList.remove('hidden')
}

window.addEventListener('DOMContentLoaded', function() {
  (location.hash == '' || location.hash == "#map") ? switchMapView() : switchListView();
})

window.addEventListener('hashchange', function() {
  (location.hash == '' || location.hash == "#map") ? switchMapView() : switchListView();
})
