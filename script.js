const show = document.getElementById("show")
const hide = document.getElementById("hide")
const sideMenu = document.getElementById("side-menu")
// TODO: hiding the side-menu when clicking a button 

show.addEventListener("click", ()=> {
    sideMenu.style.display = "block"
})

hide.addEventListener("click", ()=> {
    sideMenu.style.display = "none"
})