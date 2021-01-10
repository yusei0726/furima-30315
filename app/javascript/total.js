window.addEventListener('load', () => {
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener('keyup', () => {
    const totalPrice = Math.round(itemPrice.value - (itemPrice.value / 10));
    const profit = document.getElementById('profit'); 
    profit.innerHTML = `${totalPrice}`;
  });
});