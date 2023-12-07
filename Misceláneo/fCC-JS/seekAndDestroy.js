function destroyer(arr) {
  let argNum = arguments.length;

  for (let i = 1; i < argNum; i++) {
    arr = arr.filter((elem) => elem !== arguments[i])};

  return arr;
}
