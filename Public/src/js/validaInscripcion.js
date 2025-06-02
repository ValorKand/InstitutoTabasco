//validaInscripcion.js

$(document).ready(function () {
    $(".ui.form").form({
        on: "blur", // Valida al salir de cada campo
        // Datos del alumno
        fields: {
            cicloEscolar: {
                identifier: "cicloEscolar",
                rules: [
                    {
                        type: "empty",
                        prompt: "Por favor, ingrese el ciclo escolar",
                    },
                    {
                        type: "regExp",
                        value: /^[0-9]{4}-[0-9]{4}$/,
                        prompt: "El ciclo escolar debe tener el formato 2024-2025",
                    },
                ],
            },
            seccion: {
                identifier: "seccion",
                rules: [
                    {
                        type: "empty",
                        prompt: "Seleccione una sección",
                    },
                ],
            },
            grado: {
                identifier: "grado",
                rules: [
                    {
                        type: "empty",
                        prompt: "Seleccione un grado",
                    },
                ],
            },
            alumnoNombre: {
                identifier: "alumnoNombre",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese el nombre",
                    },
                    {
                        type: "minLength[2]",
                        prompt: "El nombre debe tener al menos 2 caracteres",
                    },
                ],
            },
            alumnoApellidoPaterno: {
                identifier: "alumnoApellidoPaterno",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese el apellido paterno",
                    },
                ],
            },
            alumnoApellidoMaterno: {
                identifier: "alumnoApellidoMaterno",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese el apellido materno",
                    },
                ],
            },
            fechaNacimiento: {
                identifier: "fechaNacimiento",
                rules: [
                    {
                        type: "empty",
                        prompt: "Seleccione la fecha de nacimiento",
                    },
                ],
            },
            curp: {
                identifier: "curp",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese la curp",
                    },
                ],
            },
            //Datos de tutor
            tutorNombre: {
                identifier: "madre_nombre",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese el nombre",
                    },
                    {
                        type: "minLength[2]",
                        prompt: "El nombre de mamá debe tener al menos 2 caracteres",
                    },
                ],
            },
            tutorApellidoPaterno: {
                identifier: "tutorApellidoPaterno",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese el apellido paterno de mamá",
                    },
                ],
            },
            tutorApellidoMaterno: {
                identifier: "tutorApellidoMaterno",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese el apellido materno de mamá",
                    },
                ],
            },
            tutorTelefono: {
                identifier: "tutorTelefono",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese el número de teléfono de mamá",
                    },
                    {
                        type: "regExp",
                        value: /^[0-9]{10}$/,
                        prompt: "El número de teléfono debe tener 10 dígitos",
                    },
                ],
            },
            tutorCorreo: {
                identifier: "tutorCorreo",
                rules: [
                    {
                        type: "email",
                        prompt: "Ingrese un correo electrónico válido",
                    },
                ],
            },
            //Función parece no agarrar, vamos a ver que xuxa pasa
            /*madre_es_tutor: {
                identifier: "madre_es_tutor",
                rules: [
                    {
                        type: "checked",
                        prompt: "Al menos una persona debe ser tutor.",
                    },
                    {
                        type: "tutorRequerido",
                        prompt: "Al menos una persona debe ser tutor.",
                    },
                ],
            },
            madre_pagador: {
                identifier: "madre_pagador",
                rules: [
                    {
                        type: "checked",
                        prompt: "Al menos una persona debe ser pagador.",
                    },
                    {
                        type: "pagadorRequerido",
                        prompt: "Al menos una persona debe ser tutor.",
                    },
                ],
                },*/
            //Igual, otra funcion que parece que no quiere hacer su trabajo.
            /*
            padre_es_tutor: {
                identifier: "padre_es_tutor",
                rules: [
                    {
                        type: "checked",
                        prompt: "Al menos una persona debe ser tutor.",
                    },
                    {
                        type: "pagadorRequerido",
                        prompt: "Al menos una persona debe ser tutor.",
                    },
                ],
            },
            padre_pagador: {
                identifier: "padre_pagador",
                rules: [
                    {
                        type: "checked",
                        prompt: "Al menos una persona debe ser pagador.",
                    },
                    {
                        type: "pagadorRequerido",
                        prompt: "Al menos una persona debe ser tutor.",
                    },
                ],
            },
            */
            // Otros datosp3
            telefono_emergencia: {
                identifier: "telefono_emergencia",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese un número de emergencia",
                    },
                ],
            },
            domicilio: {
                identifier: "domicilio",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese su domicilio",
                    },
                ],
            },
        },
    });
});
