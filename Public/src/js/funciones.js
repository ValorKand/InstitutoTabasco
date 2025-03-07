$(document).ready(function () {
    //menú dropdown
    $(".ui.dropdown").dropdown();
    //acordeones
    $(".ui.accordion").accordion();
    // popups
    $(".ver.mas").popup();
    $(".ui.sticky").sticky({
        context: "#submenusticky",
        pushing: true,
    });

    $("#bitacora").click(function () {
        $("#modalTextarea").val($(this).val()); // Pasar el texto al modal
        $("#textModal").modal("show");
    });

    $("#guardar").click(function () {
        let nuevoTexto = $("#modalTextarea").val().trim();
        $("#bitacora").val(nuevoTexto); // Asegurarse de que el valor se guarde
        $("#textModal").modal("hide");
    });

    $("#cancelar").click(function () {
        $("#textModal").modal("hide");
    });
});

//función para mostrar el formulario de nueva orden de servicio
document.addEventListener("DOMContentLoaded", () => {
    const botonNuevaOrden = document.getElementById("nuevaOrden");
    const formulario = document.getElementById("formularioOrdenes");

    botonNuevaOrden.addEventListener("click", () => {
        if (formulario.classList.contains("oculto")) {
            formulario.classList.remove("oculto"); // Muestra el formulario
        } else {
            formulario.classList.add("oculto"); // Oculta el formulario
        }
    });
});

const menuButton = document.getElementById("menu-button");
const mobileMenu = document.getElementById("mobile-menu");
const closeMenu = document.getElementById("close-menu");

menuButton.addEventListener("click", () => {
    mobileMenu.classList.add("show");
});

closeMenu.addEventListener("click", () => {
    mobileMenu.classList.remove("show");
});
