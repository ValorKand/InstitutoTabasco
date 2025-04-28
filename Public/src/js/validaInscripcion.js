//validaInscripcion.js

$(document).ready(function () {
    $(".ui.form").form({
        on: "blur", // Valida al salir de cada campo
        // Datos del alumno
        fields: {
            ciclo_escolar: {
                identifier: "ciclo_escolar",
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
            alumno_nombre: {
                identifier: "alumno_nombre",
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
            alumno_apellido_paterno: {
                identifier: "alumno_apellido_paterno",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese el apellido paterno",
                    },
                ],
            },
            alumno_apellido_materno: {
                identifier: "alumno_apellido_materno",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese el apellido materno",
                    },
                ],
            },
            fecha_nacimiento: {
                identifier: "fecha_nacimiento",
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
            //Datos de la madre
            madre_nombre: {
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
            madre_apellido_paterno: {
                identifier: "madre_apellido_paterno",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese el apellido paterno de mamá",
                    },
                ],
            },
            madre_apellido_materno: {
                identifier: "madre_apellido_materno",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese el apellido materno de mamá",
                    },
                ],
            },
            madre_telefono: {
                identifier: "madre_telefono",
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
            madre_correo: {
                identifier: "madre_correo",
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
            //Datos del padre
            padre_nombre: {
                identifier: "padre_nombre",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese el nombre del padre",
                    },
                    {
                        type: "minLength[2]",
                        prompt: "El nombre de papá debe tener al menos 2 caracteres",
                    },
                ],
            },
            padre_apellido_paterno: {
                identifier: "padre_apellido_paterno",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese el apellido paterno de papá",
                    },
                ],
            },
            padre_apellido_materno: {
                identifier: "padre_apellido_materno",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese el apellido materno de papá",
                    },
                ],
            },
            padre_telefono: {
                identifier: "padre_telefono",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese el número de teléfono",
                    },
                    {
                        type: "regExp",
                        value: /^[0-9]{10}$/,
                        prompt: "El número de teléfono debe tener 10 dígitos",
                    },
                ],
            },
            padre_correo: {
                identifier: "padre_correo",
                rules: [
                    {
                        type: "email",
                        prompt: "Ingrese un correo electrónico válido",
                    },
                ],
            },
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
