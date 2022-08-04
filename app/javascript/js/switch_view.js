window.onload = function () {
  btnMap = document.getElementById('btnMap')
  btnList = document.getElementById('btnList')
  spotsMap = document.getElementById('spotsMap')
  spotsList = document.getElementById('spotsList')

  btnMap.onclick = function () {
    btnMap.classList.toggle('hidden')
    btnList.classList.toggle('hidden')
    spotsMap.classList.toggle('hidden')
    spotsList.classList.toggle('hidden')
  }

  btnList.onclick = function () {
    btnMap.classList.toggle('hidden')
    btnList.classList.toggle('hidden')
    spotsMap.classList.toggle('hidden')
    spotsList.classList.toggle('hidden')
  }
}
