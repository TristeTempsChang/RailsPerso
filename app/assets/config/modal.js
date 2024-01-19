document.addEventListener('DOMContentLoaded', () => {
  const modal = document.getElementById("myModal");
  const openModalButton = document.getElementById("openModal");
  const closeModalButton = document.getElementById("closeModal");
  const checkboxes = document.querySelectorAll('.product-checkbox');
  const modalDel = document.getElementById("modalDelete");
  const openModalButtonDel = document.getElementById("openModalDel");
  const closeModalButtonDel = document.getElementById("closeModalDel");
  const modalUpdate = document.getElementById("updateModal");
  const openModalButtonUpdate = document.getElementById("openModalUpdate");
  const closeModalButtonUpdate = document.getElementById("closeModalUpdate");
  let selectedProductId;

  openModalButtonDel.disabled = true
  openModalButtonUpdate.disabled = true

  checkboxes.forEach(chk => {
    chk.addEventListener('change', () => {
      if (chk.checked) {
        selectedProductId = chk.value;
        openModalButtonUpdate.addEventListener("click", () => {
          modalUpdate.classList.remove("hidden");
          document.getElementById("product-id-input").value = selectedProductId;
        });
        checkboxes.forEach(otherChk => {
          if (otherChk !== chk) otherChk.checked = false;
        });
        openModalButtonDel.disabled = false;
        openModalButtonUpdate.disabled = false;
        openModalButtonDel.classList.replace('bg-red-200', 'bg-red-500');
        openModalButtonDel.classList.replace('text-slate-100', 'text-white');
        openModalButtonUpdate.classList.replace('bg-slate-300', 'bg-black');
        openModalButtonUpdate.classList.replace('text-slate-100', 'text-white');
      } else {
        openModalButtonDel.disabled = true;
        openModalButtonUpdate.disabled = true;
        openModalButtonDel.classList.replace('bg-red-500', 'bg-red-200');
        openModalButtonDel.classList.replace('text-white', 'text-slate-100');
        openModalButtonUpdate.classList.replace('bg-black', 'bg-slate-300');
        openModalButtonUpdate.classList.replace('text-white', 'text-slate-100');
      }
    });
  });

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

  openModalButtonDel.addEventListener("click", () => {
    modalDel.classList.remove("hidden");
  });

  closeModalButtonDel.addEventListener("click", () => {
    modalDel.classList.add("hidden");
  });

  window.addEventListener("click", (event) => {
    if (event.target == modal) {
      modalDel.classList.add("hidden");
    }
  });

  closeModalButtonUpdate.addEventListener("click", () => {
    modalUpdate.classList.add("hidden");
  });

  window.addEventListener("click", (event) => {
    if (event.target == modal) {
      modalUpdate.classList.add("hidden");
    }
  });

  const deleteSubmitButton = document.getElementById("delete-submit");
  deleteSubmitButton.addEventListener("click", () => {
    document.getElementById("delete-form").submit();
  });

  const originalProductRows = Array.from(document.querySelectorAll(".product-row"));

  const searchInput = document.getElementById("searchInput");

  searchInput.addEventListener("input", function () {
    const searchValue = searchInput.value.trim().toLowerCase();
    const productRows = document.querySelectorAll(".product-row");

    productRows.forEach(function (row) {
      const productName = row.querySelector(".font-medium").textContent.toLowerCase();

      if (productName.includes(searchValue)) {
        row.style.display = "whitespace-nowrap";
      } else {
        row.style.display = "none";
      }
    });
    if (searchValue === '') {
      originalProductRows.forEach(function (row) {
        row.style.display = ""; 
      });
    }
  });
});