require('dotenv').config()

const googleMapsApi = process.env.GOOGLE_MAPS_API_KEY
const script = document.createElement('script')
script.src = `https://maps.googleapis.com/maps/api/js?key=${googleMapsApi}&callback=initMap`
script.async = true
document.head.appendChild(script)

import iconCurrentLocation from '../images/icons/current_location.svg'

window.initMap = () => {
  const defaultsLocation = new window.google.maps.LatLng(
    35.6803997,
    139.7690174
  )
  const map = new window.google.maps.Map(document.getElementById('spotsMap'), {
    center: defaultsLocation,
    zoom: 14,
  })

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
