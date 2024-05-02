const price = () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = Math.floor(inputValue * 0.1);
    const addTaxDomElement = document.getElementById("add-tax-price");
    addTaxDomElement.textContent = addTaxDom;

    const profitDom = Math.floor(inputValue * 0.9);
    const profitDomElement = document.getElementById("profit");
    profitDomElement.textContent = profitDom;
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);