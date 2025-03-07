//tablaServicios.js

$(document).ready(function () {
    // Referencias a la tabla y botones
    const cuerpoTabla = document.querySelector("#tabla_servicios tbody");
    const botonAgregarFila = document.querySelector("#nueva_fila");

    // Función para añadir una nueva fila
    botonAgregarFila.addEventListener("click", () => {
        const nuevaFila = document.createElement("tr");
        nuevaFila.innerHTML = `
                <td><input type="number" name="cantidad[]" min="1" required></td>
                <td><input type="text" name="descripcion[]" required></td>
                <td><input type="number" name="precioUnitario[]" step="0.01" min="0" required></td>
                <td><input type="number" name="total[]" step="0.01" min="0" required readonly></td>
                <td><button type="button" class="ui circular icon button red quitar_fila"><span class="material-symbols-outlined">delete</span></button></td>
            `;
        cuerpoTabla.appendChild(nuevaFila);
    });

    // Delegación de eventos para eliminar filas (detecta cualquier botón dentro de la tabla)
    cuerpoTabla.addEventListener("click", (e) => {
        if (e.target.closest(".quitar_fila")) {
            e.target.closest("tr").remove();
        }
    });

    // Opcional: Calcular el total automáticamente
    cuerpoTabla.addEventListener("input", (e) => {
        if (
            e.target.name === "precioUnitario[]" ||
            e.target.name === "cantidad[]"
        ) {
            const fila = e.target.closest("tr");
            const cantidad =
                row.querySelector('input[name="cantidad[]"]').value || 0;
            const precioUnitario =
                row.querySelector('input[name="precioUnitario[]"]').value || 0;
            row.querySelector('input[name="total[]"]').value = (
                cantidad * precioUnitario
            ).toFixed(2);
        }
    });
});
