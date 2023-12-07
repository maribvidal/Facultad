function pairElement(str) {
  let pairArr;
  let newArr = [];
  let strArr = [...str];
  console.log(str);

  for (let i = 0; i < strArr.length; i++) {
    pairArr = [];
    pairArr.push(strArr[i]);

    switch (strArr[i]) {
      case "G":
        pairArr.push("C");
        break;
      case "C":
        pairArr.push("G");
        break;
      case "A":
        pairArr.push("T");
        break;
      default: //En teoría no debería quedar otra opción
        pairArr.push("A");
        break;
    }

    newArr.push(pairArr);
  }
  return newArr;
}
