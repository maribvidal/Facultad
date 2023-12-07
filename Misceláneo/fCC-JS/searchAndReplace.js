function myReplace(str, before, after) {
  let caseRegex = /[A-Z]/;
  let afterStr = [...after];
  let firstLetterCase = caseRegex.test(before);

  if (firstLetterCase) {
    afterStr[0] = afterStr[0].toUpperCase();
  } else {
    afterStr[0] = afterStr[0].toLowerCase();
  }

  after = afterStr.join('');

  str = str.replace(before, after);
  return str;
}
