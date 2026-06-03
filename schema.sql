-- =========================================================================
-- 1. CREACIÓN DE TIPOS 
-- =========================================================================
CREATE TYPE rol_usuario AS ENUM ('user', 'admin');
CREATE TYPE tipo_proyecto AS ENUM ('residencial', 'comercial', 'infraestructura', 'público');
CREATE TYPE estado_proyecto AS ENUM ('Planificado', 'En Progreso', 'Completado', 'Diseño', 'Licitación', 'Ejecución');
CREATE TYPE estado_opinion AS ENUM ('Recibida', 'EN análisis por IA', 'Considerada', 'No recibida');
CREATE TYPE tipo_sentimiento AS ENUM ('Positivo', 'Neutral', 'Negativo');

-- =========================================================================
-- 2. CREACIÓN DE TABLAS
-- =========================================================================

-- Tabla de Usuarios 
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    rut VARCHAR(12) NOT NULL UNIQUE,          
    nombre_completo VARCHAR(150) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,
    region VARCHAR(100) NOT NULL,             -- Almacena la selección de REGIONES_CHILE
    comuna VARCHAR(100) NOT NULL,             -- Almacena la selección dinámica de COMUNAS
    contrasena VARCHAR(255) NOT NULL,         -- Almacenará la clave encriptada (Hash)
    rol rol_usuario NOT NULL DEFAULT 'user',   -- Define accesos de navegación
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Proyectos (Mapea tu Mapa Leaflet, Vista de Detalles y AdminPanel)
CREATE TABLE proyectos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    tipo tipo_proyecto NOT NULL,
    descripcion TEXT NOT NULL,
    estado estado_proyecto NOT NULL DEFAULT 'Planificado',
    lat NUMERIC(10, 6) NOT NULL,              -- Precisión ideal para coordenadas de Leaflet
    lng NUMERIC(10, 6) NOT NULL,              -- Precisión ideal para coordenadas de Leaflet
    fecha_inicio DATE,
    fecha_fin DATE,
    presupuesto INT DEFAULT 0,                 -- Campo visualizado en la vista de detalles
    ubicacion_texto VARCHAR(255),             -- Texto descriptivo de la locación (ej: "Centro, Ciudad")
    responsable_id INT REFERENCES usuarios(id) ON DELETE RESTRICT
);

-- Tabla de Opiniones / Experiencias (Mapea el Formulario de participación y OpinionsPage)
CREATE TABLE opiniones (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    proyecto_id INT REFERENCES proyectos(id) ON DELETE CASCADE, -- Vinculado al proyecto desde el que opina
    emocion VARCHAR(50) NOT NULL,             -- ("Enojo", "Alegría", "Preocupación")
    descripcion TEXT NOT NULL,                
    foto_url VARCHAR(255),                    -- Ruta de almacenamiento de la imagen adjunta (File)
    estado estado_opinion NOT NULL DEFAULT 'received', -- Controla el flujo visual en OpinionsPage
    categoria VARCHAR(100) NOT NULL,          -- Categorías como "Infraestructura", "Espacios publicos", etc.
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Análisis de IA 
CREATE TABLE analisis_ia (
    id SERIAL PRIMARY KEY,
    opinion_id INT NOT NULL UNIQUE REFERENCES opiniones(id) ON DELETE CASCADE, -- Relación 1 a 1 con la opinión
    sentimiento tipo_sentimiento NOT NULL,
    confianza VARCHAR(10) NOT NULL,           -- Guarda el porcentaje calculado 
    palabras_clave TEXT[] NOT NULL,          
);