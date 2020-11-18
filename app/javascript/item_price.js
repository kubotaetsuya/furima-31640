window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const consumptionTax = 10;
    let tax = inputValue * consumptionTax / 100;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(tax);
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - (inputValue * consumptionTax / 100));
  });
});