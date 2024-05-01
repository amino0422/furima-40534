window.addEventListener('DOMContentLoaded', () => {

  const button = document.getElementById("button");
  button.addEventListener('click', () => {
    console.log("イベント発火");
  });
});