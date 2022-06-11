use sales_tools;

db.createCollection(
    "empleados", {
    validator: {
    $jsonSchema: {
        bsonType: "object",
        description: "Documento que describe a los empleados",
        required: ["id", "nombre", "apellidos", "turno", "seguro", "remuneracion", "direccion"],
        properties: {
            "id": {
                bsonType: "int",
                description: "DNI del empleado es un int y es obligatorio",
                minimum: 100000000,
                maximum: 999999999,
                },
            "nombre": {
                bsonType: "string",
                description: "Nombre del empleado es un string y es obligatorio"
                },
            "apellidos": {
                bsonType: "string",
                description: "Apellido del empleado es un string y es obligatorio"
                },
            "turno" : {
                bsonType: "array",
                description: "Hora de inicio y fin del turno es un array de ints y es obligatorio",
                minItems: 2,
                uniqueItems: true,
                items: { bsonType: "int"}
                },
            "seguro" : {
                bsonType: "string",
                description: "Nombre del seguro afiliado es un string y es obligatorio"
                },
                "remuneracion" : {
                    bsonType: "object",
                    required: ["tipo","cantidad"],
                    properties: {
                        "tipo": {
                            enum: ["salario", "sueldo", "honoraios","comision","sin sueldo"],
                            description: "Tipo de modo de remuneracion al empleado es un string y es obligatorio"
                        },
                        "cantidad": {
                            bsonType: "double",
                            description: "Cantidad remunerada al empleado es un double y es obligatorio"
                        }
                    },
                },
            "direccion": {
                bsonType: "object",
                required: ["distrito","provincia", "departamento"],
                properties: {
                    "distrito": {
                        bsonType: "string",
                        description: "Distrito es string y es obligatoria"
                    },
                    "provincia": {
                        bsonType: "string",
                        description: "Provincia es string y es obligatoria"
                    },
                    "departamento": {
                        bsonType: "string",
                        description: "Departamento es string y es obligatoria"
                        }
                    }
                }
            }
        }
    }
});


db.createCollection(
    "ventas", {
    validator: {
    $jsonSchema: {
        bsonType: "object",
        description: "Documento que describe las ventas",
        required: ["cliente_id", "producto", "metodo_pago", "monto", "empleado_id", "fecha"],
        properties: {
            "cliente_id": {
                bsonType: "int",
                description: "El id del cliente es su dni y es obligatorio"
                },
            "producto": {
                bsonType: "array",
                description: "Array que tiene los id productos que se vendieron y es obligatorio",
                minItems: 1,
                uniqueItems: true,
                items: {bsonType: "int"}
                },
            "metodo_pago": {
                bsonType: "string",
                description: "El método de pago es un string y es obligatorio"
                },
            "monto": {
                bsonType: "double",
                description: "El monto es un double y es obligatorio"
                },
            "empleado_id": {
                bsonType: "int",
                description: "El id del empleado es un int y es obligatorio"
                },
            "fecha": {
                bsonType: "date",
                description: "La fecha de la venta es un date y es obligatorio"
                },
            "cupones": {
                bsonType: "object",
                description: "Documento que describe los cupones",
                required: ["descuento", "fecha_caducidad", "cantidad"],
                properties: {
                    "descuento": {
                        bsonType: "int",
                        description: "El descuento es un int y es obligatorio",
                        minimum: 10,
                        maximum: 80,
                    },
                    "fecha_caducidad": {
                        bsonType: "date",
                        description: "La fecha de caducidad es un date y es obligatorio"
                    },
                    "cantidad": {
                        bsonType: "int",
                        description: "La cantidad de cupones es un int y es obligatorio",
                        minimum: 1,
                    }
                }
            }
        }
    }
}
});

-- Ejemplo de insercion para empleados
db.empleados.insertOne(
    {
        nombre: "Julio",
        id: 211126789,
        apellidos: "Casas",
        turno: [12,14],
        seguro: "Prima",
        remuneracion: {tipo: "salario", cantidad: 500.5},
        direccion: {distrito: "Comas", provincia: "Lima", departamento: "Lima"}
    }
);

-- Ejemplo de insercion para ventas
db.ventas.insertOne(
    {
        cliente_id: 12456789,
        producto:[05,54],
        metodo_pago:"efecivo",
        monto: 500.2,
        empleado_id:789456123,
        fecha: new Date("2001-06-12"),
    }
);
