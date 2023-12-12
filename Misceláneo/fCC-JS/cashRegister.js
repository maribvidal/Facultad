function getValue(monetaryUnit, quantity) {
  let multiplier = 0;

  switch (monetaryUnit) {
    case "PENNY":
      multiplier = 0.01;
      break;
    case "NICKEL":
      multiplier = 0.05;
      break;
    case "DIME":
      multiplier = 0.1;
      break;
    case "QUARTER":
      multiplier = 0.25;
      break;
    case "ONE":
      multiplier = 1;
      break
    case "FIVE":
      multiplier = 5;
      break;
    case "TEN":
      multiplier = 10;
      break;
    case "TWENTY":
      multiplier = 20;
      break;
    default:
      multiplier = 100;
      break;
  }

  return (quantity * multiplier);
}

function sortCid (cid) {
  let tempVar;

  cid.sort(function (a, b) {
  if (getValue(a[0], a[1]) > getValue(b[0], b[1])) {
    return -1;
  }
  if (getValue(a[0], a[1]) < getValue(b[0], b[1])) {
    return 1;
  }
  // a must be equal to b
  return 0;
});

  //console.log(cid);
  return cid;
}

function checkCashRegister(price, cash, cid) {
  let obj = {};
  let dineroEfectivo = 0;
  obj.status = "";
  obj.change = [];
  console.log(obj);

  //Obtener dinero en efectivo
  for (let i = 0; i < cid.length; i++) {
    //Acceder a cada objeto

  }


  return obj;
}

checkCashRegister(19.5, 20, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]]);
console.log(sortCid([["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]]));
