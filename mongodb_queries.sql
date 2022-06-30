use sales_tools;

// N° 2 listar el medio de pago más comun
db.ventas.aggregate([
  {
     $group: {
       _id: {
        "metodo_pago": "$metodo_pago"
      },
       count: {
        "$sum": 1
      }
    }
  },
  {
      $sort: {
      "count": -1
    }
  },
  {
    $limit:1
  }
]);

//N° 7 Buscar el seguro mas común
db.empleados.aggregate([
  {
      $group: {
       _id: {
        "seguro": "$seguro"
      },
       count: {
        "$sum": 1
      }
    }
  },
  {
      $sort: {
      "count": -1
    }
  },
  {
    $limit:1
  }
]);

//N°12 La cantidad de compras por cliente
db.ventas.aggregate([
  {
     $group: {
       _id: {
        "DNI": "$cliente_id"
      },
       count: {
        "$sum": 1
      }
    }
  },
  {
      $sort: {
      "count": -1
    }
  },
]);

/*5) cantidad de horas trabajadas por un empleado*//*Consultar la cantidad de productos por venta*/
db.empleados.aggregate({
$project:{
_id:1,
id:1,
nombre:1,
apellidos:1,
cantidad_horas_trabajadas:{
$subtract:["$turno.hora_salida","$turno.hora_entrada"]
}}})

/*10) Consultar la cantidad de productos por venta*/
db.ventas.aggregate(
    [
        {
            $project:
            {
                Productos: {$cond: { if: { $isArray: "$producto" }, then: { $size: "$producto" }, else: "NA"}},
                Fecha: "$fecha",
                _id: 0
            }
        },
    ]
);

/*15) Consultar la cantidad de ventas realizadas con cupones*/
db.ventas.find({cupones:{$exists:true}}).count()



db.empleados.aggregate({
$project:{
_id:1,
id:1,
nombre:1,
apellidos:1,
cantidad_horas_trabajadas:{
$subtract:["$turno.hora_salida","$turno.hora_entrada"]
}}})

//N°3 Consultar cuál es la cantidad de empleados por cada distrito.
db.empleados.aggregate([
    {$group: {_id: "$direccion.distrito", quantity: {$count:{}}}},
    {$sort: {quantity: -1}}
])

//N°8 Listar todos los empleados
db.empleados.find({}, {nombre: 1, apellidos: 1, _id: 0})

//N°13 Consultar el id del cliente(s) que compro más en un intervalo de tiempo
db.ventas.aggregate([
    {$match: {fecha:{$gte: ISODate("2018-06-12T00:00:00.000Z"), $lt: ISODate("2019-02-23T00:00:00.000Z")}}},
    {$group: {_id: "$cliente_id", quantity: {$count:{}}}},
    {$sort: {quantity: -1}},
    {$limit: 1}
]);

// Consultar el empleado que más ventas a realizado
db.ventas.aggregate(
[
    {$group : {
           _id : '$empleado_id',
           cantidadID: {$sum : 1},
       }},
    {$sort:{
           cantidadID: -1
    }},
    {$limit: 1}
]
);

//Consultar cual es el tipo de remuneración más común para los empleados
db.empleados.aggregate(
[
   {
       $group: {
       _id:'$remuneracion.tipo',
       cantidad: {$sum : 1}
       }
   }
]
);

//Consultar la fecha en donde se registró el mayor número de ventas.
db.ventas.aggregate([
    {$group:
       {
           _id:{mes: {$month:"$fecha"}, año: {$year:"$fecha"}},
           cantidad: {$sum : 1},
       }},
        {$sort:{
           cantidad: -1
    }},
    {$limit: 1}
]);

// Consultar la mayor cantidad remunerada por cada tipo de remuneración
db.empleados.aggregate(
    [
        {
            $group:
                {
                    _id: {tipo_remuneracion: "$remuneracion.tipo"},
                    max_remuneracion: { $max: "$remuneracion.cantidad"},
                }
        },
        {
            $project:
                {
                    "Tipo de Remuneración": "$_id.tipo_remuneracion",
                    "Cantidad Remunerada": "$max_remuneracion",
                    _id: 0
                }
        },
        {
            $sort: {"Cantidad Remunerada": -1}
        }
    ]
);

// Consultar cuánto se ha vendido en un día determinado
db.ventas.aggregate(
    [
        {
            $match:
            {
                $expr: {
                    "$and":
                    [
                        {$eq: [{ $year: "$fecha" }, { $year: new Date("2018-06-12") }]},
                        {$eq: [{ $month: "$fecha" }, { $month: new Date("2018-06-12") }]},
                        {$eq: [{ $dayOfMonth: "$fecha" }, { $dayOfMonth: new Date("2018-06-12") }]}
                    ]
                }
            }
        },
        {
            $group:
                {
                    _id: null,
                    monto_total: { $sum: "$monto"}
                }
        },
        {
            $project:
                {
                    "Monto total del día": "$monto_total",
                    _id: 0
                }
        },
    ]
);

// Consultar el cupón más utilizado en las ventas
db.ventas.aggregate(
    [
        {
            $match: {"cupones.descuento": {$ne: null}}
        },
        {
            $group:
                {
                    _id: {cupones: "$cupones.descuento"},
                    max_cupones: {$count: {}}
                }
        },
        {
            $project:
                {
                    "Valor del Cupón": "$_id.cupones",
                    Cantidad: "$max_cupones",
                    _id: 0
                }
        },
        {
            $sort: {Cantidad: -1}
        },
        {
            $limit: 1
        }
    ]
);
