CREATE TABLE Cliente (
    cl_run_cliente VARCHAR(20) PRIMARY KEY,
    cl_nombre VARCHAR(100),
    cl_fecha_nacimiento DATE,
    cl_direccion VARCHAR(255),
    cl_telefono VARCHAR(20)
);
-- esto es una prueba 
CREATE TABLE Ejecutivo_de_venta (
    ej_id_ejecutivo INT PRIMARY KEY,
    el_run VARCHAR(20),
    ej_nombre VARCHAR(100),
    ej_fecha_de_ingreso DATE,
    ej_vigencia BOOLEAN,
    ej_tipo_de_contrato VARCHAR(50),
    ej_id_agencia INT,
);

CREATE TABLE Agencia (
    ag_id_agencia INT PRIMARY KEY,
    ag_metas_agencia DECIMAL(10, 2),
    ag_id_jefatura INT,
    ag_fecha_de_inicio_agencia DATE,
    ag_tipo_de_agencia VARCHAR(50),
    ag_id_jefatura
);

CREATE TABLE Jefe_de_ventas (
    jv_id_jefatura INT PRIMARY KEY,
    jv_nombre_jefe VARCHAR(100),
    jv_fecha_de_ingreso DATE,
    jv_id_corporativo INT,
    jv_id_corporativo
);

CREATE TABLE Corporativo (
    ID_Corporativo INT PRIMARY KEY,
    Zona_Geografica VARCHAR(50),
    Nombre_Gerente VARCHAR(100),
    Ubicacion VARCHAR(255)
);

CREATE TABLE Cotizacion (
    Numero_Cotizacion INT PRIMARY KEY,
    Canal VARCHAR(50),
    Prima DECIMAL(10, 2),
    Fecha_Cotizacion DATE,
    ID_Ejecutivo INT,
    RUN_Cliente VARCHAR(20),
    FOREIGN KEY (ID_Ejecutivo) REFERENCES Ejecutivo_de_venta(ID_Ejecutivo),
    FOREIGN KEY (RUN_Cliente) REFERENCES Cliente(RUN_Cliente)
);

CREATE TABLE Poliza_sometida (
    Numero_Propuesta INT PRIMARY KEY,
    Prima DECIMAL(10, 2),
    Estado VARCHAR(50),
    Frecuencia_Pago VARCHAR(50),
    Fecha_Ingreso DATE,
    ID_Operacion INT,
    FOREIGN KEY (ID_Operacion) REFERENCES Operacion(ID_operacion)
);

CREATE TABLE Poliza_emitida (
    Numero_Poliza INT PRIMARY KEY,
    Prima DECIMAL(10, 2),
    Fecha_Emision DATE,
    Frecuencia_Pago VARCHAR(50),
    Estado_P_Emitida VARCHAR(50),
    ID_Operacion INT,
    FOREIGN KEY (ID_Operacion) REFERENCES Operacion(ID_operacion)
);

CREATE TABLE Operacion (
    ID_operacion INT PRIMARY KEY,
    Fecha_Aprobacion DATE,
    Responsable VARCHAR(100)
);

CREATE TABLE Producto (
    Nombre_Producto VARCHAR(100) PRIMARY KEY,
    Tipo_Producto VARCHAR(50),
    Beneficio VARCHAR(255),
    Cobertura VARCHAR(255)
);

CREATE TABLE Cotizacion_producto_sometida_emitida (
    ID INT PRIMARY KEY,
    Numero_Cotizacion INT,
    Numero_Propuesta INT,
    Numero_Poliza INT,
    FOREIGN KEY (Numero_Cotizacion) REFERENCES Cotizacion(Numero_Cotizacion),
    FOREIGN KEY (Numero_Propuesta) REFERENCES Poliza_sometida(Numero_Propuesta),
    FOREIGN KEY (Numero_Poliza) REFERENCES Poliza_emitida(Numero_Poliza)
);
-- este es Felipe editanto
