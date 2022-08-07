window.onload = function () {
  const btnMap = document.getElementById('btnMap')
  const btnList = document.getElementById('btnList')
  const spotsMap = document.getElementById('spotsMap')
  const spotsList = document.getElementById('spotsList')

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
