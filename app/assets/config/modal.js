document.addEventListener("DOMContentLoaded", () => {
  const modal = document.getElementById("myModal");
  const openModalButton = document.getElementById("openModal");
  const closeModalButton = document.getElementById("closeModal");

  openModalButton.addEventListener("click", () => {
    modal.classList.remove("hidden");
  });

  closeModalButton.addEventListener("click", () => {
    modal.classList.add("hidden");
  });

  window.addEventListener("click", (event) => {
    if (event.target == modal) {
      modal.classList.add("hidden");
    }
  });
});
