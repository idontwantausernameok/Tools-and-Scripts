// ==UserScript==
// @name         AllKeyShop Steam Gift Card Compare USD
// @namespace    http://sas41.com/
// @version      2025-04-05
// @description  Compare all USD Gift Card deals and score them
// @author       SAS41
// @match        https://www.allkeyshop.com/blog/*/buy-steam-gift-card-cd-key-compare-prices/
// @match        https://www.allkeyshop.com/blog/buy-steam-gift-card-cd-key-compare-prices/
// @icon         https://www.google.com/s2/favicons?sz=64&domain=allkeyshop.com
// @grant        none
// ==/UserScript==

function waitFor(timeInMilliseconds) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve();
    }, timeInMilliseconds);
  });
}

function containsAllWords(element, wordsArray) {
  const elementText = element.textContent || element.innerText;
  return wordsArray.every(word => elementText.includes(word));
}

async function clickElementById(id) {
  // Get all elements with the specified class name
  const element = document.querySelector(`#${id}`);
  element.click();
}

async function clickElementByClassAndText(className, words) {
  // Get all elements with the specified class name
  const elements = document.querySelectorAll(`.${className}`);

  // Loop through each element
  for (const element of elements) {
    // Check if the element's text content contains the specified string
    if (containsAllWords(element, words)) {
      element.click();
      await waitFor(10);
    }
  }
}

async function calculateOptimalOffer() {
  // Get all elements with the specified class name
  const table = document.querySelector("#offers_table");
  const rows = table.querySelectorAll(`.offers-table-row`);
  let rowValues = new Array();
  let api = await fetch("https://currency-rate-exchange-api.onrender.com/eur");
  let currency = await api.json();
  let ratio = currency.rates.eur.usd;
  for (const row of rows) {
      var valueContainer = row.querySelector('.buy-btn');
      valueContainer.style.fontSize = '1.1rem';
      valueContainer.style.lineHeight = '1.5rem';
      valueContainer.style.width = '100%';
      valueContainer.style.cssText += 'text-align:left !important;';

      var pricebox = row.querySelector('.x-offer-edition');
      var valuebox = row.querySelector('.x-offer-buy-btn-in-stock');
      var value = parseFloat(pricebox.textContent.replace(/[^0-9.]/g, ''));
      var price = parseFloat(valuebox.textContent.replace(/[^0-9.]/g, ''));


      if (valuebox.textContent.includes('$'))
      {
          if (price-value <= 0)
          {
              valueContainer.style.background = "#007D00";
          }
          else
          {
              valueContainer.style.background = "#7D0000";
          }
          valuebox.innerHTML += `<br>${(price-value).toFixed(2)} (${(((price/value)-1)*100).toFixed(0)}%)`;
          rowValues.push({'key': row, 'value': (((price/value)-1)*100)});
      }
      if (valuebox.textContent.includes('€'))
      {
          let oldPrice = price;
          price = price * ratio;
          if (price-value <= 0)
          {
              valueContainer.style.background = "#007D00";
          }
          else
          {
              valueContainer.style.background = "#7D0000";
          }
          valuebox.innerHTML = `${(oldPrice).toFixed(2)}€=($${(price).toFixed(2)})<br>${(price-value).toFixed(2)} (${(((price/value)-1)*100).toFixed(0)}%)`;
          rowValues.push({'key': row, 'value': (((price/value)-1)*100)});
      }
      else
      {
          valueContainer.style.background = "#7D0000";
          valuebox.innerHTML += "<br>UNKNOWN CURRENCY!";
      }
  }

  var sortedRows = rowValues.sort((rowA, rowB) => {return rowA.value - rowB.value;});
  table.innerHTML = '';
  sortedRows.forEach(row => table.appendChild(row.key));
}

(async function() {
    'use strict';
    await waitFor(100);
    await clickElementByClassAndText('selectr-placeholder', ['Editions']);
    await waitFor(100);
    await clickElementByClassAndText('selectr-option', ['USA', 'USD']);
    await waitFor(100);
    await clickElementByClassAndText('selectr-option', ['TRY', 'USD']);
    await waitFor(100);
    await clickElementByClassAndText('selectr-placeholder', ['Editions']);
    await waitFor(100);
    await clickElementById('paypal-fees');
    await waitFor(100);
    await clickElementById('reveal_all_offers');
    await waitFor(200);
    await calculateOptimalOffer();
})();