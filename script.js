const show = document.getElementById("show")
const hide = document.getElementById("hide")
const sideMenu = document.getElementById("side-menu")

show.addEventListener("click", ()=> {
    sideMenu.style.display = "block"
})

hide.addEventListener("click", ()=> {
    sideMenu.style.display = "none"
})