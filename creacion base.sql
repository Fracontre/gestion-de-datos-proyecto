CREATE TABLE Cliente (
    cl_RUN_Cliente VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(100),
    Fecha_Nacimiento DATE,
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Cosa nueva Char(5)
);
-- esto es una prueba 
CREATE TABLE Ejecutivo_de_venta (
    ID_Ejecutivo INT PRIMARY KEY,
    RUN VARCHAR(20),
    Nombre VARCHAR(100),
    Fecha_de_Ingreso DATE,
    Vigencia BOOLEAN,
    Tipo_de_contrato VARCHAR(50),
    ID_Agencia INT,
    FOREIGN KEY (ID_Agencia) REFERENCES Agencia(ID_Agencia)
);

CREATE TABLE Agencia (
    ID_Agencia INT PRIMARY KEY,
    Metas_Agencia DECIMAL(10, 2),
    ID_Jefatura INT,
    Fecha_de_inicio_agencia DATE,
    Tipo_de_agencia VARCHAR(50),
    FOREIGN KEY (ID_Jefatura) REFERENCES Jefe_de_ventas(ID_Jefatura)
);

CREATE TABLE Jefe_de_ventas (
    ID_Jefatura INT PRIMARY KEY,
    Nombre_Jefe VARCHAR(100),
    Fecha_de_ingreso DATE,
    ID_Corporativo INT,
    FOREIGN KEY (ID_Corporativo) REFERENCES Corporativo(ID_Corporativo)
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
