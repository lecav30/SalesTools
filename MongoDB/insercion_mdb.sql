/*
Inserción para Empleados
*/

db.empleados.insertMany([
     {
        nombre: "Joel",
        id: 43562875,
        apellidos: "Valdez",
        turno: {hora_entrada:8,hora_salida:16},
        seguro: "Riesgo",
        remuneracion: {tipo: "sueldo", cantidad: 1700},
        direccion: {distrito: "Ate Vitarte", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Carlos",
        id: 21112678,
        apellidos: "Sanchez",
        turno: {hora_entrada:7,hora_salida:15},
        seguro: "Vida",
        remuneracion: {tipo: "salario", cantidad: 678},
        direccion: {distrito: "Comas", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Lenin",
        id: 30123123,
        apellidos: "Rojas",
        turno: {hora_entrada:8,hora_salida:16},
        seguro: "Vida",
        remuneracion: {tipo: "sueldo", cantidad: 1300},
        direccion: {distrito: "Ventanilla", provincia: "Callao", departamento: "Lima"}
    },
    {
        nombre: "Jesús",
        id: 72556278,
        apellidos: "Rojas",
        turno: {hora_entrada:9,hora_salida:11},
        seguro: "Riesgo",
        remuneracion: {tipo: "honorarios", cantidad: 300},
        direccion: {distrito: "San Martin", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Angel",
        id: 71546179,
        apellidos: "Balcazar",
        turno: {hora_entrada:7,hora_salida:15},
        seguro: "Riesgo",
        remuneracion: {tipo: "salario", cantidad: 1000},
        direccion: {distrito: "Chorrillos", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Jeferson",
        id: 74567854,
        apellidos: "Valdez",
        turno: {hora_entrada:8,hora_salida:16},
        seguro: "Vida",
        remuneracion: {tipo: "comision", cantidad: 250},
        direccion: {distrito: "Ate Vitarte", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Joel",
        id: 43562875,
        apellidos: "Valdez",
        turno: {hora_entrada:8,hora_salida:16},
        seguro: "Riesgo",
        remuneracion: {tipo: "sueldo", cantidad: 1700},
        direccion: {distrito: "Ate Vitarte", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Mateo",
        id: 24576895,
        apellidos: "Quispe",
        turno: {hora_entrada:8,hora_salida:15},
        seguro: "Riesgo",
        remuneracion: {tipo: "salario", cantidad: 1200},
        direccion: {distrito: "Breña", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Jonas",
        id: 45781296,
        apellidos: "Salazar",
        turno: {hora_entrada:8,hora_salida:16},
        seguro: "Vida",
        remuneracion: {tipo: "salario", cantidad: 1200},
        direccion: {distrito: "Breña", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Sebastian",
        id: 41526389,
        apellidos: "Levano",
        turno: {hora_entrada:9,hora_salida:17},
        seguro: "Vida",
        remuneracion: {tipo: "sueldo", cantidad: 1700},
        direccion: {distrito: "Chorrillos", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Eduardo",
        id: 78586859,
        apellidos: "Cavero",
        turno: {hora_entrada:8,hora_salida:16},
        seguro: "Vida",
        remuneracion: {tipo: "comision", cantidad: 355},
        direccion: {distrito: "Lima", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Alipio",
        id: 20103545,
        apellidos: "Perez",
        turno: {hora_entrada:10,hora_salida:11},
        seguro: "Riesgo",
        remuneracion: {tipo: "comision", cantidad: 243},
        direccion: {distrito: "El Agustino", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Elmer",
        id: 60542105,
        apellidos: "Brazo",
        turno: {hora_entrada:9,hora_salida:17},
        seguro: "Vida",
        remuneracion: {tipo: "sueldo", cantidad: 1700},
        direccion: {distrito: "Ventanilla", provincia: "Callao", departamento: "Callao"}
    },
    {
        nombre: "Miguel",
        id: 78256143,
        apellidos: "Lopez",
        turno: {hora_entrada:10,hora_salida:11},
        seguro: "Riesgo",
        remuneracion: {tipo: "comision", cantidad: 243},
        direccion: {distrito: "Lince", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Lionel",
        id: 85204673,
        apellidos: "Saravia",
        turno: {hora_entrada:9,hora_salida:17},
        seguro: "Vida",
        remuneracion: {tipo: "sueldo", cantidad: 1800},
        direccion: {distrito: "Comas", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Josue",
        id: 43917386,
        apellidos: "Catedral",
        turno: {hora_entrada:9,hora_salida:17},
        seguro: "Vida",
        remuneracion: {tipo: "sueldo", cantidad: 1800},
        direccion: {distrito: "El Agustino", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Antony",
        id: 30629584,
        apellidos: "Carcia",
        turno: {hora_entrada:8,hora_salida:13},
        seguro: "Vida",
        remuneracion: {tipo: "salario", cantidad: 1250},
        direccion: {distrito: "La Molina", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Roberto",
        id: 75386421,
        apellidos: "Valdivia",
        turno: {hora_entrada:7,hora_salida:15},
        seguro: "Riesgo",
        remuneracion: {tipo: "salario", cantidad: 1200},
        direccion: {distrito: "La Molina", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Paul",
        id: 98657452,
        apellidos: "Cabezas",
        turno: {hora_entrada:7,hora_salida:15},
        seguro: "Riesgo",
        remuneracion: {tipo: "comision", cantidad: 280},
        direccion: {distrito: "La Victoria", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Abner",
        id: 98654325,
        apellidos: "Martinez",
        turno: {hora_entrada:11,hora_salida:13},
        seguro: "Riesgo",
        remuneracion: {tipo: "honorarios", cantidad: 280},
        direccion: {distrito: "Independencia", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Daniel",
        id: 98645652,
        apellidos: "Poma",
        turno: {hora_entrada:9,hora_salida:10},
        seguro: "Riesgo",
        remuneracion: {tipo: "honorarios", cantidad: 100},
        direccion: {distrito: "Independencia", provincia: "Lima", departamento: "Lima"}
    },
    {
        nombre: "Brayan",
        id: 74516243,
        apellidos: "Morales",
        turno: {hora_entrada:8,hora_salida:17},
        seguro: "Vida",
        remuneracion: {tipo: "sueldo", cantidad: 1700},
        direccion: {distrito: "Breña", provincia: "Lima", departamento: "Lima"}
    }
]);

/*
Inserción para Ventas
*/

db.ventas.insertMany([
    {
        cliente_id: 12423534,
        producto: [5, 54],
        metodo_pago: "Efectivo",
        monto: NumberDecimal(35),
        empleado_id: 21112678,
        fecha: new Date("2018-06-12"),
    },
    {
        cliente_id: 67865645,
        producto: [13, 21],
        metodo_pago: "Tarjeta",
        monto: NumberDecimal(70),
        empleado_id: 30123123,
        fecha: new Date("2019-02-23"),
        cupones: {descuento: 30, fecha_caducidad: new Date("2020-12-21"), cantidad: 20}
    },
    {
        cliente_id: 67867992,
        producto: [3, 21, 30],
        metodo_pago: "Yape",
        monto: NumberDecimal(60),
        empleado_id: 71546179,
        fecha: new Date("2018-03-06"),
        cupones: {descuento: 20, fecha_caducidad: new Date("2020-06-20"), cantidad: 40}
    },
    {
        cliente_id: 45645676,
        producto: [10, 29],
        metodo_pago: "Plin",
        monto: NumberDecimal(41),
        empleado_id: 72556278,
        fecha: new Date("2017-12-23")
    },
    {
        cliente_id: 56786896,
        producto: [12, 3],
        metodo_pago: "Plin",
        monto: NumberDecimal(19.5),
        empleado_id: 98654325,
        fecha: new Date("2020-04-17")
    },
    {
        cliente_id: 56786896,
        producto: [1, 45, 23, 12],
        metodo_pago: "Tarjeta",
        monto: NumberDecimal(45.6),
        empleado_id: 74516243,
        fecha: new Date("2021-09-13"),
        cupones: {descuento: 20, fecha_caducidad: new Date("2022-06-20"), cantidad: 50}
    },
    {
        cliente_id: 96568766,
        producto: [2],
        metodo_pago: "Yape",
        monto: NumberDecimal(12),
        empleado_id: 98657452,
        fecha: new Date("2015-11-30")
    },
    {
        cliente_id: 45346434,
        producto: [3, 23, 12, 42, 60],
        metodo_pago: "Efectivo",
        monto: NumberDecimal(50.6),
        empleado_id: 75386421,
        fecha: new Date("2022-01-12"),
        cupones: {descuento: 10, fecha_caducidad: new Date("2023-06-20"), cantidad: 30}
    },
    {
        cliente_id: 24536364,
        producto: [8, 33],
        metodo_pago: "Tarjeta",
        monto: NumberDecimal(27),
        empleado_id: 74567854,
        fecha: new Date("2019-07-19")
    },
    {
        cliente_id: 13464543,
        producto: [23],
        metodo_pago: "Plin",
        monto: NumberDecimal(32),
        empleado_id: 43917386,
        fecha: new Date("2019-10-11")
    },
    {
        cliente_id: 13464543,
        producto: [23, 1, 13, 12],
        metodo_pago: "Tarjeta",
        monto: NumberDecimal(90),
        empleado_id: 30629584,
        fecha: new Date("2020-12-25"),
        cupones: {descuento: 50, fecha_caducidad: new Date("2021-12-21"), cantidad: 20}
    },
    {
        cliente_id: 46435634,
        producto: [32, 21, 4],
        metodo_pago: "Plin",
        monto: NumberDecimal(40.5),
        empleado_id: 43562875,
        fecha: new Date("2020-03-24")
    },
    {
        cliente_id: 13564564,
        producto: [23, 48],
        metodo_pago: "Efectivo",
        monto: NumberDecimal(25.5),
        empleado_id: 24576895,
        fecha: new Date("2021-08-18")
    },
    {
        cliente_id: 16746535,
        producto: [23, 48, 32, 9, 21],
        metodo_pago: "Efectivo",
        monto: NumberDecimal(48.5),
        empleado_id: 45781296,
        fecha: new Date("2015-04-03")
    },
    {
        cliente_id: 14245356,
        producto: [4],
        metodo_pago: "Efectivo",
        monto: NumberDecimal(8),
        empleado_id: 41526389,
        fecha: new Date("2019-05-20")
    },
    {
        cliente_id: 10100101,
        producto: [20, 21, 23],
        metodo_pago: "Yape",
        monto: NumberDecimal(24),
        empleado_id: 85204673,
        fecha: new Date("2018-12-31")
    },
    {
        cliente_id: 12312414,
        producto: [20, 21, 12, 23, 60, 34],
        metodo_pago: "Tarjeta",
        monto: NumberDecimal(74.5),
        empleado_id: 78586859,
        fecha: new Date("2017-06-24"),
        cupones: {descuento: 10, fecha_caducidad: new Date("2018-12-21"), cantidad: 40}
    },
    {
        cliente_id: 78675685,
        producto: [60, 33],
        metodo_pago: "Plin",
        monto: NumberDecimal(20),
        empleado_id: 78256143,
        fecha: new Date("2017-06-23")
    },
    {
        cliente_id: 13453466,
        producto: [21],
        metodo_pago: "Efectivo",
        monto: NumberDecimal(15),
        empleado_id: 74516243,
        fecha: new Date("2019-09-15")
    },
    {
        cliente_id: 35645647,
        producto: [12, 6],
        metodo_pago: "Yape",
        monto: NumberDecimal(23.5),
        empleado_id: 98645652,
        fecha: new Date("2022-02-13")
    },
    {
        cliente_id: 67867996,
        producto: [17, 23, 32],
        metodo_pago: "Efectivo",
        monto: NumberDecimal(30.5),
        empleado_id: 20103545,
        fecha: new Date("2021-05-27"),
        cupones: {descuento: 10, fecha_caducidad: new Date("2022-12-21"), cantidad: 30}
    },
    {
        cliente_id: 28797979,
        producto: [17, 14],
        metodo_pago: "Tarjeta",
        monto: NumberDecimal(28),
        empleado_id: 60542105,
        fecha: new Date("2015-10-23")
    }
]);
