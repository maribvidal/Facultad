//I hate this code

function decomposeNumber(num) {
  let newArr = [];
  let numLen = String(num).length;
  let firstNum = String(num)[0];
  console.log(firstNum);

  //DESCOMPONER NÚMERO
  if (firstNum == 9) {newArr.unshift("9")
  } else if (firstNum > 5) {
    while (firstNum > 5) {
      newArr.unshift("1");
      firstNum--;
    }
    newArr.unshift("5");
  } else if (firstNum == 5) {newArr.unshift("5")}
    else if (firstNum == 4) {newArr.unshift("4")}
  //Solo queda el caso en el que num >= 1
  else {
    while (firstNum >= 1) {
      newArr.unshift("1");
      firstNum--;
    }
  }

  //PONER LOS CEROS QUE CORRESPONDEN
  if (numLen > 1) {
    for (let i = 0; i < newArr.length; i++) {
      for (let j = 1; j < numLen; j++) {
        newArr[i] += "0"; 
      }
    }
  }
  return newArr;
}

function getNumber(num) {
  let numLen = String(num).length;
  let retArr = [...String(num)];

  //Primer paso (por unidad)
  if (numLen > 1) {
    //Tenemos decenas, centenas...
    for (let i = (numLen - 1); i >= 0; i--) {
      for (let j = 0; j < i; j++) {
        retArr[(numLen - 1) - i] += "0";
      }
    }
  }

  //Segundo paso (tratar cada elemento del array)
  for (let i = 0; i < numLen; i++) {
    retArr[i] = decomposeNumber(retArr[i]);
  }
  return retArr;
}

function convertNumToSym(num) {
  let sym;

  switch (num) {
    case 1:
      sym = "I";
      break;
    case 4:
      sym = "IV";
      break;
    case 5:
      sym = "V";
      break;
    case 9:
      sym = "IX";
      break;
    case 10:
      sym = "X";
      break;
    case 40:
      sym = "XL";
      break;
    case 50:
      sym = "L";
      break;
    case 90:
      sym = "XC";
      break;
    case 100:
      sym = "C";
      break;
    case 400:
      sym = "CD";
      break;
    case 500:
      sym = "D";
      break;
    case 900:
      sym = "CM";
      break;
    case 1000:
      sym = "M";
      break;
  }

  return sym;
}

function convertToRoman(num) {
  let getNum = getNumber(num);
  let romanNum = "";
  console.log(getNum);

  for (let i = 0; i < getNum.length; i++) {
    //Meterse en cada array
    for (let j = 0; j < getNum[i].length; j++) {
      romanNum += convertNumToSym(Number(getNum[i][j]));
    }
  }

  console.log(romanNum);
  return romanNum;
}
