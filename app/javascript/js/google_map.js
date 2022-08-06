require('dotenv').config()

const googleMapsApi = process.env.GOOGLE_MAPS_API_KEY
const script = document.createElement('script')
script.src = `https://maps.googleapis.com/maps/api/js?key=${googleMapsApi}&callback=initMap`
script.async = true
document.head.appendChild(script)

import iconCurrentLocation from '../images/icons/current_location.svg'

let map
const marker = []
const infoWindow = []
let spotLatLng
const spotData = gon.spots

window.initMap = () => {
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

    markerEvent(i)
  }

  new window.google.maps.Marker({
    position: defaultsLocation,
    map,
    icon: {
      url: `${iconCurrentLocation}`,
      scaledSize: new window.google.maps.Size(30, 46),
    },
    animation: window.google.maps.Animation.BOUNCE,
  })
}

function markerEvent(i) {
  marker[i].addListener('click', function () {
    infoWindow[i].open(map, marker[i])
  })
}
