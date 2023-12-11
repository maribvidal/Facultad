function getCharRot(charCode) {
  let newCode;
  let charDistance;

  if ((charCode + 13) <= 90) {
    newCode = charCode + 13;
  } else {
    charDistance = 90 - charCode;
    newCode = 64 + (13 - charDistance);
  }

  return newCode;
}

function rot13(str) {
  let strArr = [...str];
  let alphabetRegex = /[A-Z]/;
  let curCode = "";
  let newStr = "";

  for (let i = 0; i < strArr.length; i++) {
    //Comprobar si el elemento actual es una letra
    if (alphabetRegex.test(strArr[i])) {
      curCode = str.charCodeAt(i);
      curCode = getCharRot(curCode);
      newStr += String.fromCharCode(curCode);
    } else {
      newStr += strArr[i];
    }
  }

  return newStr;
}

console.log(rot13("GUR DHVPX OEBJA SBK WHZCF BIRE GUR YNML QBT."));
