function priceCalc () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const price = itemPrice.value;
    const tax = (price * 0.1);
    const profitCalc = (price - tax);
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = `${Math.floor(tax).toLocaleString()}`;
    profit.innerHTML = `${Math.floor(profitCalc).toLocaleString()}`;

  });
}

window.addEventListener("load", priceCalc);