db.tienda.insertMany([
  {_id:1,'Teclado': {"codigo":101,"precio":1200,"tags":["periferico","gaming"]}},
  {_id:2,'Ratón': {"codigo":102,"precio":850,"disponible":false}},
  {_id:3,'Monitor': {"codigo":103,"precio":22000,"tamaño":[24,27]}},
  {_id:4,'Tarjeta SSD':{"codigo":104,"precio":15000,"esNVMe":true}}
]);

// 1. Nombre y precio de todos los productos
db.tienda.find({});

// 2. Solo los que cuesten más de 1000€
db.tienda.find({ $or: [
  {"Teclado.precio":     {$gt:1000}},
  {"Ratón.precio":       {$gt:1000}},
  {"Monitor.precio":     {$gt:1000}},
  {"Tarjeta SSD.precio": {$gt:1000}}
]});

// 3. Solo los que sean discos NVMe (esNVMe = true)
db.tienda.find({"Tarjeta SSD.esNVMe": true});

// 4. Lista de tamaños del producto Monitor
db.tienda.find({"Monitor.codigo":{$exists:true}}, {"Monitor.tamaño":1, _id:0});