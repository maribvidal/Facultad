function binaryAgent(str) {
  const binArr = str.split(" ");
  let newStr = "";
  let curValue;
  
  for (let i = 0; i < binArr.length; i++) {
    curValue = parseInt(binArr[i], 2).toString(10);
    curValue = String.fromCharCode(curValue);
    newStr += curValue;
  }

  return newStr;
}
