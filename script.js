const show = document.getElementById("show")
const hide = document.getElementById("hide")
const sideMenu = document.getElementById("side-menu")
const hideFeauture = document.querySelectorAll(".hide-f")

show.addEventListener("click", ()=> {
    sideMenu.style.display = "block"
})

hide.addEventListener("click", ()=> {
    sideMenu.style.display = "none"
})

for(const el of hideFeauture) {
    el.addEventListener("click", ()=> {
        sideMenu.style.display = "none"
    })
}