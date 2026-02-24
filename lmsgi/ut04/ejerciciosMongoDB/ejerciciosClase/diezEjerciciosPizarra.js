db.employees.insertMany([
  {_id: 1, name: 'Clark', dept: 'Sales', age: 23 },
  {_id: 2, name: 'Dave', dept: 'Accounting', age: 30 },
  {_id: 3, name: 'Ava', dept: 'Sales', age: 23 }
]);

db.employees.insertOne( {_id: 4, name: 'Pedro', dept: 'Ingenieria', age: 44} );
db.employees.insertOne( {_id: 5, name: 'Maria', dept: 'Ingenieria'} );

print("1. Mostrar coleción de documentos:");
db.employees.find({});

print("2. Mostrar los documentos del dpto de ventas:");
db.employees.find({dept: 'Sales'});

print("3. Mostrar los que NOT EQUAL de ventas:");
db.employees.find({dept: {$ne: 'Sales'}});

print("4. Mostrar los menores de 30 años:");
db.employees.find({age: {$lt: 30}});

// Comparaciones $lt , $lte, $gt, $gte, $ne
// Composiciones o lógicos: $and, $or, $not

print("5. Mostrar el nombre de TODOS los empleados");
db.employees.find(
  {}, // query
  {_id: false, name: true} // proyección
  );
  
  
print("6. Mostrar el nombre de TODOS los empleados del dpto de Sales");
db.employees.find(
  {dept: 'Sales'}, // query
  {_id:false, name: true} // proyección
  );


print("7. Mostrar... ordenado alafabéticamente")
db.employees.find(
  {dept: 'Sales'}, // query
  {_id:false, name: true}, // proyección
  { sort: {name: 1} }  // opciones
  );

print("8. Mostrar... ordenado alafabéticamente inverso")
db.employees.find(
  {dept: 'Sales'}, // query
  {_id:false, name: true}, // proyección
  { sort: {name: -1} } // opciones
  );

print("9. Mostrar ordenados por edad (del mayor al menor) y nombre")
db.employees.find(
  {}, // query
  {_id:false, name: true, age: true}, // proyección
  { sort: {age: -1, name: 1} } // opciones
  );  
  
  
print("10. Mostrar el último _id");
db.employees.find(
  {}, // query
  {_id: true}, // proyección
  { sort: {_id: -1}, limit: 1}  // opciones
  );
  
  
  
