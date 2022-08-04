window.onload = function () {
  btnMap = document.getElementById('btnMap')
  btnList = document.getElementById('btnList')

  btnMap.onclick = function () {
    btnMap.classList.toggle('hidden')
    btnList.classList.toggle('hidden')
  }

  btnList.onclick = function () {
    btnMap.classList.toggle('hidden')
    btnList.classList.toggle('hidden')
  }
}
