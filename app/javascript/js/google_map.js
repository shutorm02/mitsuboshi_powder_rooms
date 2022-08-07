require('dotenv').config()

const googleMapsApi = process.env.GOOGLE_MAPS_API_KEY
const scriptMaps = document.createElement('script')

scriptMaps.src = `https://maps.googleapis.com/maps/api/js?key=${googleMapsApi}&callback=initMap`
scriptMaps.async = true
document.head.appendChild(scriptMaps)

let map
let spotLatLng
let geocoder
const marker = []
const infoWindow = []
const spotData = gon.spots

import iconCurrentLocation from '../images/icons/current_location.svg'

window.initMap = () => {
  geocoder = new window.google.maps.Geocoder()

  const defaultsLocation = new window.google.maps.LatLng(
    35.6803997,
    139.7690174
  )
  map = new window.google.maps.Map(document.getElementById('spotsMap'), {
    center: defaultsLocation,
    zoom: 14,
  })

  for (let i = 0; i < spotData.length; i++) {
    let id = spotData[i]['id']

    spotLatLng = new window.google.maps.LatLng({
      lat: spotData[i]['latitude'],
      lng: spotData[i]['longitude'],
    })

    marker[i] = new window.google.maps.Marker({
      position: spotLatLng,
      map: map,
    })

    infoWindow[i] = new window.google.maps.InfoWindow({
      content: `<a href='/spots/${id}'>${spotData[i]['name']}</a>`,
    })

    marker[i].addListener('click', function () {
      infoWindow[i].open(map, marker[i])
    })
  }

  setCurrentLocation(defaultsLocation)

  document.getElementById('search').addEventListener('click', function () {
    const inputKeyword = document.getElementById('keyword').value

    geocoder.geocode({ address: inputKeyword }, function (results, status) {
      if (status == 'OK') {
        map.setCenter(results[0].geometry.location)
        setCurrentLocation(results[0].geometry.location)
      } else {
        alert('該該する結結果ありませんでした:' + status)
      }
    })
  })
}

function setCurrentLocation(setPlace) {
  new window.google.maps.Marker({
    position: setPlace,
    map,
    icon: {
      url: `${iconCurrentLocation}`,
      scaledSize: new window.google.maps.Size(30, 46),
    },
    animation: window.google.maps.Animation.BOUNCE,
  })
}
