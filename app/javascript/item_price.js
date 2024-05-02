window.addEventListener('turbo:load', () => {

  const priceInput = document.getElementById("item-price");

  calculate();

  priceInput.addEventListener("input", calculate);

  function calculate() {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = Math.floor(inputValue * 0.9);
  }
});