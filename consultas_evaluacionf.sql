
--EL ENUNCIADO PRODUJO EN EL GRUPO DE TRABAJO DISTINTAS INTERPRETACIONES RESPECTO DE LO SOLICITADO EN LAS CONSULTAS
--SE EXPONEN AQUI DOS VERSIONES PARA DOS PUNTOS DE VISTA 
    ---------------------------consulta A---------------------------- 

--OPCION1---    
--SOLO MOSTRAR LOS DATOS SOLICITADOS EXPLICITAMENTE DE LOS ASISTENTES A LA CAPACITACION CORRESPONDIENTE A UN CLIENTE

SELECT ASISTNOMBRECOMPLETO, ASISTEDAD, ASISTCORREO
FROM ASISTENTES
WHERE CAPACITACION_IDCAPACITACION IN (
   SELECT IDCAPACITACION
  FROM CAPACITACION
  WHERE (CLIENTE_RUTCLIENTE = 12334555));
  
  --OPCION2----
  -- MOSTRAR LOS DATOS DE LAS CAPACITACIONES DE UN CLIENTE JUNTO CON LOS DATOS SOLICITADOS DE LOS ASISTENTES 
  SELECT
    capacitacion.*,
     asistentes.asistnombrecompleto,
    asistentes.asistedad,
    asistentes.asistcorreo
    
FROM
         capacitacion
    INNER JOIN cliente ON cliente.rutcliente = capacitacion.cliente_rutcliente
    INNER JOIN asistentes ON capacitacion.idcapacitacion = asistentes.capacitacion_idcapacitacion
WHERE
    cliente.rutcliente = 12334555;
  
  
  
  ---------------------------consulta B----------------------------  
  
 --OPCION1--- 
 --MOSTRAR SOLO LOS DATOS DE CHEQUEO SOLICITADOS PARA LAS VISITAS DE CLIENTES DE VALPARAISO
  
  SELECT REGISTRO_IDCHEQUEO,  CUMPLECHEQUEO, OBSERVACIONES
FROM REGISTROCHEQUEO
WHERE REGISTRO_IDVISITA IN (
  SELECT IDVISITA
  FROM VISITA
  WHERE Cliente_rutcliente IN (
    SELECT rutcliente
    FROM CLIENTE
    WHERE CLICOMUNA = 'VALPARAISO'));
    

  --OPCION2----
  -- MOSTRAR LOS DATOS DE LAS VISITAS DE CLIENTES DE VALPARAISO, JUNTO CON LOS DATOS DE CHEQUE SOLICITADO
    
    
SELECT
    visita.cliente_rutcliente,
    visita.vislugar,
    visita.visfecha,
    visita.vishora,
    visita.viscomentarios,
    registrochequeo.registro_idvisita,
    registrochequeo.registro_idchequeo,
    registrochequeo.cumplechequeo,
    registrochequeo.observaciones
    
FROM
  cliente
    INNER JOIN visita ON cliente.rutcliente = visita.cliente_rutcliente
    INNER JOIN registrochequeo ON visita.idvisita = registrochequeo.registro_idvisita
WHERE
    cliente.clicomuna = 'VALPARAISO';
    
 --EL DETALLE DE LA HORA SE PUEDE VER HACIENDO DOBLE CLICK EN EL CAMPO VISHORA Y EL ICONO DEL LAPIZ 
    
    
    ---------------------------consulta C----------------------------     
    
SELECT 
    AC.IDACCIDENTE,AC.ACCIFECHA, AC.ACCIHORA, AC.ACCILUGAR, AC.ACCIORIGEN, 
    AC.ACCICONSECUENCIAS,CLI.CLINOMBRES,CLI.CLIAPELLIDOS,CLI.RUTCLIENTE,CLI.CLITELEFONO
FROM
    ACCIDENTE AC INNER JOIN CLIENTE CLI
ON  CLI.RUTCLIENTE=AC.CLIENTE_RUTCLIENTE;

 --EL DETALLE DE LA HORA SE PUEDE VER HACIENDO DOBLE CLICK EN EL CAMPO ACCIHORA Y EL ICONO DEL LAPIZ 