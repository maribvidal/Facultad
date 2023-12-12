function telephoneCheck(str) {
  let hyphenStr = str.replace(/[^-]/g, "");
  let cleanStr = str.replace(/[-() ?]/g, "");
  let numRegex = /[0-9]/;
  let strLen = cleanStr.length;
  let isValid = true;
  let i = 0;

  //Check country code
  if ((strLen == 11) && (cleanStr[0] != 1)) {
    isValid = false;
    console.log("Ping");
  } 
  
  if ((strLen < 10) || (strLen > 11)) {
    isValid = false;
  }

  //Check quantity of hyphens
  if ((hyphenStr.length > 0) && (hyphenStr.length > 2)) {
    isValid = false;
  }

  //Introducing shitty code
  if (str[0] == "-") {isValid = false;}
  if (str.indexOf("?") != -1) {isValid = false;}
  if ((str.indexOf("(") != -1) && (str.indexOf(")") == -1)) {isValid = false;}
  if ((str.indexOf(")") != -1) && (str.indexOf("(") == -1)) {isValid = false;}
  if ((str[0] == "(") && (str[str.length - 1] == ")")) {isValid = false;}

  //Check if the number is valid
  while (isValid && (i < strLen)) {
    if (!numRegex.test(cleanStr[i])) {isValid = false;}
    i++;
  }


  return isValid;
}
