//validaFecha.js
document
    .querySelector("form")
    .addEventListener("submit", async function (event) {
        event.preventDefault(); // Evita el submit tradicional

        const formData = new FormData(this);

        const jsonData = {};
        formData.forEach((value, key) => {
            jsonData[key] = value;
        });

        await fetch("/registraInscripcion", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(jsonData),
        });
    });
