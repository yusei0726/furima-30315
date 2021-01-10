window.addEventListener('load', () => {

  const itemPrice = document.getElementById("item-price");

    itemPrice.addEventListener("keyup", () => {
      const plusTax = Math.round(itemPrice.value / 10);
      const addTaxPrice = document.getElementById("add-tax-price");
      const profit = document.getElementById('profit'); 
      const totalPrice = Math.round(itemPrice.value - (itemPrice.value / 10));

      addTaxPrice.innerHTML = `${plusTax}`;
      profit.innerHTML = `${totalPrice}`;
    });
});
