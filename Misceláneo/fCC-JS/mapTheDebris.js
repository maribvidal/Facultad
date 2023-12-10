function orbitalPeriod(arr) {
  let newArr = [];
  let curObj;
  let curAvgAlt;
  let curOrbitalPeriod;

  const GM = 398600.4418;
  const earthRadius = 6367.4447;

  for (let i = 0; i < arr.length; i++) {
    curObj = new Object(); //Crear un nuevo objeto
    curObj.name = arr[i].name; //Pasarle el nombre del objeto actual al objeto nuevo

    curAvgAlt = arr[i].avgAlt;
    curOrbitalPeriod = Math.round(2 * Math.PI * Math.sqrt(Math.pow(earthRadius + curAvgAlt, 3) / GM));
    curObj.orbitalPeriod = curOrbitalPeriod;
    
    newArr.push(curObj);
  }

  return newArr;
}
