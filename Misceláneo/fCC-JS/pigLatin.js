function translatePigLatin(str) {
  let firstLetter = str[0];
  let vowelRegex = /[aeiou]/;

  //Check if it's a vowel or a consonant
  if (!vowelRegex.test(firstLetter)) {
    let consonantArr = str.split(vowelRegex);
    let firstVowel = str.match(vowelRegex);
    
    str = str.replace(consonantArr[0], "");
    str = str + consonantArr[0] + "ay";
  } else {
    str += "way";
  }

  return str;
}
