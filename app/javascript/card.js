const pay = () => {
  const publicKey = gon.public_key
  const payjp = Payjp(publicKey)
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');
  const form = document.getElementById('charge-form')
  if (form !== null) {
    form.addEventListener("submit", (e) => {
      payjp.createToken(numberElement).then(function (response) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        document.getElementById("charge-form").submit();
        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear();
      });
      e.preventDefault();
    });
  };
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);