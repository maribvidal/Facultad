function palindrome(str) {
  let isPalindrome = true;
  let charArr = [], firstPart = [], secondPart = [];
  let exclusiveRegex = /[^a-zA-Z0-9]/;
  let i = 0, charLen, halfLen;

  str = str.toLowerCase();
  charArr = [...str];
  charLen = charArr.length;

  //Pop letters that aren't characters or numbers
  while (i < charLen) {
    if (exclusiveRegex.test(charArr[i])) {
      charArr.splice(i, 1);
      i -= 1;
      charLen -= 1;
    }
    i++;
  }

  //Check if number is even or odd
  halfLen = Math.round(charLen / 2);
  firstPart = charArr.slice(0, halfLen);
  i = 0;

  secondPart = charArr.slice(halfLen, charLen);
  if (charLen % 2 != 0) {halfLen--;}
  while ((i < (halfLen)) && isPalindrome) {
      //See both values in console
      if (firstPart[i] != secondPart[halfLen - i - 1]) {
        isPalindrome = false;
      }
      i++;
    }

  return isPalindrome;
}
