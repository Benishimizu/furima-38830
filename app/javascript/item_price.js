window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

  })

  // const priceContent = document.getElementById("add-tax-price");
  // console.log(priceContent);

  // const priceContents = document.getElementById("profit");
  // console.log(priceContent);





});


