//validaInscripcion.js

$(document).ready(function () {
    $(".ui.form").form({
        on: "blur", // Valida al salir de cada campo
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
            nombre: {
                identifier: "nombre",
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
            apellido_paterno: {
                identifier: "apellido_paterno",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese el apellido paterno",
                    },
                ],
            },
            apellido_materno: {
                identifier: "apellido_materno",
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
            telefono: {
                identifier: "telefono",
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
            correo: {
                identifier: "correo",
                rules: [
                    {
                        type: "email",
                        prompt: "Ingrese un correo electrónico válido",
                    },
                ],
            },
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
            es_tutor: {
                identifier: "es_tutor",
                rules: [
                    {
                        type: "checked",
                        prompt: "Debes seleccionar al menos un tutor.",
                    },
                ],
            },
        },
    });
});
