  MODULE('GESTION024.CLW')
Carga_modulos          PROCEDURE                      !Administrador de CURSO_MODULOS
SelectTIPO_CURSO       PROCEDURE                      !Select a TIPO_CURSO Record
UpdateCURSO            PROCEDURE                      !Actualizacion CURSO
CURSOS_ABM             PROCEDURE                      !Browse the CURSO File
UpdateCURSO_MODULOS    PROCEDURE                      !Actualizacion CURSO_MODULOS
BrowseCURSO_MODULOSByCUR2:FK_CURSO_MODULOS_CURSO PROCEDURE !Browse the CURSO_MODULOS file by CUR2:FK_CURSO_MODULOS_CURSO
Ver_Pagos              PROCEDURE                      !Ver Pagos
SelectUSUARIO          PROCEDURE                      !Select a USUARIO Record
Ver_Pagos2             PROCEDURE                      !Actualizacion PAGOS
SelectFACTURA          PROCEDURE                      !Select a FACTURA Record
  END
