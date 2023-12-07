function sumAll(arr) {
  let minNum, maxNum;
  let rangeSum = 0;

  //Determine which one is min and which one max
  if (arr[0] > arr[1]) {
    maxNum = arr[0];
    minNum = arr[1];
    } else {
    maxNum = arr[1];
    minNum = arr[0];
    }
  console.log(maxNum, minNum);

  //Sum all the numbers between them
  for (let i = (minNum + 1); i < maxNum; i++) {
    rangeSum += i;
    console.log(rangeSum);
  }

  return (maxNum + minNum) + rangeSum;
}
