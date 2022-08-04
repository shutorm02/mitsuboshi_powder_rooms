let map

let timer = setInterval(() => {
  if (window.google) {
    clearInterval(timer)
    const defaultsLocation = new window.google.maps.LatLng(
      35.6803997,
      139.7690174
    )
    map = new window.google.maps.Map(document.getElementById('map'), {
      center: defaultsLocation,
      zoom: 14,
    })
    new window.google.maps.Marker({
      position: defaultsLocation,
      map,
    })
  }
}, 500)
