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
    coti_Numero_Cotizacion INT PRIMARY KEY,
    coti_Canal VARCHAR(50),
    coti_Prima DECIMAL(10, 2),
    coti_Fecha_Cotizacion DATE,
    coti_ID_Ejecutivo INT, -- esto no debería existir
    coti_RUN_Cliente VARCHAR(20), -- esto no debería existir
    ej_ID_Ejecutivo,
    cl_RUN_Cliente)
);

CREATE TABLE Poliza_sometida (
    pol_som_Numero_Propuesta INT PRIMARY KEY,
    pol_som_Prima DECIMAL(10, 2),
    pol_som_Estado VARCHAR(50),
    pol_som_Frecuencia_Pago VARCHAR(50),
    pol_som_Fecha_Ingreso DATE,
    pol_som_ID_Operacion INT,
    FOREIGN KEY (ID_Operacion) REFERENCES Operacion(ID_operacion)
);

CREATE TABLE Poliza_emitida (
    pol_emi_Numero_Poliza INT PRIMARY KEY,
    pol_emi_Prima DECIMAL(10, 2),
    pol_emi_Fecha_Emision DATE,
    pol_emi_Frecuencia_Pago VARCHAR(50),
    pol_emi_Estado_P_Emitida VARCHAR(50),
    pol_emi_ID_Operacion INT,
    FOREIGN KEY (ID_Operacion) REFERENCES Operacion(ID_operacion)
);

CREATE TABLE Operacion (
    ops_ID_operacion INT PRIMARY KEY,
    ops_Fecha_Aprobacion DATE,
    ops_Responsable VARCHAR(100)
);

CREATE TABLE Producto (
    prod_Nombre_Producto VARCHAR(100) PRIMARY KEY,
    prod_Tipo_Producto VARCHAR(50),
    prod_Beneficio VARCHAR(255),
    prod_Cobertura VARCHAR(255)
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
