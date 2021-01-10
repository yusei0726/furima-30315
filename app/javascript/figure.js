window.addEventListener('load', () => {

  const itemPrice = document.getElementById("item-price");

    itemPrice.addEventListener("keyup", () => {
      const plusTax = Math.round(itemPrice.value / 10);
      const addTaxPrice = document.getElementById("add-tax-price");
      addTaxPrice.innerHTML = `${plusTax}`;
    });
});
