function diffArray(arr1, arr2) {
  const newArr = [];
  let mergedArr = arr1.concat(arr2);

  for (let i = 0; i < mergedArr.length; i++) {
    if (!(arr1.includes(mergedArr[i]) && arr2.includes(mergedArr[i]))) {
      newArr.push(mergedArr[i]);
    }
  }
  
  return newArr;
}
