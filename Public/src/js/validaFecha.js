//validaFecha.js – Para validar la fecha
document
    .querySelector("form")
    .addEventListener("submit", async function (event) {
        event.preventDefault(); // Evita el submit tradicional

        const formData = new FormData(this);

        const jsonData = {};
        formData.forEach((value, key) => {
            jsonData[key] = value;
        });

        // Descomentar si es necesario
        /*await fetch("/registraInscripcion", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(jsonData),
        });*/
        const response = await fetch("/registraInscripcion", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(jsonData),
        });

        if (response.redirected) {
            window.location.href = response.url;
        }
    });
