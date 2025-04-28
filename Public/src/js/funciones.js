$(document).ready(function () {
    // menús dropdown
    $(".ui.dropdown").dropdown();
    // acordeones
    $(".ui.accordion").accordion();
    // popups
    $(".ver.mas").popup();
    $(".ui.sticky").sticky({
        context: "#submenusticky",
        pushing: true,
    });
    // checkbox
    $(".ui.checkbox").checkbox();

    // Definir las opciones para cada sección
    const secciones = {
        preescolar: ["1ro", "2do", "3ro"],
        primaria: ["1ro", "2do", "3ro", "4to", "5to", "6to"],
        secundaria: ["1ro", "2do", "3ro"],
        bachillerato: ["1ro", "2do", "3ro", "4to", "5to", "6to"],
    };

    // Escuchar cambios en el primer select
    $(document).ready(function () {
        // Definir las opciones para cada sección
        const secciones = {
            preescolar: ["1ro", "2do", "3ro"],
            primaria: ["1ro", "2do", "3ro", "4to", "5to", "6to"],
            secundaria: ["1ro", "2do", "3ro"],
            bachillerato: ["1ro", "2do", "3ro", "4to", "5to", "6to"],
        };

        // Obtener los select con jQuery
        const $seccionSelect = $("#seccion");
        const $gradoSelect = $("#año_cursara");

        // Escuchar cambios en el primer select
        $seccionSelect.on("change", function () {
            let seccionSeleccionada = $(this).val();

            // Limpiar las opciones anteriores del segundo select
            $gradoSelect
                .empty()
                .append('<option value="nulo">Selecciona un grado</option>');

            if (secciones[seccionSeleccionada]) {
                $gradoSelect.prop("disabled", false); // Habilita el select

                // Agregar las nuevas opciones
                secciones[seccionSeleccionada].forEach((grado) => {
                    $gradoSelect.append(new Option(grado, grado.toLowerCase()));
                });
            } else {
                $gradoSelect.prop("disabled", true); // Deshabilita el select
            }
        });
    });

    /*    $.fn.form.settings.rules.tutorRequerido = function () {
        return (
            $("#madre_es_tutor").is(":checked") ||
            $("#padre_es_tutor").is(":checked")
        );
    };

    $.fn.form.settings.rules.pagadorRequerido = function () {
        return (
            $("#madre_pagador").is(":checked") ||
            $("#padre_pagador").is(":checked")
        );
    };
    */
});
