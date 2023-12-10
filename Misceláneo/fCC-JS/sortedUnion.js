function uniteUnique(arr) {
  let newArr = [];

  for (let i = 0; i < arguments.length; i++) {
    for (let j = 0; j < arguments[i].length; j++) {
      if (newArr.indexOf(arguments[i][j]) == -1) {
        newArr.push(arguments[i][j]);
      }
    }
  }

  return newArr;
}
