  MEMBER('Gestion.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
Gestion_BC0:DctInit    PROCEDURE()
Gestion_BC0:DctKill    PROCEDURE()
Gestion_BC0:FilesInit  PROCEDURE()
  END

Hide:Access:CIRCULO  CLASS(FileManager),TYPE               ! FileManager for CIRCULO
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CIRCULO  CLASS(RelationManager),TYPE           ! RelationManager for CIRCULO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CUMPLE   CLASS(FileManager),TYPE               ! FileManager for CUMPLE
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CUMPLE   CLASS(RelationManager),TYPE           ! RelationManager for CUMPLE
Init                   PROCEDURE
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:FACTURA_CONVENIO CLASS(FileManager),TYPE       ! FileManager for FACTURA_CONVENIO
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:FACTURA_CONVENIO CLASS(RelationManager),TYPE   ! RelationManager for FACTURA_CONVENIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:INFORME  CLASS(FileManager),TYPE               ! FileManager for INFORME
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:INFORME  CLASS(RelationManager),TYPE           ! RelationManager for INFORME
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CURSO_CUOTA CLASS(FileManager),TYPE            ! FileManager for CURSO_CUOTA
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CURSO_CUOTA CLASS(RelationManager),TYPE        ! RelationManager for CURSO_CUOTA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:EXP_CURSO_INSCRIPCION CLASS(FileManager),TYPE  ! FileManager for EXP_CURSO_INSCRIPCION
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:EXP_CURSO_INSCRIPCION CLASS(RelationManager),TYPE ! RelationManager for EXP_CURSO_INSCRIPCION
Init                   PROCEDURE
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:LIQUIDACION_CODIGO CLASS(FileManager),TYPE     ! FileManager for LIQUIDACION_CODIGO
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:LIQUIDACION_CODIGO CLASS(RelationManager),TYPE ! RelationManager for LIQUIDACION_CODIGO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:PAGOS_LIQUIDACION CLASS(FileManager),TYPE      ! FileManager for PAGOS_LIQUIDACION
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:PAGOS_LIQUIDACION CLASS(RelationManager),TYPE  ! RelationManager for PAGOS_LIQUIDACION
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:EMAILS   CLASS(FileManager),TYPE               ! FileManager for EMAILS
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:EMAILS   CLASS(RelationManager),TYPE           ! RelationManager for EMAILS
Init                   PROCEDURE
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:BANCO_DEBITO CLASS(FileManager),TYPE           ! FileManager for BANCO_DEBITO
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:BANCO_DEBITO CLASS(RelationManager),TYPE       ! RelationManager for BANCO_DEBITO
Init                   PROCEDURE
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:MCENTRO_SALUD CLASS(FileManager),TYPE          ! FileManager for MCENTRO_SALUD
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:MCENTRO_SALUD CLASS(RelationManager),TYPE      ! RelationManager for MCENTRO_SALUD
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CONF_EMP CLASS(FileManager),TYPE               ! FileManager for CONF_EMP
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CONF_EMP CLASS(RelationManager),TYPE           ! RelationManager for CONF_EMP
Init                   PROCEDURE
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:FONDOS   CLASS(FileManager),TYPE               ! FileManager for FONDOS
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:FONDOS   CLASS(RelationManager),TYPE           ! RelationManager for FONDOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:TIPO_COBERTURA CLASS(FileManager),TYPE         ! FileManager for TIPO_COBERTURA
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_COBERTURA CLASS(RelationManager),TYPE     ! RelationManager for TIPO_COBERTURA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:SQL      CLASS(FileManager),TYPE               ! FileManager for SQL
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SQL      CLASS(RelationManager),TYPE           ! RelationManager for SQL
Init                   PROCEDURE
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:PAGO_CONVENIO CLASS(FileManager),TYPE          ! FileManager for PAGO_CONVENIO
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:PAGO_CONVENIO CLASS(RelationManager),TYPE      ! RelationManager for PAGO_CONVENIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CONSULTRIO_ADHERENTE CLASS(FileManager),TYPE   ! FileManager for CONSULTRIO_ADHERENTE
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:CONSULTRIO_ADHERENTE CLASS(RelationManager),TYPE ! RelationManager for CONSULTRIO_ADHERENTE
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:AUDITORIA CLASS(FileManager),TYPE              ! FileManager for AUDITORIA
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:AUDITORIA CLASS(RelationManager),TYPE          ! RelationManager for AUDITORIA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CONTROL_LIQUIDACION CLASS(FileManager),TYPE    ! FileManager for CONTROL_LIQUIDACION
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CONTROL_LIQUIDACION CLASS(RelationManager),TYPE ! RelationManager for CONTROL_LIQUIDACION
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:EMAIL    CLASS(FileManager),TYPE               ! FileManager for EMAIL
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:EMAIL    CLASS(RelationManager),TYPE           ! RelationManager for EMAIL
Init                   PROCEDURE
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END


_Hide:Access:CIRCULO &Hide:Access:CIRCULO,AUTO,THREAD
_Hide:Relate:CIRCULO &Hide:Relate:CIRCULO,AUTO,THREAD
_Hide:Access:CUMPLE  &Hide:Access:CUMPLE,AUTO,THREAD
_Hide:Relate:CUMPLE  &Hide:Relate:CUMPLE,AUTO,THREAD
_Hide:Access:FACTURA_CONVENIO &Hide:Access:FACTURA_CONVENIO,AUTO,THREAD
_Hide:Relate:FACTURA_CONVENIO &Hide:Relate:FACTURA_CONVENIO,AUTO,THREAD
_Hide:Access:INFORME &Hide:Access:INFORME,AUTO,THREAD
_Hide:Relate:INFORME &Hide:Relate:INFORME,AUTO,THREAD
_Hide:Access:CURSO_CUOTA &Hide:Access:CURSO_CUOTA,AUTO,THREAD
_Hide:Relate:CURSO_CUOTA &Hide:Relate:CURSO_CUOTA,AUTO,THREAD
_Hide:Access:EXP_CURSO_INSCRIPCION &Hide:Access:EXP_CURSO_INSCRIPCION,AUTO,THREAD
_Hide:Relate:EXP_CURSO_INSCRIPCION &Hide:Relate:EXP_CURSO_INSCRIPCION,AUTO,THREAD
_Hide:Access:LIQUIDACION_CODIGO &Hide:Access:LIQUIDACION_CODIGO,AUTO,THREAD
_Hide:Relate:LIQUIDACION_CODIGO &Hide:Relate:LIQUIDACION_CODIGO,AUTO,THREAD
_Hide:Access:PAGOS_LIQUIDACION &Hide:Access:PAGOS_LIQUIDACION,AUTO,THREAD
_Hide:Relate:PAGOS_LIQUIDACION &Hide:Relate:PAGOS_LIQUIDACION,AUTO,THREAD
_Hide:Access:EMAILS  &Hide:Access:EMAILS,AUTO,THREAD
_Hide:Relate:EMAILS  &Hide:Relate:EMAILS,AUTO,THREAD
_Hide:Access:BANCO_DEBITO &Hide:Access:BANCO_DEBITO,AUTO,THREAD
_Hide:Relate:BANCO_DEBITO &Hide:Relate:BANCO_DEBITO,AUTO,THREAD
_Hide:Access:MCENTRO_SALUD &Hide:Access:MCENTRO_SALUD,AUTO,THREAD
_Hide:Relate:MCENTRO_SALUD &Hide:Relate:MCENTRO_SALUD,AUTO,THREAD
_Hide:Access:CONF_EMP &Hide:Access:CONF_EMP,AUTO,THREAD
_Hide:Relate:CONF_EMP &Hide:Relate:CONF_EMP,AUTO,THREAD
_Hide:Access:FONDOS  &Hide:Access:FONDOS,AUTO,THREAD
_Hide:Relate:FONDOS  &Hide:Relate:FONDOS,AUTO,THREAD
_Hide:Access:TIPO_COBERTURA &Hide:Access:TIPO_COBERTURA,AUTO,THREAD
_Hide:Relate:TIPO_COBERTURA &Hide:Relate:TIPO_COBERTURA,AUTO,THREAD
_Hide:Access:SQL     &Hide:Access:SQL,AUTO,THREAD
_Hide:Relate:SQL     &Hide:Relate:SQL,AUTO,THREAD
_Hide:Access:PAGO_CONVENIO &Hide:Access:PAGO_CONVENIO,AUTO,THREAD
_Hide:Relate:PAGO_CONVENIO &Hide:Relate:PAGO_CONVENIO,AUTO,THREAD
_Hide:Access:CONSULTRIO_ADHERENTE &Hide:Access:CONSULTRIO_ADHERENTE,AUTO,THREAD
_Hide:Relate:CONSULTRIO_ADHERENTE &Hide:Relate:CONSULTRIO_ADHERENTE,AUTO,THREAD
_Hide:Access:AUDITORIA &Hide:Access:AUDITORIA,AUTO,THREAD
_Hide:Relate:AUDITORIA &Hide:Relate:AUDITORIA,AUTO,THREAD
_Hide:Access:CONTROL_LIQUIDACION &Hide:Access:CONTROL_LIQUIDACION,AUTO,THREAD
_Hide:Relate:CONTROL_LIQUIDACION &Hide:Relate:CONTROL_LIQUIDACION,AUTO,THREAD
_Hide:Access:EMAIL   &Hide:Access:EMAIL,AUTO,THREAD
_Hide:Relate:EMAIL   &Hide:Relate:EMAIL,AUTO,THREAD


Gestion_BC0:DctInit PROCEDURE()
  CODE
  _Hide:Access:CIRCULO &= NEW(Hide:Access:CIRCULO)
  _Hide:Relate:CIRCULO &= NEW(Hide:Relate:CIRCULO)
  _Hide:Access:CUMPLE &= NEW(Hide:Access:CUMPLE)
  _Hide:Relate:CUMPLE &= NEW(Hide:Relate:CUMPLE)
  _Hide:Access:FACTURA_CONVENIO &= NEW(Hide:Access:FACTURA_CONVENIO)
  _Hide:Relate:FACTURA_CONVENIO &= NEW(Hide:Relate:FACTURA_CONVENIO)
  _Hide:Access:INFORME &= NEW(Hide:Access:INFORME)
  _Hide:Relate:INFORME &= NEW(Hide:Relate:INFORME)
  _Hide:Access:CURSO_CUOTA &= NEW(Hide:Access:CURSO_CUOTA)
  _Hide:Relate:CURSO_CUOTA &= NEW(Hide:Relate:CURSO_CUOTA)
  _Hide:Access:EXP_CURSO_INSCRIPCION &= NEW(Hide:Access:EXP_CURSO_INSCRIPCION)
  _Hide:Relate:EXP_CURSO_INSCRIPCION &= NEW(Hide:Relate:EXP_CURSO_INSCRIPCION)
  _Hide:Access:LIQUIDACION_CODIGO &= NEW(Hide:Access:LIQUIDACION_CODIGO)
  _Hide:Relate:LIQUIDACION_CODIGO &= NEW(Hide:Relate:LIQUIDACION_CODIGO)
  _Hide:Access:PAGOS_LIQUIDACION &= NEW(Hide:Access:PAGOS_LIQUIDACION)
  _Hide:Relate:PAGOS_LIQUIDACION &= NEW(Hide:Relate:PAGOS_LIQUIDACION)
  _Hide:Access:EMAILS &= NEW(Hide:Access:EMAILS)
  _Hide:Relate:EMAILS &= NEW(Hide:Relate:EMAILS)
  _Hide:Access:BANCO_DEBITO &= NEW(Hide:Access:BANCO_DEBITO)
  _Hide:Relate:BANCO_DEBITO &= NEW(Hide:Relate:BANCO_DEBITO)
  _Hide:Access:MCENTRO_SALUD &= NEW(Hide:Access:MCENTRO_SALUD)
  _Hide:Relate:MCENTRO_SALUD &= NEW(Hide:Relate:MCENTRO_SALUD)
  _Hide:Access:CONF_EMP &= NEW(Hide:Access:CONF_EMP)
  _Hide:Relate:CONF_EMP &= NEW(Hide:Relate:CONF_EMP)
  _Hide:Access:FONDOS &= NEW(Hide:Access:FONDOS)
  _Hide:Relate:FONDOS &= NEW(Hide:Relate:FONDOS)
  _Hide:Access:TIPO_COBERTURA &= NEW(Hide:Access:TIPO_COBERTURA)
  _Hide:Relate:TIPO_COBERTURA &= NEW(Hide:Relate:TIPO_COBERTURA)
  _Hide:Access:SQL &= NEW(Hide:Access:SQL)
  _Hide:Relate:SQL &= NEW(Hide:Relate:SQL)
  _Hide:Access:PAGO_CONVENIO &= NEW(Hide:Access:PAGO_CONVENIO)
  _Hide:Relate:PAGO_CONVENIO &= NEW(Hide:Relate:PAGO_CONVENIO)
  _Hide:Access:CONSULTRIO_ADHERENTE &= NEW(Hide:Access:CONSULTRIO_ADHERENTE)
  _Hide:Relate:CONSULTRIO_ADHERENTE &= NEW(Hide:Relate:CONSULTRIO_ADHERENTE)
  _Hide:Access:AUDITORIA &= NEW(Hide:Access:AUDITORIA)
  _Hide:Relate:AUDITORIA &= NEW(Hide:Relate:AUDITORIA)
  _Hide:Access:CONTROL_LIQUIDACION &= NEW(Hide:Access:CONTROL_LIQUIDACION)
  _Hide:Relate:CONTROL_LIQUIDACION &= NEW(Hide:Relate:CONTROL_LIQUIDACION)
  _Hide:Access:EMAIL &= NEW(Hide:Access:EMAIL)
  _Hide:Relate:EMAIL &= NEW(Hide:Relate:EMAIL)
  Relate:CIRCULO &= _Hide:Relate:CIRCULO
  Relate:CUMPLE &= _Hide:Relate:CUMPLE
  Relate:FACTURA_CONVENIO &= _Hide:Relate:FACTURA_CONVENIO
  Relate:INFORME &= _Hide:Relate:INFORME
  Relate:CURSO_CUOTA &= _Hide:Relate:CURSO_CUOTA
  Relate:EXP_CURSO_INSCRIPCION &= _Hide:Relate:EXP_CURSO_INSCRIPCION
  Relate:LIQUIDACION_CODIGO &= _Hide:Relate:LIQUIDACION_CODIGO
  Relate:PAGOS_LIQUIDACION &= _Hide:Relate:PAGOS_LIQUIDACION
  Relate:EMAILS &= _Hide:Relate:EMAILS
  Relate:BANCO_DEBITO &= _Hide:Relate:BANCO_DEBITO
  Relate:MCENTRO_SALUD &= _Hide:Relate:MCENTRO_SALUD
  Relate:CONF_EMP &= _Hide:Relate:CONF_EMP
  Relate:FONDOS &= _Hide:Relate:FONDOS
  Relate:TIPO_COBERTURA &= _Hide:Relate:TIPO_COBERTURA
  Relate:SQL &= _Hide:Relate:SQL
  Relate:PAGO_CONVENIO &= _Hide:Relate:PAGO_CONVENIO
  Relate:CONSULTRIO_ADHERENTE &= _Hide:Relate:CONSULTRIO_ADHERENTE
  Relate:AUDITORIA &= _Hide:Relate:AUDITORIA
  Relate:CONTROL_LIQUIDACION &= _Hide:Relate:CONTROL_LIQUIDACION
  Relate:EMAIL &= _Hide:Relate:EMAIL


Gestion_BC0:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:CIRCULO.Init
  _Hide:Relate:CUMPLE.Init
  _Hide:Relate:FACTURA_CONVENIO.Init
  _Hide:Relate:INFORME.Init
  _Hide:Relate:CURSO_CUOTA.Init
  _Hide:Relate:EXP_CURSO_INSCRIPCION.Init
  _Hide:Relate:LIQUIDACION_CODIGO.Init
  _Hide:Relate:PAGOS_LIQUIDACION.Init
  _Hide:Relate:EMAILS.Init
  _Hide:Relate:BANCO_DEBITO.Init
  _Hide:Relate:MCENTRO_SALUD.Init
  _Hide:Relate:CONF_EMP.Init
  _Hide:Relate:FONDOS.Init
  _Hide:Relate:TIPO_COBERTURA.Init
  _Hide:Relate:SQL.Init
  _Hide:Relate:PAGO_CONVENIO.Init
  _Hide:Relate:CONSULTRIO_ADHERENTE.Init
  _Hide:Relate:AUDITORIA.Init
  _Hide:Relate:CONTROL_LIQUIDACION.Init
  _Hide:Relate:EMAIL.Init


Gestion_BC0:DctKill PROCEDURE()
  CODE
  _Hide:Relate:CIRCULO.Kill
  DISPOSE(_Hide:Relate:CIRCULO)
  _Hide:Relate:CUMPLE.Kill
  DISPOSE(_Hide:Relate:CUMPLE)
  _Hide:Relate:FACTURA_CONVENIO.Kill
  DISPOSE(_Hide:Relate:FACTURA_CONVENIO)
  _Hide:Relate:INFORME.Kill
  DISPOSE(_Hide:Relate:INFORME)
  _Hide:Relate:CURSO_CUOTA.Kill
  DISPOSE(_Hide:Relate:CURSO_CUOTA)
  _Hide:Relate:EXP_CURSO_INSCRIPCION.Kill
  DISPOSE(_Hide:Relate:EXP_CURSO_INSCRIPCION)
  _Hide:Relate:LIQUIDACION_CODIGO.Kill
  DISPOSE(_Hide:Relate:LIQUIDACION_CODIGO)
  _Hide:Relate:PAGOS_LIQUIDACION.Kill
  DISPOSE(_Hide:Relate:PAGOS_LIQUIDACION)
  _Hide:Relate:EMAILS.Kill
  DISPOSE(_Hide:Relate:EMAILS)
  _Hide:Relate:BANCO_DEBITO.Kill
  DISPOSE(_Hide:Relate:BANCO_DEBITO)
  _Hide:Relate:MCENTRO_SALUD.Kill
  DISPOSE(_Hide:Relate:MCENTRO_SALUD)
  _Hide:Relate:CONF_EMP.Kill
  DISPOSE(_Hide:Relate:CONF_EMP)
  _Hide:Relate:FONDOS.Kill
  DISPOSE(_Hide:Relate:FONDOS)
  _Hide:Relate:TIPO_COBERTURA.Kill
  DISPOSE(_Hide:Relate:TIPO_COBERTURA)
  _Hide:Relate:SQL.Kill
  DISPOSE(_Hide:Relate:SQL)
  _Hide:Relate:PAGO_CONVENIO.Kill
  DISPOSE(_Hide:Relate:PAGO_CONVENIO)
  _Hide:Relate:CONSULTRIO_ADHERENTE.Kill
  DISPOSE(_Hide:Relate:CONSULTRIO_ADHERENTE)
  _Hide:Relate:AUDITORIA.Kill
  DISPOSE(_Hide:Relate:AUDITORIA)
  _Hide:Relate:CONTROL_LIQUIDACION.Kill
  DISPOSE(_Hide:Relate:CONTROL_LIQUIDACION)
  _Hide:Relate:EMAIL.Kill
  DISPOSE(_Hide:Relate:EMAIL)


Hide:Relate:CIRCULO.Init PROCEDURE()
  CODE
  _Hide:Access:CIRCULO.Init
  SELF.Init(Access:CIRCULO,1)


Hide:Access:CIRCULO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CIRCULO')
      DbChangeTrigger.AddThread('CIRCULO')
      DbChangeTrigger.AddItem(CIR:IDCIRCULO, WHO(CIR:RECORD,WHERE(CIR:RECORD,CIR:IDCIRCULO)) , 'CIRCULO')
      DbChangeTrigger.AddItem(CIR:DESCRIPCION, WHO(CIR:RECORD,WHERE(CIR:RECORD,CIR:DESCRIPCION)) , 'CIRCULO')
      DbChangeTrigger.AddItem(CIR:NOMBRE_CORTO, WHO(CIR:RECORD,WHERE(CIR:RECORD,CIR:NOMBRE_CORTO)) , 'CIRCULO')
   END
   DbChangeTrigger.Update('CIRCULO')
  RETURN ReturnValue


Hide:Access:CIRCULO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CIR:Record
  SELF.FileNameValue = 'CIRCULO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CIRCULO
  PARENT.Init
  Access:CIRCULO &= SELF


Hide:Access:CIRCULO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CIRCULO',CIRCULO)
  RETURN ReturnValue


Hide:Access:CIRCULO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CIRCULO &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CIRCULO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CIRCULO')
      DbChangeTrigger.AddThread('CIRCULO')
      DbChangeTrigger.AddItem(CIR:IDCIRCULO, WHO(CIR:RECORD,WHERE(CIR:RECORD,CIR:IDCIRCULO)) , 'CIRCULO')
      DbChangeTrigger.AddItem(CIR:DESCRIPCION, WHO(CIR:RECORD,WHERE(CIR:RECORD,CIR:DESCRIPCION)) , 'CIRCULO')
      DbChangeTrigger.AddItem(CIR:NOMBRE_CORTO, WHO(CIR:RECORD,WHERE(CIR:RECORD,CIR:NOMBRE_CORTO)) , 'CIRCULO')
   END
   DbChangeTrigger.Update('CIRCULO')
  RETURN ReturnValue


Hide:Access:CIRCULO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CIRCULO')
      DbChangeTrigger.AddThread('CIRCULO')
      DbChangeTrigger.AddItem(CIR:IDCIRCULO, WHO(CIR:RECORD,WHERE(CIR:RECORD,CIR:IDCIRCULO)) , 'CIRCULO')
      DbChangeTrigger.AddItem(CIR:DESCRIPCION, WHO(CIR:RECORD,WHERE(CIR:RECORD,CIR:DESCRIPCION)) , 'CIRCULO')
      DbChangeTrigger.AddItem(CIR:NOMBRE_CORTO, WHO(CIR:RECORD,WHERE(CIR:RECORD,CIR:NOMBRE_CORTO)) , 'CIRCULO')
   END
   DbChangeTrigger.Update('CIRCULO')
  RETURN ReturnValue


Hide:Access:CIRCULO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CIRCULO')
       DbChangeTrigger.CheckChanges('CIRCULO',CIRCULO) 
    END
  RETURN ReturnValue


Hide:Access:CIRCULO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CIRCULO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CIR:PK_CIRCULO,'CIR:PK_CIRCULO',0)
    SELF.AddKey(CIR:IDX_CIRCULO,'CIR:IDX_CIRCULO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CIRCULO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:PAGOSXCIRCULO,RI:None,RI:None,PAG1:FK_PAGOSXCIRCULO_CIRCULO)
  SELF.AddRelationLink(CIR:IDCIRCULO,PAG1:IDCIRCULO)

  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_CIRCULO)
  SELF.AddRelationLink(CIR:IDCIRCULO,SOC:IDCIRCULO)


Hide:Relate:CIRCULO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CIRCULO',CIRCULO)
  RETURN ReturnValue


Hide:Relate:CIRCULO.Kill PROCEDURE

  CODE
  _Hide:Access:CIRCULO.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:CIRCULO &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CIRCULO)                            ! destroy the file manager


Hide:Relate:CIRCULO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CIRCULO')
       DbChangeTrigger.AddThread('CIRCULO')
       DbChangeTrigger.AddItem(CIR:IDCIRCULO, WHO(CIR:RECORD,WHERE(CIR:RECORD,CIR:IDCIRCULO)) , 'CIRCULO')
       DbChangeTrigger.AddItem(CIR:DESCRIPCION, WHO(CIR:RECORD,WHERE(CIR:RECORD,CIR:DESCRIPCION)) , 'CIRCULO')
       DbChangeTrigger.AddItem(CIR:NOMBRE_CORTO, WHO(CIR:RECORD,WHERE(CIR:RECORD,CIR:NOMBRE_CORTO)) , 'CIRCULO')
    END
    DbChangeTrigger.Update('CIRCULO')


Hide:Relate:CIRCULO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CIRCULO')
        DbChangeTrigger.CheckChanges('CIRCULO',CIRCULO) 
     END
  RETURN ReturnValue


Hide:Relate:CUMPLE.Init PROCEDURE()
  CODE
  _Hide:Access:CUMPLE.Init
  SELF.Init(Access:CUMPLE,1)


Hide:Access:CUMPLE.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CUMPLE')
      DbChangeTrigger.AddThread('CUMPLE')
      DbChangeTrigger.AddItem(CUM:IDSOCIO, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:IDSOCIO)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:NOMBRE, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:NOMBRE)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:EMAIL, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:EMAIL)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:FECHA_NAC, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:FECHA_NAC)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:DIA, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:DIA)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:ANO, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:ANO)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:MENSAGE, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:MENSAGE)) , 'CUMPLE')
   END
   DbChangeTrigger.Update('CUMPLE')
  RETURN ReturnValue


Hide:Access:CUMPLE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CUM:Record
  SELF.FileNameValue = 'CUMPLE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CUMPLE
  PARENT.Init
  Access:CUMPLE &= SELF


Hide:Access:CUMPLE.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CUMPLE',CUMPLE)
  RETURN ReturnValue


Hide:Access:CUMPLE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CUMPLE &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CUMPLE.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CUMPLE')
      DbChangeTrigger.AddThread('CUMPLE')
      DbChangeTrigger.AddItem(CUM:IDSOCIO, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:IDSOCIO)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:NOMBRE, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:NOMBRE)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:EMAIL, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:EMAIL)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:FECHA_NAC, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:FECHA_NAC)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:DIA, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:DIA)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:ANO, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:ANO)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:MENSAGE, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:MENSAGE)) , 'CUMPLE')
   END
   DbChangeTrigger.Update('CUMPLE')
  RETURN ReturnValue


Hide:Access:CUMPLE.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CUMPLE')
      DbChangeTrigger.AddThread('CUMPLE')
      DbChangeTrigger.AddItem(CUM:IDSOCIO, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:IDSOCIO)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:NOMBRE, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:NOMBRE)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:EMAIL, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:EMAIL)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:FECHA_NAC, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:FECHA_NAC)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:DIA, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:DIA)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:ANO, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:ANO)) , 'CUMPLE')
      DbChangeTrigger.AddItem(CUM:MENSAGE, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:MENSAGE)) , 'CUMPLE')
   END
   DbChangeTrigger.Update('CUMPLE')
  RETURN ReturnValue


Hide:Access:CUMPLE.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CUMPLE')
       DbChangeTrigger.CheckChanges('CUMPLE',CUMPLE) 
    END
  RETURN ReturnValue


Hide:Access:CUMPLE.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CUMPLE,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CUM:PK_CUMPLE,'CUM:PK_CUMPLE',0)
    SELF.AddKey(CUM:por_dia,'CUM:por_dia',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CUMPLE.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CUMPLE',CUMPLE)
  RETURN ReturnValue


Hide:Relate:CUMPLE.Kill PROCEDURE

  CODE
  _Hide:Access:CUMPLE.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:CUMPLE &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CUMPLE)                             ! destroy the file manager


Hide:Relate:CUMPLE.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CUMPLE')
       DbChangeTrigger.AddThread('CUMPLE')
       DbChangeTrigger.AddItem(CUM:IDSOCIO, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:IDSOCIO)) , 'CUMPLE')
       DbChangeTrigger.AddItem(CUM:NOMBRE, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:NOMBRE)) , 'CUMPLE')
       DbChangeTrigger.AddItem(CUM:EMAIL, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:EMAIL)) , 'CUMPLE')
       DbChangeTrigger.AddItem(CUM:FECHA_NAC, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:FECHA_NAC)) , 'CUMPLE')
       DbChangeTrigger.AddItem(CUM:DIA, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:DIA)) , 'CUMPLE')
       DbChangeTrigger.AddItem(CUM:ANO, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:ANO)) , 'CUMPLE')
       DbChangeTrigger.AddItem(CUM:MENSAGE, WHO(CUM:RECORD,WHERE(CUM:RECORD,CUM:MENSAGE)) , 'CUMPLE')
    END
    DbChangeTrigger.Update('CUMPLE')


Hide:Relate:CUMPLE.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CUMPLE')
        DbChangeTrigger.CheckChanges('CUMPLE',CUMPLE) 
     END
  RETURN ReturnValue


Hide:Relate:FACTURA_CONVENIO.Init PROCEDURE()
  CODE
  _Hide:Access:FACTURA_CONVENIO.Init
  SELF.Init(Access:FACTURA_CONVENIO,1)


Hide:Access:FACTURA_CONVENIO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('FACTURA_CONVENIO')
      DbChangeTrigger.AddThread('FACTURA_CONVENIO')
      DbChangeTrigger.AddItem(FACXCONV:IDFACTURA, WHO(FACXCONV:RECORD,WHERE(FACXCONV:RECORD,FACXCONV:IDFACTURA)) , 'FACTURA_CONVENIO')
      DbChangeTrigger.AddItem(FACXCONV:IDCONVENIO, WHO(FACXCONV:RECORD,WHERE(FACXCONV:RECORD,FACXCONV:IDCONVENIO)) , 'FACTURA_CONVENIO')
   END
   DbChangeTrigger.Update('FACTURA_CONVENIO')
  RETURN ReturnValue


Hide:Access:FACTURA_CONVENIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FACXCONV:Record
  SELF.FileNameValue = 'FACTURA_CONVENIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= FACTURA_CONVENIO
  PARENT.Init
  Access:FACTURA_CONVENIO &= SELF


Hide:Access:FACTURA_CONVENIO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('FACTURA_CONVENIO',FACTURA_CONVENIO)
  RETURN ReturnValue


Hide:Access:FACTURA_CONVENIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:FACTURA_CONVENIO &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:FACTURA_CONVENIO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('FACTURA_CONVENIO')
      DbChangeTrigger.AddThread('FACTURA_CONVENIO')
      DbChangeTrigger.AddItem(FACXCONV:IDFACTURA, WHO(FACXCONV:RECORD,WHERE(FACXCONV:RECORD,FACXCONV:IDFACTURA)) , 'FACTURA_CONVENIO')
      DbChangeTrigger.AddItem(FACXCONV:IDCONVENIO, WHO(FACXCONV:RECORD,WHERE(FACXCONV:RECORD,FACXCONV:IDCONVENIO)) , 'FACTURA_CONVENIO')
   END
   DbChangeTrigger.Update('FACTURA_CONVENIO')
  RETURN ReturnValue


Hide:Access:FACTURA_CONVENIO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('FACTURA_CONVENIO')
      DbChangeTrigger.AddThread('FACTURA_CONVENIO')
      DbChangeTrigger.AddItem(FACXCONV:IDFACTURA, WHO(FACXCONV:RECORD,WHERE(FACXCONV:RECORD,FACXCONV:IDFACTURA)) , 'FACTURA_CONVENIO')
      DbChangeTrigger.AddItem(FACXCONV:IDCONVENIO, WHO(FACXCONV:RECORD,WHERE(FACXCONV:RECORD,FACXCONV:IDCONVENIO)) , 'FACTURA_CONVENIO')
   END
   DbChangeTrigger.Update('FACTURA_CONVENIO')
  RETURN ReturnValue


Hide:Access:FACTURA_CONVENIO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('FACTURA_CONVENIO')
       DbChangeTrigger.CheckChanges('FACTURA_CONVENIO',FACTURA_CONVENIO) 
    END
  RETURN ReturnValue


Hide:Access:FACTURA_CONVENIO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(FACTURA_CONVENIO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(FACXCONV:PK_FACTURA_CONVENIO,'FACXCONV:PK_FACTURA_CONVENIO',0)
    SELF.AddKey(FACXCONV:FK_FACTURA_CONVENIO_FACTURA,'FACXCONV:FK_FACTURA_CONVENIO_FACTURA',0)
    SELF.AddKey(FACXCONV:FACTURA_CONVENIO_CONVENIO,'FACXCONV:FACTURA_CONVENIO_CONVENIO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:FACTURA_CONVENIO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:FACTURA)

  SELF.AddRelation(Relate:CONVENIO)


Hide:Relate:FACTURA_CONVENIO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('FACTURA_CONVENIO',FACTURA_CONVENIO)
  RETURN ReturnValue


Hide:Relate:FACTURA_CONVENIO.Kill PROCEDURE

  CODE
  _Hide:Access:FACTURA_CONVENIO.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:FACTURA_CONVENIO &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:FACTURA_CONVENIO)                   ! destroy the file manager


Hide:Relate:FACTURA_CONVENIO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('FACTURA_CONVENIO')
       DbChangeTrigger.AddThread('FACTURA_CONVENIO')
       DbChangeTrigger.AddItem(FACXCONV:IDFACTURA, WHO(FACXCONV:RECORD,WHERE(FACXCONV:RECORD,FACXCONV:IDFACTURA)) , 'FACTURA_CONVENIO')
       DbChangeTrigger.AddItem(FACXCONV:IDCONVENIO, WHO(FACXCONV:RECORD,WHERE(FACXCONV:RECORD,FACXCONV:IDCONVENIO)) , 'FACTURA_CONVENIO')
    END
    DbChangeTrigger.Update('FACTURA_CONVENIO')


Hide:Relate:FACTURA_CONVENIO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('FACTURA_CONVENIO')
        DbChangeTrigger.CheckChanges('FACTURA_CONVENIO',FACTURA_CONVENIO) 
     END
  RETURN ReturnValue


Hide:Relate:INFORME.Init PROCEDURE()
  CODE
  _Hide:Access:INFORME.Init
  SELF.Init(Access:INFORME,1)


Hide:Access:INFORME.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('INFORME')
      DbChangeTrigger.AddThread('INFORME')
      DbChangeTrigger.AddItem(INF:IDINFORME, WHO(INF:RECORD,WHERE(INF:RECORD,INF:IDINFORME)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:FECHA, WHO(INF:RECORD,WHERE(INF:RECORD,INF:FECHA)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:HORA, WHO(INF:RECORD,WHERE(INF:RECORD,INF:HORA)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:INFORME, WHO(INF:RECORD,WHERE(INF:RECORD,INF:INFORME)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:IDUSUARIO, WHO(INF:RECORD,WHERE(INF:RECORD,INF:IDUSUARIO)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:TERMINADO, WHO(INF:RECORD,WHERE(INF:RECORD,INF:TERMINADO)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:MONTO, WHO(INF:RECORD,WHERE(INF:RECORD,INF:MONTO)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:SUCURSAL, WHO(INF:RECORD,WHERE(INF:RECORD,INF:SUCURSAL)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:IDRECIBO, WHO(INF:RECORD,WHERE(INF:RECORD,INF:IDRECIBO)) , 'INFORME')
   END
   DbChangeTrigger.Update('INFORME')
  RETURN ReturnValue


Hide:Access:INFORME.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= INF:Record
  SELF.FileNameValue = 'INFORME'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= INFORME
  PARENT.Init
  Access:INFORME &= SELF


Hide:Access:INFORME.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('INFORME',INFORME)
  RETURN ReturnValue


Hide:Access:INFORME.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:INFORME &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:INFORME.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('INFORME')
      DbChangeTrigger.AddThread('INFORME')
      DbChangeTrigger.AddItem(INF:IDINFORME, WHO(INF:RECORD,WHERE(INF:RECORD,INF:IDINFORME)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:FECHA, WHO(INF:RECORD,WHERE(INF:RECORD,INF:FECHA)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:HORA, WHO(INF:RECORD,WHERE(INF:RECORD,INF:HORA)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:INFORME, WHO(INF:RECORD,WHERE(INF:RECORD,INF:INFORME)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:IDUSUARIO, WHO(INF:RECORD,WHERE(INF:RECORD,INF:IDUSUARIO)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:TERMINADO, WHO(INF:RECORD,WHERE(INF:RECORD,INF:TERMINADO)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:MONTO, WHO(INF:RECORD,WHERE(INF:RECORD,INF:MONTO)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:SUCURSAL, WHO(INF:RECORD,WHERE(INF:RECORD,INF:SUCURSAL)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:IDRECIBO, WHO(INF:RECORD,WHERE(INF:RECORD,INF:IDRECIBO)) , 'INFORME')
   END
   DbChangeTrigger.Update('INFORME')
  RETURN ReturnValue


Hide:Access:INFORME.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('INFORME')
      DbChangeTrigger.AddThread('INFORME')
      DbChangeTrigger.AddItem(INF:IDINFORME, WHO(INF:RECORD,WHERE(INF:RECORD,INF:IDINFORME)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:FECHA, WHO(INF:RECORD,WHERE(INF:RECORD,INF:FECHA)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:HORA, WHO(INF:RECORD,WHERE(INF:RECORD,INF:HORA)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:INFORME, WHO(INF:RECORD,WHERE(INF:RECORD,INF:INFORME)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:IDUSUARIO, WHO(INF:RECORD,WHERE(INF:RECORD,INF:IDUSUARIO)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:TERMINADO, WHO(INF:RECORD,WHERE(INF:RECORD,INF:TERMINADO)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:MONTO, WHO(INF:RECORD,WHERE(INF:RECORD,INF:MONTO)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:SUCURSAL, WHO(INF:RECORD,WHERE(INF:RECORD,INF:SUCURSAL)) , 'INFORME')
      DbChangeTrigger.AddItem(INF:IDRECIBO, WHO(INF:RECORD,WHERE(INF:RECORD,INF:IDRECIBO)) , 'INFORME')
   END
   DbChangeTrigger.Update('INFORME')
  RETURN ReturnValue


Hide:Access:INFORME.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('INFORME')
       DbChangeTrigger.CheckChanges('INFORME',INFORME) 
    END
  RETURN ReturnValue


Hide:Access:INFORME.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(INFORME,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(INF:INFORME_IDX_FECHA,'INF:INFORME_IDX_FECHA',0)
    SELF.AddKey(INF:FK_INFORME_USUARIO,'INF:FK_INFORME_USUARIO',0)
    SELF.AddKey(INF:PK_INFORME,'INF:PK_INFORME',0)
    SELF.AddKey(INF:IDX_INFORME_RECIBO,'INF:IDX_INFORME_RECIBO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:INFORME.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:USUARIO)


Hide:Relate:INFORME.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('INFORME',INFORME)
  RETURN ReturnValue


Hide:Relate:INFORME.Kill PROCEDURE

  CODE
  _Hide:Access:INFORME.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:INFORME &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:INFORME)                            ! destroy the file manager


Hide:Relate:INFORME.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('INFORME')
       DbChangeTrigger.AddThread('INFORME')
       DbChangeTrigger.AddItem(INF:IDINFORME, WHO(INF:RECORD,WHERE(INF:RECORD,INF:IDINFORME)) , 'INFORME')
       DbChangeTrigger.AddItem(INF:FECHA, WHO(INF:RECORD,WHERE(INF:RECORD,INF:FECHA)) , 'INFORME')
       DbChangeTrigger.AddItem(INF:HORA, WHO(INF:RECORD,WHERE(INF:RECORD,INF:HORA)) , 'INFORME')
       DbChangeTrigger.AddItem(INF:INFORME, WHO(INF:RECORD,WHERE(INF:RECORD,INF:INFORME)) , 'INFORME')
       DbChangeTrigger.AddItem(INF:IDUSUARIO, WHO(INF:RECORD,WHERE(INF:RECORD,INF:IDUSUARIO)) , 'INFORME')
       DbChangeTrigger.AddItem(INF:TERMINADO, WHO(INF:RECORD,WHERE(INF:RECORD,INF:TERMINADO)) , 'INFORME')
       DbChangeTrigger.AddItem(INF:MONTO, WHO(INF:RECORD,WHERE(INF:RECORD,INF:MONTO)) , 'INFORME')
       DbChangeTrigger.AddItem(INF:SUCURSAL, WHO(INF:RECORD,WHERE(INF:RECORD,INF:SUCURSAL)) , 'INFORME')
       DbChangeTrigger.AddItem(INF:IDRECIBO, WHO(INF:RECORD,WHERE(INF:RECORD,INF:IDRECIBO)) , 'INFORME')
    END
    DbChangeTrigger.Update('INFORME')


Hide:Relate:INFORME.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('INFORME')
        DbChangeTrigger.CheckChanges('INFORME',INFORME) 
     END
  RETURN ReturnValue


Hide:Relate:CURSO_CUOTA.Init PROCEDURE()
  CODE
  _Hide:Access:CURSO_CUOTA.Init
  SELF.Init(Access:CURSO_CUOTA,1)


Hide:Access:CURSO_CUOTA.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CURSO_CUOTA')
      DbChangeTrigger.AddThread('CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDINSCRIPCION, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDINSCRIPCION)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDCURSO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDCURSO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDMODULO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDMODULO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDCUOTA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDCUOTA)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:MONTO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:MONTO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:PAGADO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:PAGADO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDSUBCUENTA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDSUBCUENTA)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:DESCUENTO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:DESCUENTO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:SUCURSAL, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:SUCURSAL)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDRECIBO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDRECIBO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDUSUARIO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDUSUARIO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:FECHA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:FECHA)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:HORA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:HORA)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:AFECTADA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:AFECTADA)) , 'CURSO_CUOTA')
   END
   DbChangeTrigger.Update('CURSO_CUOTA')
  RETURN ReturnValue


Hide:Access:CURSO_CUOTA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CUR1:Record
  SELF.FileNameValue = 'CURSO_CUOTA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CURSO_CUOTA
  PARENT.Init
  Access:CURSO_CUOTA &= SELF


Hide:Access:CURSO_CUOTA.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CURSO_CUOTA',CURSO_CUOTA)
  RETURN ReturnValue


Hide:Access:CURSO_CUOTA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CURSO_CUOTA &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CURSO_CUOTA.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CURSO_CUOTA')
      DbChangeTrigger.AddThread('CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDINSCRIPCION, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDINSCRIPCION)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDCURSO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDCURSO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDMODULO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDMODULO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDCUOTA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDCUOTA)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:MONTO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:MONTO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:PAGADO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:PAGADO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDSUBCUENTA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDSUBCUENTA)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:DESCUENTO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:DESCUENTO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:SUCURSAL, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:SUCURSAL)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDRECIBO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDRECIBO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDUSUARIO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDUSUARIO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:FECHA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:FECHA)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:HORA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:HORA)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:AFECTADA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:AFECTADA)) , 'CURSO_CUOTA')
   END
   DbChangeTrigger.Update('CURSO_CUOTA')
  RETURN ReturnValue


Hide:Access:CURSO_CUOTA.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CURSO_CUOTA')
      DbChangeTrigger.AddThread('CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDINSCRIPCION, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDINSCRIPCION)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDCURSO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDCURSO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDMODULO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDMODULO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDCUOTA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDCUOTA)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:MONTO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:MONTO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:PAGADO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:PAGADO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDSUBCUENTA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDSUBCUENTA)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:DESCUENTO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:DESCUENTO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:SUCURSAL, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:SUCURSAL)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDRECIBO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDRECIBO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:IDUSUARIO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDUSUARIO)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:FECHA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:FECHA)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:HORA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:HORA)) , 'CURSO_CUOTA')
      DbChangeTrigger.AddItem(CUR1:AFECTADA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:AFECTADA)) , 'CURSO_CUOTA')
   END
   DbChangeTrigger.Update('CURSO_CUOTA')
  RETURN ReturnValue


Hide:Access:CURSO_CUOTA.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CURSO_CUOTA')
       DbChangeTrigger.CheckChanges('CURSO_CUOTA',CURSO_CUOTA) 
    END
  RETURN ReturnValue


Hide:Access:CURSO_CUOTA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CURSO_CUOTA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CUR1:CURSO_CUOTA_IDX_PAGADO,'CUR1:CURSO_CUOTA_IDX_PAGADO',0)
    SELF.AddKey(CUR1:CURSO_CUOTA_IDX_SUBCUENTA,'CUR1:CURSO_CUOTA_IDX_SUBCUENTA',0)
    SELF.AddKey(CUR1:PK_CURSO_CUOTA,'CUR1:PK_CURSO_CUOTA',0)
    SELF.AddKey(CUR1:FK_CURSO_CUOTA_DETALLE,'CUR1:FK_CURSO_CUOTA_DETALLE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CURSO_CUOTA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CURSO_INSCRIPCION_DETALLE)


Hide:Relate:CURSO_CUOTA.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CURSO_CUOTA',CURSO_CUOTA)
  RETURN ReturnValue


Hide:Relate:CURSO_CUOTA.Kill PROCEDURE

  CODE
  _Hide:Access:CURSO_CUOTA.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:CURSO_CUOTA &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CURSO_CUOTA)                        ! destroy the file manager


Hide:Relate:CURSO_CUOTA.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CURSO_CUOTA')
       DbChangeTrigger.AddThread('CURSO_CUOTA')
       DbChangeTrigger.AddItem(CUR1:IDINSCRIPCION, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDINSCRIPCION)) , 'CURSO_CUOTA')
       DbChangeTrigger.AddItem(CUR1:IDCURSO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDCURSO)) , 'CURSO_CUOTA')
       DbChangeTrigger.AddItem(CUR1:IDMODULO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDMODULO)) , 'CURSO_CUOTA')
       DbChangeTrigger.AddItem(CUR1:IDCUOTA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDCUOTA)) , 'CURSO_CUOTA')
       DbChangeTrigger.AddItem(CUR1:MONTO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:MONTO)) , 'CURSO_CUOTA')
       DbChangeTrigger.AddItem(CUR1:PAGADO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:PAGADO)) , 'CURSO_CUOTA')
       DbChangeTrigger.AddItem(CUR1:IDSUBCUENTA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDSUBCUENTA)) , 'CURSO_CUOTA')
       DbChangeTrigger.AddItem(CUR1:DESCUENTO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:DESCUENTO)) , 'CURSO_CUOTA')
       DbChangeTrigger.AddItem(CUR1:SUCURSAL, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:SUCURSAL)) , 'CURSO_CUOTA')
       DbChangeTrigger.AddItem(CUR1:IDRECIBO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDRECIBO)) , 'CURSO_CUOTA')
       DbChangeTrigger.AddItem(CUR1:IDUSUARIO, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:IDUSUARIO)) , 'CURSO_CUOTA')
       DbChangeTrigger.AddItem(CUR1:FECHA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:FECHA)) , 'CURSO_CUOTA')
       DbChangeTrigger.AddItem(CUR1:HORA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:HORA)) , 'CURSO_CUOTA')
       DbChangeTrigger.AddItem(CUR1:AFECTADA, WHO(CUR1:RECORD,WHERE(CUR1:RECORD,CUR1:AFECTADA)) , 'CURSO_CUOTA')
    END
    DbChangeTrigger.Update('CURSO_CUOTA')


Hide:Relate:CURSO_CUOTA.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CURSO_CUOTA')
        DbChangeTrigger.CheckChanges('CURSO_CUOTA',CURSO_CUOTA) 
     END
  RETURN ReturnValue


Hide:Relate:EXP_CURSO_INSCRIPCION.Init PROCEDURE()
  CODE
  _Hide:Access:EXP_CURSO_INSCRIPCION.Init
  SELF.Init(Access:EXP_CURSO_INSCRIPCION,1)


Hide:Access:EXP_CURSO_INSCRIPCION.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddThread('EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:IDINSCRIPCION, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:IDINSCRIPCION)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:ID_PROVEEDOR, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:ID_PROVEEDOR)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:IDCURSO, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:IDCURSO)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:FECHA, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:FECHA)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:HORA, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:HORA)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:IDUSUARIO, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:IDUSUARIO)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:MONTO_TOTAL, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:MONTO_TOTAL)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:TERMINADO, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:TERMINADO)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:DESCUENTO, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:DESCUENTO)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:PAGADO_TOTAL, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:PAGADO_TOTAL)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:CUOTAS, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:CUOTAS)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:MONTO_CUOTA, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:MONTO_CUOTA)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:OBSERVACION, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:OBSERVACION)) , 'EXP_CURSO_INSCRIPCION')
   END
   DbChangeTrigger.Update('EXP_CURSO_INSCRIPCION')
  RETURN ReturnValue


Hide:Access:EXP_CURSO_INSCRIPCION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CURI1:Record
  SELF.FileNameValue = 'EXP_CURSO_INSCRIPCION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= EXP_CURSO_INSCRIPCION
  PARENT.Init
  Access:EXP_CURSO_INSCRIPCION &= SELF


Hide:Access:EXP_CURSO_INSCRIPCION.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('EXP_CURSO_INSCRIPCION',EXP_CURSO_INSCRIPCION)
  RETURN ReturnValue


Hide:Access:EXP_CURSO_INSCRIPCION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:EXP_CURSO_INSCRIPCION &= NULL                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:EXP_CURSO_INSCRIPCION.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddThread('EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:IDINSCRIPCION, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:IDINSCRIPCION)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:ID_PROVEEDOR, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:ID_PROVEEDOR)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:IDCURSO, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:IDCURSO)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:FECHA, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:FECHA)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:HORA, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:HORA)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:IDUSUARIO, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:IDUSUARIO)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:MONTO_TOTAL, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:MONTO_TOTAL)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:TERMINADO, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:TERMINADO)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:DESCUENTO, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:DESCUENTO)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:PAGADO_TOTAL, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:PAGADO_TOTAL)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:CUOTAS, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:CUOTAS)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:MONTO_CUOTA, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:MONTO_CUOTA)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:OBSERVACION, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:OBSERVACION)) , 'EXP_CURSO_INSCRIPCION')
   END
   DbChangeTrigger.Update('EXP_CURSO_INSCRIPCION')
  RETURN ReturnValue


Hide:Access:EXP_CURSO_INSCRIPCION.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddThread('EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:IDINSCRIPCION, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:IDINSCRIPCION)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:ID_PROVEEDOR, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:ID_PROVEEDOR)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:IDCURSO, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:IDCURSO)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:FECHA, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:FECHA)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:HORA, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:HORA)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:IDUSUARIO, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:IDUSUARIO)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:MONTO_TOTAL, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:MONTO_TOTAL)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:TERMINADO, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:TERMINADO)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:DESCUENTO, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:DESCUENTO)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:PAGADO_TOTAL, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:PAGADO_TOTAL)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:CUOTAS, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:CUOTAS)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:MONTO_CUOTA, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:MONTO_CUOTA)) , 'EXP_CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI1:OBSERVACION, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:OBSERVACION)) , 'EXP_CURSO_INSCRIPCION')
   END
   DbChangeTrigger.Update('EXP_CURSO_INSCRIPCION')
  RETURN ReturnValue


Hide:Access:EXP_CURSO_INSCRIPCION.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('EXP_CURSO_INSCRIPCION')
       DbChangeTrigger.CheckChanges('EXP_CURSO_INSCRIPCION',EXP_CURSO_INSCRIPCION) 
    END
  RETURN ReturnValue


Hide:Access:EXP_CURSO_INSCRIPCION.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(EXP_CURSO_INSCRIPCION,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(CURI1:PK_CURSO_INSCRIPCION,'CURI1:PK_CURSO_INSCRIPCION',0)
    SELF.AddKey(CURI1:FK_CURSO_INSCRIPCION_CURSO,'CURI1:FK_CURSO_INSCRIPCION_CURSO',0)
    SELF.AddKey(CURI1:FK_CURSO_INSCRIPCION_PROVEEDOR,'CURI1:FK_CURSO_INSCRIPCION_PROVEEDOR',0)
    SELF.AddKey(CURI1:FK_CURSO_INSCRIPCION_USUARIO,'CURI1:FK_CURSO_INSCRIPCION_USUARIO',0)
    SELF.AddKey(CURI1:IDX_CURSO_INSCRIPCION_FECHA,'CURI1:IDX_CURSO_INSCRIPCION_FECHA',0)
    SELF.AddKey(CURI1:IDX_CONTROL,'CURI1:IDX_CONTROL',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:EXP_CURSO_INSCRIPCION.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('EXP_CURSO_INSCRIPCION',EXP_CURSO_INSCRIPCION)
  RETURN ReturnValue


Hide:Relate:EXP_CURSO_INSCRIPCION.Kill PROCEDURE

  CODE
  _Hide:Access:EXP_CURSO_INSCRIPCION.Kill                  ! Kill the file manager
  PARENT.Kill
  Relate:EXP_CURSO_INSCRIPCION &= NULL                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:EXP_CURSO_INSCRIPCION)              ! destroy the file manager


Hide:Relate:EXP_CURSO_INSCRIPCION.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('EXP_CURSO_INSCRIPCION')
       DbChangeTrigger.AddThread('EXP_CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI1:IDINSCRIPCION, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:IDINSCRIPCION)) , 'EXP_CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI1:ID_PROVEEDOR, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:ID_PROVEEDOR)) , 'EXP_CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI1:IDCURSO, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:IDCURSO)) , 'EXP_CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI1:FECHA, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:FECHA)) , 'EXP_CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI1:HORA, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:HORA)) , 'EXP_CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI1:IDUSUARIO, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:IDUSUARIO)) , 'EXP_CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI1:MONTO_TOTAL, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:MONTO_TOTAL)) , 'EXP_CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI1:TERMINADO, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:TERMINADO)) , 'EXP_CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI1:DESCUENTO, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:DESCUENTO)) , 'EXP_CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI1:PAGADO_TOTAL, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:PAGADO_TOTAL)) , 'EXP_CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI1:CUOTAS, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:CUOTAS)) , 'EXP_CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI1:MONTO_CUOTA, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:MONTO_CUOTA)) , 'EXP_CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI1:OBSERVACION, WHO(CURI1:RECORD,WHERE(CURI1:RECORD,CURI1:OBSERVACION)) , 'EXP_CURSO_INSCRIPCION')
    END
    DbChangeTrigger.Update('EXP_CURSO_INSCRIPCION')


Hide:Relate:EXP_CURSO_INSCRIPCION.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('EXP_CURSO_INSCRIPCION')
        DbChangeTrigger.CheckChanges('EXP_CURSO_INSCRIPCION',EXP_CURSO_INSCRIPCION) 
     END
  RETURN ReturnValue


Hide:Relate:LIQUIDACION_CODIGO.Init PROCEDURE()
  CODE
  _Hide:Access:LIQUIDACION_CODIGO.Init
  SELF.Init(Access:LIQUIDACION_CODIGO,1)


Hide:Access:LIQUIDACION_CODIGO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('LIQUIDACION_CODIGO')
      DbChangeTrigger.AddThread('LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:IDLIQUIDACION, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:IDLIQUIDACION)) , 'LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:IDNOMENCLADOR, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:IDNOMENCLADOR)) , 'LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:IDOS, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:IDOS)) , 'LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:VALOR, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:VALOR)) , 'LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:CANTIDAD, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:CANTIDAD)) , 'LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:TOTAL, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:TOTAL)) , 'LIQUIDACION_CODIGO')
   END
   DbChangeTrigger.Update('LIQUIDACION_CODIGO')
  RETURN ReturnValue


Hide:Access:LIQUIDACION_CODIGO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LIQC:Record
  SELF.FileNameValue = 'LIQUIDACION_CODIGO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LIQUIDACION_CODIGO
  PARENT.Init
  Access:LIQUIDACION_CODIGO &= SELF


Hide:Access:LIQUIDACION_CODIGO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('LIQUIDACION_CODIGO',LIQUIDACION_CODIGO)
  RETURN ReturnValue


Hide:Access:LIQUIDACION_CODIGO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LIQUIDACION_CODIGO &= NULL                        ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LIQUIDACION_CODIGO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('LIQUIDACION_CODIGO')
      DbChangeTrigger.AddThread('LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:IDLIQUIDACION, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:IDLIQUIDACION)) , 'LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:IDNOMENCLADOR, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:IDNOMENCLADOR)) , 'LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:IDOS, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:IDOS)) , 'LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:VALOR, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:VALOR)) , 'LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:CANTIDAD, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:CANTIDAD)) , 'LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:TOTAL, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:TOTAL)) , 'LIQUIDACION_CODIGO')
   END
   DbChangeTrigger.Update('LIQUIDACION_CODIGO')
  RETURN ReturnValue


Hide:Access:LIQUIDACION_CODIGO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('LIQUIDACION_CODIGO')
      DbChangeTrigger.AddThread('LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:IDLIQUIDACION, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:IDLIQUIDACION)) , 'LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:IDNOMENCLADOR, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:IDNOMENCLADOR)) , 'LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:IDOS, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:IDOS)) , 'LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:VALOR, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:VALOR)) , 'LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:CANTIDAD, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:CANTIDAD)) , 'LIQUIDACION_CODIGO')
      DbChangeTrigger.AddItem(LIQC:TOTAL, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:TOTAL)) , 'LIQUIDACION_CODIGO')
   END
   DbChangeTrigger.Update('LIQUIDACION_CODIGO')
  RETURN ReturnValue


Hide:Access:LIQUIDACION_CODIGO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('LIQUIDACION_CODIGO')
       DbChangeTrigger.CheckChanges('LIQUIDACION_CODIGO',LIQUIDACION_CODIGO) 
    END
  RETURN ReturnValue


Hide:Access:LIQUIDACION_CODIGO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LIQUIDACION_CODIGO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(LIQC:PK_LIQUIDACION_CODIGO,'LIQC:PK_LIQUIDACION_CODIGO',0)
    SELF.AddKey(LIQC:FK_LIQUIDACION_CODIGO_OS,'LIQC:FK_LIQUIDACION_CODIGO_OS',0)
    SELF.AddKey(LIQC:FK_LIQUIDACION_CODIGO_LIQ,'LIQC:FK_LIQUIDACION_CODIGO_LIQ',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:LIQUIDACION_CODIGO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:NOMENCLADORXOS2 USHORT,AUTO
Save:NOMENCLADORXOS3 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('LIQC:IDNOMENCLADOR')
    Save:NOMENCLADORXOS2 = Access:NOMENCLADORXOS.SaveFile()
    NOM2:IDOS = LIQC:IDOS
    NOM2:IDNOMENCLADOR = LIQC:IDNOMENCLADOR
    ReturnValue = Access:NOMENCLADORXOS.TryFetch(NOM2:PK_NOMENCLADORXOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'NOMENCLADORXOS')
      END
    END
    Access:NOMENCLADORXOS.RestoreFile(Save:NOMENCLADORXOS2)
  OF 3
    GlobalErrors.SetField('LIQC:IDOS')
    Save:NOMENCLADORXOS3 = Access:NOMENCLADORXOS.SaveFile()
    NOM2:IDOS = LIQC:IDOS
    NOM2:IDNOMENCLADOR = LIQC:IDNOMENCLADOR
    ReturnValue = Access:NOMENCLADORXOS.TryFetch(NOM2:PK_NOMENCLADORXOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'NOMENCLADORXOS')
      END
    END
    Access:NOMENCLADORXOS.RestoreFile(Save:NOMENCLADORXOS3)
  END
  RETURN ReturnValue


Hide:Relate:LIQUIDACION_CODIGO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:LIQUIDACION)

  SELF.AddRelation(Relate:NOMENCLADORXOS)


Hide:Relate:LIQUIDACION_CODIGO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('LIQUIDACION_CODIGO',LIQUIDACION_CODIGO)
  RETURN ReturnValue


Hide:Relate:LIQUIDACION_CODIGO.Kill PROCEDURE

  CODE
  _Hide:Access:LIQUIDACION_CODIGO.Kill                     ! Kill the file manager
  PARENT.Kill
  Relate:LIQUIDACION_CODIGO &= NULL                        ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LIQUIDACION_CODIGO)                 ! destroy the file manager


Hide:Relate:LIQUIDACION_CODIGO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('LIQUIDACION_CODIGO')
       DbChangeTrigger.AddThread('LIQUIDACION_CODIGO')
       DbChangeTrigger.AddItem(LIQC:IDLIQUIDACION, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:IDLIQUIDACION)) , 'LIQUIDACION_CODIGO')
       DbChangeTrigger.AddItem(LIQC:IDNOMENCLADOR, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:IDNOMENCLADOR)) , 'LIQUIDACION_CODIGO')
       DbChangeTrigger.AddItem(LIQC:IDOS, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:IDOS)) , 'LIQUIDACION_CODIGO')
       DbChangeTrigger.AddItem(LIQC:VALOR, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:VALOR)) , 'LIQUIDACION_CODIGO')
       DbChangeTrigger.AddItem(LIQC:CANTIDAD, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:CANTIDAD)) , 'LIQUIDACION_CODIGO')
       DbChangeTrigger.AddItem(LIQC:TOTAL, WHO(LIQC:RECORD,WHERE(LIQC:RECORD,LIQC:TOTAL)) , 'LIQUIDACION_CODIGO')
    END
    DbChangeTrigger.Update('LIQUIDACION_CODIGO')


Hide:Relate:LIQUIDACION_CODIGO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('LIQUIDACION_CODIGO')
        DbChangeTrigger.CheckChanges('LIQUIDACION_CODIGO',LIQUIDACION_CODIGO) 
     END
  RETURN ReturnValue


Hide:Relate:PAGOS_LIQUIDACION.Init PROCEDURE()
  CODE
  _Hide:Access:PAGOS_LIQUIDACION.Init
  SELF.Init(Access:PAGOS_LIQUIDACION,1)


Hide:Access:PAGOS_LIQUIDACION.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('PAGOS_LIQUIDACION')
      DbChangeTrigger.AddThread('PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDPAGOS, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDPAGOS)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDSOCIO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDSOCIO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:SUCURSAL, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:SUCURSAL)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDLIQUIDACION, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDLIQUIDACION)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MONTO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:FECHA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:FECHA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:HORA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:HORA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MES, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MES)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:ANO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:ANO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:PERIODO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:PERIODO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDUSUARIO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDUSUARIO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDRECIBO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDRECIBO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MONTO_FACTURA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO_FACTURA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:INTERES_FACTURA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:INTERES_FACTURA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDSUBCUENTA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDSUBCUENTA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:AFECTADA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:AFECTADA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:DEBITO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:DEBITO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:CUOTA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:CUOTA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:CANT_CUOTA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:CANT_CUOTA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:SEGURO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:SEGURO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:CANT_CUOTA_S, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:CANT_CUOTA_S)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:GASTOS_ADM, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:GASTOS_ADM)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IMP_CHEQUE, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IMP_CHEQUE)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MONTO_IMP_CHEQUE, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO_IMP_CHEQUE)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MONTO_IMP_DEBITO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO_IMP_DEBITO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MONTO_IMP_TOTAL, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO_IMP_TOTAL)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:CREDITO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:CREDITO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:SOCIOS_LIQUIDACION, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:SOCIOS_LIQUIDACION)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:GASTOS_BANCARIOS, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:GASTOS_BANCARIOS)) , 'PAGOS_LIQUIDACION')
   END
   DbChangeTrigger.Update('PAGOS_LIQUIDACION')
  RETURN ReturnValue


Hide:Access:PAGOS_LIQUIDACION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PAGL:Record
  SELF.FileNameValue = 'PAGOS_LIQUIDACION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PAGOS_LIQUIDACION
  PARENT.Init
  Access:PAGOS_LIQUIDACION &= SELF


Hide:Access:PAGOS_LIQUIDACION.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('PAGOS_LIQUIDACION',PAGOS_LIQUIDACION)
  RETURN ReturnValue


Hide:Access:PAGOS_LIQUIDACION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PAGOS_LIQUIDACION &= NULL                         ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PAGOS_LIQUIDACION.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('PAGOS_LIQUIDACION')
      DbChangeTrigger.AddThread('PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDPAGOS, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDPAGOS)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDSOCIO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDSOCIO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:SUCURSAL, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:SUCURSAL)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDLIQUIDACION, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDLIQUIDACION)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MONTO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:FECHA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:FECHA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:HORA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:HORA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MES, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MES)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:ANO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:ANO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:PERIODO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:PERIODO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDUSUARIO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDUSUARIO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDRECIBO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDRECIBO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MONTO_FACTURA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO_FACTURA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:INTERES_FACTURA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:INTERES_FACTURA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDSUBCUENTA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDSUBCUENTA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:AFECTADA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:AFECTADA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:DEBITO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:DEBITO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:CUOTA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:CUOTA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:CANT_CUOTA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:CANT_CUOTA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:SEGURO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:SEGURO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:CANT_CUOTA_S, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:CANT_CUOTA_S)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:GASTOS_ADM, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:GASTOS_ADM)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IMP_CHEQUE, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IMP_CHEQUE)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MONTO_IMP_CHEQUE, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO_IMP_CHEQUE)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MONTO_IMP_DEBITO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO_IMP_DEBITO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MONTO_IMP_TOTAL, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO_IMP_TOTAL)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:CREDITO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:CREDITO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:SOCIOS_LIQUIDACION, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:SOCIOS_LIQUIDACION)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:GASTOS_BANCARIOS, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:GASTOS_BANCARIOS)) , 'PAGOS_LIQUIDACION')
   END
   DbChangeTrigger.Update('PAGOS_LIQUIDACION')
  RETURN ReturnValue


Hide:Access:PAGOS_LIQUIDACION.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('PAGOS_LIQUIDACION')
      DbChangeTrigger.AddThread('PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDPAGOS, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDPAGOS)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDSOCIO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDSOCIO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:SUCURSAL, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:SUCURSAL)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDLIQUIDACION, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDLIQUIDACION)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MONTO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:FECHA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:FECHA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:HORA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:HORA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MES, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MES)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:ANO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:ANO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:PERIODO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:PERIODO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDUSUARIO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDUSUARIO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDRECIBO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDRECIBO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MONTO_FACTURA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO_FACTURA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:INTERES_FACTURA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:INTERES_FACTURA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IDSUBCUENTA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDSUBCUENTA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:AFECTADA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:AFECTADA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:DEBITO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:DEBITO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:CUOTA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:CUOTA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:CANT_CUOTA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:CANT_CUOTA)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:SEGURO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:SEGURO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:CANT_CUOTA_S, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:CANT_CUOTA_S)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:GASTOS_ADM, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:GASTOS_ADM)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:IMP_CHEQUE, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IMP_CHEQUE)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MONTO_IMP_CHEQUE, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO_IMP_CHEQUE)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MONTO_IMP_DEBITO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO_IMP_DEBITO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:MONTO_IMP_TOTAL, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO_IMP_TOTAL)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:CREDITO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:CREDITO)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:SOCIOS_LIQUIDACION, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:SOCIOS_LIQUIDACION)) , 'PAGOS_LIQUIDACION')
      DbChangeTrigger.AddItem(PAGL:GASTOS_BANCARIOS, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:GASTOS_BANCARIOS)) , 'PAGOS_LIQUIDACION')
   END
   DbChangeTrigger.Update('PAGOS_LIQUIDACION')
  RETURN ReturnValue


Hide:Access:PAGOS_LIQUIDACION.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('PAGOS_LIQUIDACION')
       DbChangeTrigger.CheckChanges('PAGOS_LIQUIDACION',PAGOS_LIQUIDACION) 
    END
  RETURN ReturnValue


Hide:Access:PAGOS_LIQUIDACION.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PAGOS_LIQUIDACION,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PAGL:FK_PAGOS_LIQUIDACION_SOCIOS,'PAGL:FK_PAGOS_LIQUIDACION_SOCIOS',0)
    SELF.AddKey(PAGL:PK_PAGOS_LIQUIDACION,'PAGL:PK_PAGOS_LIQUIDACION',0)
    SELF.AddKey(PAGL:FK_PAGOS_LIQUIDACION_USUARIOS,'PAGL:FK_PAGOS_LIQUIDACION_USUARIOS',0)
    SELF.AddKey(PAGL:IDX_PAGOS_LIQUIDACION_PAGO,'PAGL:IDX_PAGOS_LIQUIDACION_PAGO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:PAGOS_LIQUIDACION.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS2       USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('PAGL:IDSOCIO')
    Save:SOCIOS2 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = PAGL:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS2)
  END
  RETURN ReturnValue


Hide:Relate:PAGOS_LIQUIDACION.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:LIQUIDACION,RI:None,RI:None,LIQ:IDX_LIQUIDACION_PAGO)
  SELF.AddRelationLink(PAGL:IDPAGOS,LIQ:IDPAGO_LIQUIDACION)

  SELF.AddRelation(Relate:SOCIOS)


Hide:Relate:PAGOS_LIQUIDACION.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('PAGOS_LIQUIDACION',PAGOS_LIQUIDACION)
  RETURN ReturnValue


Hide:Relate:PAGOS_LIQUIDACION.Kill PROCEDURE

  CODE
  _Hide:Access:PAGOS_LIQUIDACION.Kill                      ! Kill the file manager
  PARENT.Kill
  Relate:PAGOS_LIQUIDACION &= NULL                         ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PAGOS_LIQUIDACION)                  ! destroy the file manager


Hide:Relate:PAGOS_LIQUIDACION.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('PAGOS_LIQUIDACION')
       DbChangeTrigger.AddThread('PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:IDPAGOS, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDPAGOS)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:IDSOCIO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDSOCIO)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:SUCURSAL, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:SUCURSAL)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:IDLIQUIDACION, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDLIQUIDACION)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:MONTO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:FECHA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:FECHA)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:HORA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:HORA)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:MES, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MES)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:ANO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:ANO)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:PERIODO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:PERIODO)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:IDUSUARIO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDUSUARIO)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:IDRECIBO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDRECIBO)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:MONTO_FACTURA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO_FACTURA)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:INTERES_FACTURA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:INTERES_FACTURA)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:IDSUBCUENTA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IDSUBCUENTA)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:AFECTADA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:AFECTADA)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:DEBITO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:DEBITO)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:CUOTA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:CUOTA)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:CANT_CUOTA, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:CANT_CUOTA)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:SEGURO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:SEGURO)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:CANT_CUOTA_S, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:CANT_CUOTA_S)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:GASTOS_ADM, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:GASTOS_ADM)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:IMP_CHEQUE, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:IMP_CHEQUE)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:MONTO_IMP_CHEQUE, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO_IMP_CHEQUE)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:MONTO_IMP_DEBITO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO_IMP_DEBITO)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:MONTO_IMP_TOTAL, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:MONTO_IMP_TOTAL)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:CREDITO, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:CREDITO)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:SOCIOS_LIQUIDACION, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:SOCIOS_LIQUIDACION)) , 'PAGOS_LIQUIDACION')
       DbChangeTrigger.AddItem(PAGL:GASTOS_BANCARIOS, WHO(PAGL:RECORD,WHERE(PAGL:RECORD,PAGL:GASTOS_BANCARIOS)) , 'PAGOS_LIQUIDACION')
    END
    DbChangeTrigger.Update('PAGOS_LIQUIDACION')


Hide:Relate:PAGOS_LIQUIDACION.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('PAGOS_LIQUIDACION')
        DbChangeTrigger.CheckChanges('PAGOS_LIQUIDACION',PAGOS_LIQUIDACION) 
     END
  RETURN ReturnValue


Hide:Relate:EMAILS.Init PROCEDURE()
  CODE
  _Hide:Access:EMAILS.Init
  SELF.Init(Access:EMAILS,1)


Hide:Access:EMAILS.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('EMAILS')
      DbChangeTrigger.AddThread('EMAILS')
      DbChangeTrigger.AddItem(EML:IDEMAIL, WHO(EML:RECORD,WHERE(EML:RECORD,EML:IDEMAIL)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:PARA, WHO(EML:RECORD,WHERE(EML:RECORD,EML:PARA)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:TITULO, WHO(EML:RECORD,WHERE(EML:RECORD,EML:TITULO)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:MENSAJE, WHO(EML:RECORD,WHERE(EML:RECORD,EML:MENSAJE)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:ADJUNTO, WHO(EML:RECORD,WHERE(EML:RECORD,EML:ADJUNTO)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:FECHA, WHO(EML:RECORD,WHERE(EML:RECORD,EML:FECHA)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:HORA, WHO(EML:RECORD,WHERE(EML:RECORD,EML:HORA)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:IDUSUARIO, WHO(EML:RECORD,WHERE(EML:RECORD,EML:IDUSUARIO)) , 'EMAILS')
   END
   DbChangeTrigger.Update('EMAILS')
  RETURN ReturnValue


Hide:Access:EMAILS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= EML:Record
  SELF.FileNameValue = 'EMAILS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= EMAILS
  PARENT.Init
  Access:EMAILS &= SELF


Hide:Access:EMAILS.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('EMAILS',EMAILS)
  RETURN ReturnValue


Hide:Access:EMAILS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:EMAILS &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:EMAILS.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('EMAILS')
      DbChangeTrigger.AddThread('EMAILS')
      DbChangeTrigger.AddItem(EML:IDEMAIL, WHO(EML:RECORD,WHERE(EML:RECORD,EML:IDEMAIL)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:PARA, WHO(EML:RECORD,WHERE(EML:RECORD,EML:PARA)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:TITULO, WHO(EML:RECORD,WHERE(EML:RECORD,EML:TITULO)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:MENSAJE, WHO(EML:RECORD,WHERE(EML:RECORD,EML:MENSAJE)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:ADJUNTO, WHO(EML:RECORD,WHERE(EML:RECORD,EML:ADJUNTO)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:FECHA, WHO(EML:RECORD,WHERE(EML:RECORD,EML:FECHA)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:HORA, WHO(EML:RECORD,WHERE(EML:RECORD,EML:HORA)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:IDUSUARIO, WHO(EML:RECORD,WHERE(EML:RECORD,EML:IDUSUARIO)) , 'EMAILS')
   END
   DbChangeTrigger.Update('EMAILS')
  RETURN ReturnValue


Hide:Access:EMAILS.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('EMAILS')
      DbChangeTrigger.AddThread('EMAILS')
      DbChangeTrigger.AddItem(EML:IDEMAIL, WHO(EML:RECORD,WHERE(EML:RECORD,EML:IDEMAIL)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:PARA, WHO(EML:RECORD,WHERE(EML:RECORD,EML:PARA)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:TITULO, WHO(EML:RECORD,WHERE(EML:RECORD,EML:TITULO)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:MENSAJE, WHO(EML:RECORD,WHERE(EML:RECORD,EML:MENSAJE)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:ADJUNTO, WHO(EML:RECORD,WHERE(EML:RECORD,EML:ADJUNTO)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:FECHA, WHO(EML:RECORD,WHERE(EML:RECORD,EML:FECHA)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:HORA, WHO(EML:RECORD,WHERE(EML:RECORD,EML:HORA)) , 'EMAILS')
      DbChangeTrigger.AddItem(EML:IDUSUARIO, WHO(EML:RECORD,WHERE(EML:RECORD,EML:IDUSUARIO)) , 'EMAILS')
   END
   DbChangeTrigger.Update('EMAILS')
  RETURN ReturnValue


Hide:Access:EMAILS.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('EMAILS')
       DbChangeTrigger.CheckChanges('EMAILS',EMAILS) 
    END
  RETURN ReturnValue


Hide:Access:EMAILS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(EMAILS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(EML:EMAILS_FECHA,'EML:EMAILS_FECHA',0)
    SELF.AddKey(EML:EMAILS_TITULO,'EML:EMAILS_TITULO',0)
    SELF.AddKey(EML:PK_EMAILS,'EML:PK_EMAILS',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:EMAILS.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('EMAILS',EMAILS)
  RETURN ReturnValue


Hide:Relate:EMAILS.Kill PROCEDURE

  CODE
  _Hide:Access:EMAILS.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:EMAILS &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:EMAILS)                             ! destroy the file manager


Hide:Relate:EMAILS.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('EMAILS')
       DbChangeTrigger.AddThread('EMAILS')
       DbChangeTrigger.AddItem(EML:IDEMAIL, WHO(EML:RECORD,WHERE(EML:RECORD,EML:IDEMAIL)) , 'EMAILS')
       DbChangeTrigger.AddItem(EML:PARA, WHO(EML:RECORD,WHERE(EML:RECORD,EML:PARA)) , 'EMAILS')
       DbChangeTrigger.AddItem(EML:TITULO, WHO(EML:RECORD,WHERE(EML:RECORD,EML:TITULO)) , 'EMAILS')
       DbChangeTrigger.AddItem(EML:MENSAJE, WHO(EML:RECORD,WHERE(EML:RECORD,EML:MENSAJE)) , 'EMAILS')
       DbChangeTrigger.AddItem(EML:ADJUNTO, WHO(EML:RECORD,WHERE(EML:RECORD,EML:ADJUNTO)) , 'EMAILS')
       DbChangeTrigger.AddItem(EML:FECHA, WHO(EML:RECORD,WHERE(EML:RECORD,EML:FECHA)) , 'EMAILS')
       DbChangeTrigger.AddItem(EML:HORA, WHO(EML:RECORD,WHERE(EML:RECORD,EML:HORA)) , 'EMAILS')
       DbChangeTrigger.AddItem(EML:IDUSUARIO, WHO(EML:RECORD,WHERE(EML:RECORD,EML:IDUSUARIO)) , 'EMAILS')
    END
    DbChangeTrigger.Update('EMAILS')


Hide:Relate:EMAILS.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('EMAILS')
        DbChangeTrigger.CheckChanges('EMAILS',EMAILS) 
     END
  RETURN ReturnValue


Hide:Relate:BANCO_DEBITO.Init PROCEDURE()
  CODE
  _Hide:Access:BANCO_DEBITO.Init
  SELF.Init(Access:BANCO_DEBITO,1)


Hide:Access:BANCO_DEBITO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('BANCO_DEBITO')
      DbChangeTrigger.AddThread('BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:TRAFICO_INF, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:TRAFICO_INF)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:COD_BANCO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:COD_BANCO)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:COD_REGISTRO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:COD_REGISTRO)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:F_VENCIMIENTO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:F_VENCIMIENTO)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:EMPRESA, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:EMPRESA)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:IDENTIFICADO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:IDENTIFICADO)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:MONEDA, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:MONEDA)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:CBU_B_1, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:CBU_B_1)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:CBU_B_4, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:CBU_B_4)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:IMPORTE, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:IMPORTE)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:CUIT, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:CUIT)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:DESCRIPCION, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:DESCRIPCION)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:VENCIMIENTO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:VENCIMIENTO)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:REFER_UNIVOCA, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:REFER_UNIVOCA)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:NUEVO_CBU, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:NUEVO_CBU)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:CODIGO_RETORNO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:CODIGO_RETORNO)) , 'BANCO_DEBITO')
   END
   DbChangeTrigger.Update('BANCO_DEBITO')
  RETURN ReturnValue


Hide:Access:BANCO_DEBITO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= BAN:Record
  SELF.FileNameValue = 'BANCO_DEBITO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= BANCO_DEBITO
  PARENT.Init
  Access:BANCO_DEBITO &= SELF


Hide:Access:BANCO_DEBITO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('BANCO_DEBITO',BANCO_DEBITO)
  RETURN ReturnValue


Hide:Access:BANCO_DEBITO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:BANCO_DEBITO &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:BANCO_DEBITO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('BANCO_DEBITO')
      DbChangeTrigger.AddThread('BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:TRAFICO_INF, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:TRAFICO_INF)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:COD_BANCO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:COD_BANCO)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:COD_REGISTRO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:COD_REGISTRO)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:F_VENCIMIENTO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:F_VENCIMIENTO)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:EMPRESA, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:EMPRESA)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:IDENTIFICADO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:IDENTIFICADO)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:MONEDA, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:MONEDA)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:CBU_B_1, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:CBU_B_1)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:CBU_B_4, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:CBU_B_4)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:IMPORTE, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:IMPORTE)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:CUIT, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:CUIT)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:DESCRIPCION, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:DESCRIPCION)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:VENCIMIENTO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:VENCIMIENTO)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:REFER_UNIVOCA, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:REFER_UNIVOCA)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:NUEVO_CBU, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:NUEVO_CBU)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:CODIGO_RETORNO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:CODIGO_RETORNO)) , 'BANCO_DEBITO')
   END
   DbChangeTrigger.Update('BANCO_DEBITO')
  RETURN ReturnValue


Hide:Access:BANCO_DEBITO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('BANCO_DEBITO')
      DbChangeTrigger.AddThread('BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:TRAFICO_INF, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:TRAFICO_INF)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:COD_BANCO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:COD_BANCO)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:COD_REGISTRO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:COD_REGISTRO)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:F_VENCIMIENTO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:F_VENCIMIENTO)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:EMPRESA, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:EMPRESA)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:IDENTIFICADO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:IDENTIFICADO)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:MONEDA, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:MONEDA)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:CBU_B_1, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:CBU_B_1)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:CBU_B_4, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:CBU_B_4)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:IMPORTE, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:IMPORTE)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:CUIT, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:CUIT)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:DESCRIPCION, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:DESCRIPCION)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:VENCIMIENTO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:VENCIMIENTO)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:REFER_UNIVOCA, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:REFER_UNIVOCA)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:NUEVO_CBU, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:NUEVO_CBU)) , 'BANCO_DEBITO')
      DbChangeTrigger.AddItem(BAN:CODIGO_RETORNO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:CODIGO_RETORNO)) , 'BANCO_DEBITO')
   END
   DbChangeTrigger.Update('BANCO_DEBITO')
  RETURN ReturnValue


Hide:Access:BANCO_DEBITO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('BANCO_DEBITO')
       DbChangeTrigger.CheckChanges('BANCO_DEBITO',BANCO_DEBITO) 
    END
  RETURN ReturnValue


Hide:Access:BANCO_DEBITO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(BANCO_DEBITO,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:BANCO_DEBITO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('BANCO_DEBITO',BANCO_DEBITO)
  RETURN ReturnValue


Hide:Relate:BANCO_DEBITO.Kill PROCEDURE

  CODE
  _Hide:Access:BANCO_DEBITO.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:BANCO_DEBITO &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:BANCO_DEBITO)                       ! destroy the file manager


Hide:Relate:BANCO_DEBITO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('BANCO_DEBITO')
       DbChangeTrigger.AddThread('BANCO_DEBITO')
       DbChangeTrigger.AddItem(BAN:TRAFICO_INF, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:TRAFICO_INF)) , 'BANCO_DEBITO')
       DbChangeTrigger.AddItem(BAN:COD_BANCO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:COD_BANCO)) , 'BANCO_DEBITO')
       DbChangeTrigger.AddItem(BAN:COD_REGISTRO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:COD_REGISTRO)) , 'BANCO_DEBITO')
       DbChangeTrigger.AddItem(BAN:F_VENCIMIENTO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:F_VENCIMIENTO)) , 'BANCO_DEBITO')
       DbChangeTrigger.AddItem(BAN:EMPRESA, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:EMPRESA)) , 'BANCO_DEBITO')
       DbChangeTrigger.AddItem(BAN:IDENTIFICADO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:IDENTIFICADO)) , 'BANCO_DEBITO')
       DbChangeTrigger.AddItem(BAN:MONEDA, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:MONEDA)) , 'BANCO_DEBITO')
       DbChangeTrigger.AddItem(BAN:CBU_B_1, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:CBU_B_1)) , 'BANCO_DEBITO')
       DbChangeTrigger.AddItem(BAN:CBU_B_4, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:CBU_B_4)) , 'BANCO_DEBITO')
       DbChangeTrigger.AddItem(BAN:IMPORTE, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:IMPORTE)) , 'BANCO_DEBITO')
       DbChangeTrigger.AddItem(BAN:CUIT, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:CUIT)) , 'BANCO_DEBITO')
       DbChangeTrigger.AddItem(BAN:DESCRIPCION, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:DESCRIPCION)) , 'BANCO_DEBITO')
       DbChangeTrigger.AddItem(BAN:VENCIMIENTO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:VENCIMIENTO)) , 'BANCO_DEBITO')
       DbChangeTrigger.AddItem(BAN:REFER_UNIVOCA, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:REFER_UNIVOCA)) , 'BANCO_DEBITO')
       DbChangeTrigger.AddItem(BAN:NUEVO_CBU, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:NUEVO_CBU)) , 'BANCO_DEBITO')
       DbChangeTrigger.AddItem(BAN:CODIGO_RETORNO, WHO(BAN:RECORD,WHERE(BAN:RECORD,BAN:CODIGO_RETORNO)) , 'BANCO_DEBITO')
    END
    DbChangeTrigger.Update('BANCO_DEBITO')


Hide:Relate:BANCO_DEBITO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('BANCO_DEBITO')
        DbChangeTrigger.CheckChanges('BANCO_DEBITO',BANCO_DEBITO) 
     END
  RETURN ReturnValue


Hide:Relate:MCENTRO_SALUD.Init PROCEDURE()
  CODE
  _Hide:Access:MCENTRO_SALUD.Init
  SELF.Init(Access:MCENTRO_SALUD,1)


Hide:Access:MCENTRO_SALUD.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('MCENTRO_SALUD')
      DbChangeTrigger.AddThread('MCENTRO_SALUD')
      DbChangeTrigger.AddItem(MCS:IDCENTRO_SALUD, WHO(MCS:RECORD,WHERE(MCS:RECORD,MCS:IDCENTRO_SALUD)) , 'MCENTRO_SALUD')
      DbChangeTrigger.AddItem(MCS:DESCRIPCION, WHO(MCS:RECORD,WHERE(MCS:RECORD,MCS:DESCRIPCION)) , 'MCENTRO_SALUD')
      DbChangeTrigger.AddItem(MCS:DIRECCION, WHO(MCS:RECORD,WHERE(MCS:RECORD,MCS:DIRECCION)) , 'MCENTRO_SALUD')
   END
   DbChangeTrigger.Update('MCENTRO_SALUD')
  RETURN ReturnValue


Hide:Access:MCENTRO_SALUD.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MCS:Record
  SELF.FileNameValue = 'MCENTRO_SALUD'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= MCENTRO_SALUD
  PARENT.Init
  Access:MCENTRO_SALUD &= SELF


Hide:Access:MCENTRO_SALUD.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('MCENTRO_SALUD',MCENTRO_SALUD)
  RETURN ReturnValue


Hide:Access:MCENTRO_SALUD.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:MCENTRO_SALUD &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:MCENTRO_SALUD.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('MCENTRO_SALUD')
      DbChangeTrigger.AddThread('MCENTRO_SALUD')
      DbChangeTrigger.AddItem(MCS:IDCENTRO_SALUD, WHO(MCS:RECORD,WHERE(MCS:RECORD,MCS:IDCENTRO_SALUD)) , 'MCENTRO_SALUD')
      DbChangeTrigger.AddItem(MCS:DESCRIPCION, WHO(MCS:RECORD,WHERE(MCS:RECORD,MCS:DESCRIPCION)) , 'MCENTRO_SALUD')
      DbChangeTrigger.AddItem(MCS:DIRECCION, WHO(MCS:RECORD,WHERE(MCS:RECORD,MCS:DIRECCION)) , 'MCENTRO_SALUD')
   END
   DbChangeTrigger.Update('MCENTRO_SALUD')
  RETURN ReturnValue


Hide:Access:MCENTRO_SALUD.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('MCENTRO_SALUD')
      DbChangeTrigger.AddThread('MCENTRO_SALUD')
      DbChangeTrigger.AddItem(MCS:IDCENTRO_SALUD, WHO(MCS:RECORD,WHERE(MCS:RECORD,MCS:IDCENTRO_SALUD)) , 'MCENTRO_SALUD')
      DbChangeTrigger.AddItem(MCS:DESCRIPCION, WHO(MCS:RECORD,WHERE(MCS:RECORD,MCS:DESCRIPCION)) , 'MCENTRO_SALUD')
      DbChangeTrigger.AddItem(MCS:DIRECCION, WHO(MCS:RECORD,WHERE(MCS:RECORD,MCS:DIRECCION)) , 'MCENTRO_SALUD')
   END
   DbChangeTrigger.Update('MCENTRO_SALUD')
  RETURN ReturnValue


Hide:Access:MCENTRO_SALUD.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('MCENTRO_SALUD')
       DbChangeTrigger.CheckChanges('MCENTRO_SALUD',MCENTRO_SALUD) 
    END
  RETURN ReturnValue


Hide:Access:MCENTRO_SALUD.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(MCENTRO_SALUD,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(MCS:PK_CENTRO_SALUD,'MCS:PK_CENTRO_SALUD',0)
    SELF.AddKey(MCS:IDX_NOMBRE,'MCS:IDX_NOMBRE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:MCENTRO_SALUD.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:SOCIOS_CENTRO_SALUD)
  SELF.AddRelationLink(MCS:IDCENTRO_SALUD,SOC:IDCS)


Hide:Relate:MCENTRO_SALUD.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('MCENTRO_SALUD',MCENTRO_SALUD)
  RETURN ReturnValue


Hide:Relate:MCENTRO_SALUD.Kill PROCEDURE

  CODE
  _Hide:Access:MCENTRO_SALUD.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:MCENTRO_SALUD &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:MCENTRO_SALUD)                      ! destroy the file manager


Hide:Relate:MCENTRO_SALUD.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('MCENTRO_SALUD')
       DbChangeTrigger.AddThread('MCENTRO_SALUD')
       DbChangeTrigger.AddItem(MCS:IDCENTRO_SALUD, WHO(MCS:RECORD,WHERE(MCS:RECORD,MCS:IDCENTRO_SALUD)) , 'MCENTRO_SALUD')
       DbChangeTrigger.AddItem(MCS:DESCRIPCION, WHO(MCS:RECORD,WHERE(MCS:RECORD,MCS:DESCRIPCION)) , 'MCENTRO_SALUD')
       DbChangeTrigger.AddItem(MCS:DIRECCION, WHO(MCS:RECORD,WHERE(MCS:RECORD,MCS:DIRECCION)) , 'MCENTRO_SALUD')
    END
    DbChangeTrigger.Update('MCENTRO_SALUD')


Hide:Relate:MCENTRO_SALUD.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('MCENTRO_SALUD')
        DbChangeTrigger.CheckChanges('MCENTRO_SALUD',MCENTRO_SALUD) 
     END
  RETURN ReturnValue


Hide:Relate:CONF_EMP.Init PROCEDURE()
  CODE
  _Hide:Access:CONF_EMP.Init
  SELF.Init(Access:CONF_EMP,1)


Hide:Access:CONF_EMP.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CONF_EMP')
      DbChangeTrigger.AddThread('CONF_EMP')
      DbChangeTrigger.AddItem(COF:RAZON_SOCIAL, WHO(COF:RECORD,WHERE(COF:RECORD,COF:RAZON_SOCIAL)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:CUIT, WHO(COF:RECORD,WHERE(COF:RECORD,COF:CUIT)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:DIRECCION, WHO(COF:RECORD,WHERE(COF:RECORD,COF:DIRECCION)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:TELEFONOS, WHO(COF:RECORD,WHERE(COF:RECORD,COF:TELEFONOS)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:EMAIL, WHO(COF:RECORD,WHERE(COF:RECORD,COF:EMAIL)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:CONTROL_CUOTA, WHO(COF:RECORD,WHERE(COF:RECORD,COF:CONTROL_CUOTA)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:FIRMA1, WHO(COF:RECORD,WHERE(COF:RECORD,COF:FIRMA1)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:FIRMA2, WHO(COF:RECORD,WHERE(COF:RECORD,COF:FIRMA2)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:FIRMA3, WHO(COF:RECORD,WHERE(COF:RECORD,COF:FIRMA3)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:LEY, WHO(COF:RECORD,WHERE(COF:RECORD,COF:LEY)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:PER_JUR, WHO(COF:RECORD,WHERE(COF:RECORD,COF:PER_JUR)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:PORCENTAJE_LIQUIDACION, WHO(COF:RECORD,WHERE(COF:RECORD,COF:PORCENTAJE_LIQUIDACION)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:IMP_CHEQUE, WHO(COF:RECORD,WHERE(COF:RECORD,COF:IMP_CHEQUE)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:CHEQUERA, WHO(COF:RECORD,WHERE(COF:RECORD,COF:CHEQUERA)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:SMTP, WHO(COF:RECORD,WHERE(COF:RECORD,COF:SMTP)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:USUARIO_SMTP, WHO(COF:RECORD,WHERE(COF:RECORD,COF:USUARIO_SMTP)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:PASSWORD_SMTP, WHO(COF:RECORD,WHERE(COF:RECORD,COF:PASSWORD_SMTP)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:SMTP_SEGURO, WHO(COF:RECORD,WHERE(COF:RECORD,COF:SMTP_SEGURO)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:PUERTO, WHO(COF:RECORD,WHERE(COF:RECORD,COF:PUERTO)) , 'CONF_EMP')
   END
   DbChangeTrigger.Update('CONF_EMP')
  RETURN ReturnValue


Hide:Access:CONF_EMP.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= COF:Record
  SELF.FileNameValue = 'CONF_EMP'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CONF_EMP
  PARENT.Init
  Access:CONF_EMP &= SELF


Hide:Access:CONF_EMP.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CONF_EMP',CONF_EMP)
  RETURN ReturnValue


Hide:Access:CONF_EMP.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CONF_EMP &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CONF_EMP.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CONF_EMP')
      DbChangeTrigger.AddThread('CONF_EMP')
      DbChangeTrigger.AddItem(COF:RAZON_SOCIAL, WHO(COF:RECORD,WHERE(COF:RECORD,COF:RAZON_SOCIAL)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:CUIT, WHO(COF:RECORD,WHERE(COF:RECORD,COF:CUIT)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:DIRECCION, WHO(COF:RECORD,WHERE(COF:RECORD,COF:DIRECCION)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:TELEFONOS, WHO(COF:RECORD,WHERE(COF:RECORD,COF:TELEFONOS)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:EMAIL, WHO(COF:RECORD,WHERE(COF:RECORD,COF:EMAIL)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:CONTROL_CUOTA, WHO(COF:RECORD,WHERE(COF:RECORD,COF:CONTROL_CUOTA)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:FIRMA1, WHO(COF:RECORD,WHERE(COF:RECORD,COF:FIRMA1)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:FIRMA2, WHO(COF:RECORD,WHERE(COF:RECORD,COF:FIRMA2)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:FIRMA3, WHO(COF:RECORD,WHERE(COF:RECORD,COF:FIRMA3)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:LEY, WHO(COF:RECORD,WHERE(COF:RECORD,COF:LEY)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:PER_JUR, WHO(COF:RECORD,WHERE(COF:RECORD,COF:PER_JUR)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:PORCENTAJE_LIQUIDACION, WHO(COF:RECORD,WHERE(COF:RECORD,COF:PORCENTAJE_LIQUIDACION)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:IMP_CHEQUE, WHO(COF:RECORD,WHERE(COF:RECORD,COF:IMP_CHEQUE)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:CHEQUERA, WHO(COF:RECORD,WHERE(COF:RECORD,COF:CHEQUERA)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:SMTP, WHO(COF:RECORD,WHERE(COF:RECORD,COF:SMTP)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:USUARIO_SMTP, WHO(COF:RECORD,WHERE(COF:RECORD,COF:USUARIO_SMTP)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:PASSWORD_SMTP, WHO(COF:RECORD,WHERE(COF:RECORD,COF:PASSWORD_SMTP)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:SMTP_SEGURO, WHO(COF:RECORD,WHERE(COF:RECORD,COF:SMTP_SEGURO)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:PUERTO, WHO(COF:RECORD,WHERE(COF:RECORD,COF:PUERTO)) , 'CONF_EMP')
   END
   DbChangeTrigger.Update('CONF_EMP')
  RETURN ReturnValue


Hide:Access:CONF_EMP.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CONF_EMP')
      DbChangeTrigger.AddThread('CONF_EMP')
      DbChangeTrigger.AddItem(COF:RAZON_SOCIAL, WHO(COF:RECORD,WHERE(COF:RECORD,COF:RAZON_SOCIAL)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:CUIT, WHO(COF:RECORD,WHERE(COF:RECORD,COF:CUIT)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:DIRECCION, WHO(COF:RECORD,WHERE(COF:RECORD,COF:DIRECCION)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:TELEFONOS, WHO(COF:RECORD,WHERE(COF:RECORD,COF:TELEFONOS)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:EMAIL, WHO(COF:RECORD,WHERE(COF:RECORD,COF:EMAIL)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:CONTROL_CUOTA, WHO(COF:RECORD,WHERE(COF:RECORD,COF:CONTROL_CUOTA)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:FIRMA1, WHO(COF:RECORD,WHERE(COF:RECORD,COF:FIRMA1)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:FIRMA2, WHO(COF:RECORD,WHERE(COF:RECORD,COF:FIRMA2)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:FIRMA3, WHO(COF:RECORD,WHERE(COF:RECORD,COF:FIRMA3)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:LEY, WHO(COF:RECORD,WHERE(COF:RECORD,COF:LEY)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:PER_JUR, WHO(COF:RECORD,WHERE(COF:RECORD,COF:PER_JUR)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:PORCENTAJE_LIQUIDACION, WHO(COF:RECORD,WHERE(COF:RECORD,COF:PORCENTAJE_LIQUIDACION)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:IMP_CHEQUE, WHO(COF:RECORD,WHERE(COF:RECORD,COF:IMP_CHEQUE)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:CHEQUERA, WHO(COF:RECORD,WHERE(COF:RECORD,COF:CHEQUERA)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:SMTP, WHO(COF:RECORD,WHERE(COF:RECORD,COF:SMTP)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:USUARIO_SMTP, WHO(COF:RECORD,WHERE(COF:RECORD,COF:USUARIO_SMTP)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:PASSWORD_SMTP, WHO(COF:RECORD,WHERE(COF:RECORD,COF:PASSWORD_SMTP)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:SMTP_SEGURO, WHO(COF:RECORD,WHERE(COF:RECORD,COF:SMTP_SEGURO)) , 'CONF_EMP')
      DbChangeTrigger.AddItem(COF:PUERTO, WHO(COF:RECORD,WHERE(COF:RECORD,COF:PUERTO)) , 'CONF_EMP')
   END
   DbChangeTrigger.Update('CONF_EMP')
  RETURN ReturnValue


Hide:Access:CONF_EMP.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CONF_EMP')
       DbChangeTrigger.CheckChanges('CONF_EMP',CONF_EMP) 
    END
  RETURN ReturnValue


Hide:Access:CONF_EMP.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CONF_EMP,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(COF:PK_CONF_EMP,'COF:PK_CONF_EMP',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CONF_EMP.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CONF_EMP',CONF_EMP)
  RETURN ReturnValue


Hide:Relate:CONF_EMP.Kill PROCEDURE

  CODE
  _Hide:Access:CONF_EMP.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:CONF_EMP &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CONF_EMP)                           ! destroy the file manager


Hide:Relate:CONF_EMP.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CONF_EMP')
       DbChangeTrigger.AddThread('CONF_EMP')
       DbChangeTrigger.AddItem(COF:RAZON_SOCIAL, WHO(COF:RECORD,WHERE(COF:RECORD,COF:RAZON_SOCIAL)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:CUIT, WHO(COF:RECORD,WHERE(COF:RECORD,COF:CUIT)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:DIRECCION, WHO(COF:RECORD,WHERE(COF:RECORD,COF:DIRECCION)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:TELEFONOS, WHO(COF:RECORD,WHERE(COF:RECORD,COF:TELEFONOS)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:EMAIL, WHO(COF:RECORD,WHERE(COF:RECORD,COF:EMAIL)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:CONTROL_CUOTA, WHO(COF:RECORD,WHERE(COF:RECORD,COF:CONTROL_CUOTA)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:FIRMA1, WHO(COF:RECORD,WHERE(COF:RECORD,COF:FIRMA1)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:FIRMA2, WHO(COF:RECORD,WHERE(COF:RECORD,COF:FIRMA2)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:FIRMA3, WHO(COF:RECORD,WHERE(COF:RECORD,COF:FIRMA3)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:LEY, WHO(COF:RECORD,WHERE(COF:RECORD,COF:LEY)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:PER_JUR, WHO(COF:RECORD,WHERE(COF:RECORD,COF:PER_JUR)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:PORCENTAJE_LIQUIDACION, WHO(COF:RECORD,WHERE(COF:RECORD,COF:PORCENTAJE_LIQUIDACION)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:IMP_CHEQUE, WHO(COF:RECORD,WHERE(COF:RECORD,COF:IMP_CHEQUE)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:CHEQUERA, WHO(COF:RECORD,WHERE(COF:RECORD,COF:CHEQUERA)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:SMTP, WHO(COF:RECORD,WHERE(COF:RECORD,COF:SMTP)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:USUARIO_SMTP, WHO(COF:RECORD,WHERE(COF:RECORD,COF:USUARIO_SMTP)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:PASSWORD_SMTP, WHO(COF:RECORD,WHERE(COF:RECORD,COF:PASSWORD_SMTP)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:SMTP_SEGURO, WHO(COF:RECORD,WHERE(COF:RECORD,COF:SMTP_SEGURO)) , 'CONF_EMP')
       DbChangeTrigger.AddItem(COF:PUERTO, WHO(COF:RECORD,WHERE(COF:RECORD,COF:PUERTO)) , 'CONF_EMP')
    END
    DbChangeTrigger.Update('CONF_EMP')


Hide:Relate:CONF_EMP.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CONF_EMP')
        DbChangeTrigger.CheckChanges('CONF_EMP',CONF_EMP) 
     END
  RETURN ReturnValue


Hide:Relate:FONDOS.Init PROCEDURE()
  CODE
  _Hide:Access:FONDOS.Init
  SELF.Init(Access:FONDOS,1)


Hide:Access:FONDOS.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('FONDOS')
      DbChangeTrigger.AddThread('FONDOS')
      DbChangeTrigger.AddItem(FON:IDFONDO, WHO(FON:RECORD,WHERE(FON:RECORD,FON:IDFONDO)) , 'FONDOS')
      DbChangeTrigger.AddItem(FON:NOMBRE_FONDO, WHO(FON:RECORD,WHERE(FON:RECORD,FON:NOMBRE_FONDO)) , 'FONDOS')
      DbChangeTrigger.AddItem(FON:MONTO, WHO(FON:RECORD,WHERE(FON:RECORD,FON:MONTO)) , 'FONDOS')
      DbChangeTrigger.AddItem(FON:FECHA, WHO(FON:RECORD,WHERE(FON:RECORD,FON:FECHA)) , 'FONDOS')
      DbChangeTrigger.AddItem(FON:HORA, WHO(FON:RECORD,WHERE(FON:RECORD,FON:HORA)) , 'FONDOS')
   END
   DbChangeTrigger.Update('FONDOS')
  RETURN ReturnValue


Hide:Access:FONDOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FON:Record
  SELF.FileNameValue = 'FONDOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= FONDOS
  PARENT.Init
  Access:FONDOS &= SELF


Hide:Access:FONDOS.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('FONDOS',FONDOS)
  RETURN ReturnValue


Hide:Access:FONDOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:FONDOS &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:FONDOS.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('FONDOS')
      DbChangeTrigger.AddThread('FONDOS')
      DbChangeTrigger.AddItem(FON:IDFONDO, WHO(FON:RECORD,WHERE(FON:RECORD,FON:IDFONDO)) , 'FONDOS')
      DbChangeTrigger.AddItem(FON:NOMBRE_FONDO, WHO(FON:RECORD,WHERE(FON:RECORD,FON:NOMBRE_FONDO)) , 'FONDOS')
      DbChangeTrigger.AddItem(FON:MONTO, WHO(FON:RECORD,WHERE(FON:RECORD,FON:MONTO)) , 'FONDOS')
      DbChangeTrigger.AddItem(FON:FECHA, WHO(FON:RECORD,WHERE(FON:RECORD,FON:FECHA)) , 'FONDOS')
      DbChangeTrigger.AddItem(FON:HORA, WHO(FON:RECORD,WHERE(FON:RECORD,FON:HORA)) , 'FONDOS')
   END
   DbChangeTrigger.Update('FONDOS')
  RETURN ReturnValue


Hide:Access:FONDOS.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('FONDOS')
      DbChangeTrigger.AddThread('FONDOS')
      DbChangeTrigger.AddItem(FON:IDFONDO, WHO(FON:RECORD,WHERE(FON:RECORD,FON:IDFONDO)) , 'FONDOS')
      DbChangeTrigger.AddItem(FON:NOMBRE_FONDO, WHO(FON:RECORD,WHERE(FON:RECORD,FON:NOMBRE_FONDO)) , 'FONDOS')
      DbChangeTrigger.AddItem(FON:MONTO, WHO(FON:RECORD,WHERE(FON:RECORD,FON:MONTO)) , 'FONDOS')
      DbChangeTrigger.AddItem(FON:FECHA, WHO(FON:RECORD,WHERE(FON:RECORD,FON:FECHA)) , 'FONDOS')
      DbChangeTrigger.AddItem(FON:HORA, WHO(FON:RECORD,WHERE(FON:RECORD,FON:HORA)) , 'FONDOS')
   END
   DbChangeTrigger.Update('FONDOS')
  RETURN ReturnValue


Hide:Access:FONDOS.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('FONDOS')
       DbChangeTrigger.CheckChanges('FONDOS',FONDOS) 
    END
  RETURN ReturnValue


Hide:Access:FONDOS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(FONDOS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(FON:PK_FONDOS,'FON:PK_FONDOS',0)
    SELF.AddKey(FON:IDX_FONDOS_NOMBRE,'FON:IDX_FONDOS_NOMBRE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:FONDOS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SUBCUENTAS,RI:None,RI:None,SUB:FK_SUBCUENTAS_FONDOS)
  SELF.AddRelationLink(FON:IDFONDO,SUB:IDFONDO)


Hide:Relate:FONDOS.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('FONDOS',FONDOS)
  RETURN ReturnValue


Hide:Relate:FONDOS.Kill PROCEDURE

  CODE
  _Hide:Access:FONDOS.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:FONDOS &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:FONDOS)                             ! destroy the file manager


Hide:Relate:FONDOS.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('FONDOS')
       DbChangeTrigger.AddThread('FONDOS')
       DbChangeTrigger.AddItem(FON:IDFONDO, WHO(FON:RECORD,WHERE(FON:RECORD,FON:IDFONDO)) , 'FONDOS')
       DbChangeTrigger.AddItem(FON:NOMBRE_FONDO, WHO(FON:RECORD,WHERE(FON:RECORD,FON:NOMBRE_FONDO)) , 'FONDOS')
       DbChangeTrigger.AddItem(FON:MONTO, WHO(FON:RECORD,WHERE(FON:RECORD,FON:MONTO)) , 'FONDOS')
       DbChangeTrigger.AddItem(FON:FECHA, WHO(FON:RECORD,WHERE(FON:RECORD,FON:FECHA)) , 'FONDOS')
       DbChangeTrigger.AddItem(FON:HORA, WHO(FON:RECORD,WHERE(FON:RECORD,FON:HORA)) , 'FONDOS')
    END
    DbChangeTrigger.Update('FONDOS')


Hide:Relate:FONDOS.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('FONDOS')
        DbChangeTrigger.CheckChanges('FONDOS',FONDOS) 
     END
  RETURN ReturnValue


Hide:Relate:TIPO_COBERTURA.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_COBERTURA.Init
  SELF.Init(Access:TIPO_COBERTURA,1)


Hide:Access:TIPO_COBERTURA.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_COBERTURA')
      DbChangeTrigger.AddThread('TIPO_COBERTURA')
      DbChangeTrigger.AddItem(TIPC:IDTIPOCUBERTURA, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:IDTIPOCUBERTURA)) , 'TIPO_COBERTURA')
      DbChangeTrigger.AddItem(TIPC:IDCOBERTURA, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:IDCOBERTURA)) , 'TIPO_COBERTURA')
      DbChangeTrigger.AddItem(TIPC:ANO_MIN, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:ANO_MIN)) , 'TIPO_COBERTURA')
      DbChangeTrigger.AddItem(TIPC:ANO_MAX, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:ANO_MAX)) , 'TIPO_COBERTURA')
      DbChangeTrigger.AddItem(TIPC:DIFERENCIA_MONTO, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:DIFERENCIA_MONTO)) , 'TIPO_COBERTURA')
   END
   DbChangeTrigger.Update('TIPO_COBERTURA')
  RETURN ReturnValue


Hide:Access:TIPO_COBERTURA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIPC:Record
  SELF.FileNameValue = 'TIPO_COBERTURA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_COBERTURA
  PARENT.Init
  Access:TIPO_COBERTURA &= SELF


Hide:Access:TIPO_COBERTURA.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('TIPO_COBERTURA',TIPO_COBERTURA)
  RETURN ReturnValue


Hide:Access:TIPO_COBERTURA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_COBERTURA &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TIPO_COBERTURA.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('TIPO_COBERTURA')
      DbChangeTrigger.AddThread('TIPO_COBERTURA')
      DbChangeTrigger.AddItem(TIPC:IDTIPOCUBERTURA, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:IDTIPOCUBERTURA)) , 'TIPO_COBERTURA')
      DbChangeTrigger.AddItem(TIPC:IDCOBERTURA, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:IDCOBERTURA)) , 'TIPO_COBERTURA')
      DbChangeTrigger.AddItem(TIPC:ANO_MIN, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:ANO_MIN)) , 'TIPO_COBERTURA')
      DbChangeTrigger.AddItem(TIPC:ANO_MAX, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:ANO_MAX)) , 'TIPO_COBERTURA')
      DbChangeTrigger.AddItem(TIPC:DIFERENCIA_MONTO, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:DIFERENCIA_MONTO)) , 'TIPO_COBERTURA')
   END
   DbChangeTrigger.Update('TIPO_COBERTURA')
  RETURN ReturnValue


Hide:Access:TIPO_COBERTURA.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_COBERTURA')
      DbChangeTrigger.AddThread('TIPO_COBERTURA')
      DbChangeTrigger.AddItem(TIPC:IDTIPOCUBERTURA, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:IDTIPOCUBERTURA)) , 'TIPO_COBERTURA')
      DbChangeTrigger.AddItem(TIPC:IDCOBERTURA, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:IDCOBERTURA)) , 'TIPO_COBERTURA')
      DbChangeTrigger.AddItem(TIPC:ANO_MIN, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:ANO_MIN)) , 'TIPO_COBERTURA')
      DbChangeTrigger.AddItem(TIPC:ANO_MAX, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:ANO_MAX)) , 'TIPO_COBERTURA')
      DbChangeTrigger.AddItem(TIPC:DIFERENCIA_MONTO, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:DIFERENCIA_MONTO)) , 'TIPO_COBERTURA')
   END
   DbChangeTrigger.Update('TIPO_COBERTURA')
  RETURN ReturnValue


Hide:Access:TIPO_COBERTURA.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('TIPO_COBERTURA')
       DbChangeTrigger.CheckChanges('TIPO_COBERTURA',TIPO_COBERTURA) 
    END
  RETURN ReturnValue


Hide:Access:TIPO_COBERTURA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TIPO_COBERTURA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TIPC:FK_TIPO_COBERTURA_1,'TIPC:FK_TIPO_COBERTURA_1',0)
    SELF.AddKey(TIPC:PK_TIPO_COBERTURA,'TIPC:PK_TIPO_COBERTURA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:TIPO_COBERTURA.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:COBERTURA2    USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('TIPC:IDCOBERTURA')
    Save:COBERTURA2 = Access:COBERTURA.SaveFile()
    COB:IDCOBERTURA = TIPC:IDCOBERTURA
    ReturnValue = Access:COBERTURA.TryFetch(COB:PK_COBERTURA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'COBERTURA')
      END
    END
    Access:COBERTURA.RestoreFile(Save:COBERTURA2)
  END
  RETURN ReturnValue


Hide:Relate:TIPO_COBERTURA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:COBERTURA)


Hide:Relate:TIPO_COBERTURA.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('TIPO_COBERTURA',TIPO_COBERTURA)
  RETURN ReturnValue


Hide:Relate:TIPO_COBERTURA.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_COBERTURA.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_COBERTURA &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_COBERTURA)                     ! destroy the file manager


Hide:Relate:TIPO_COBERTURA.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('TIPO_COBERTURA')
       DbChangeTrigger.AddThread('TIPO_COBERTURA')
       DbChangeTrigger.AddItem(TIPC:IDTIPOCUBERTURA, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:IDTIPOCUBERTURA)) , 'TIPO_COBERTURA')
       DbChangeTrigger.AddItem(TIPC:IDCOBERTURA, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:IDCOBERTURA)) , 'TIPO_COBERTURA')
       DbChangeTrigger.AddItem(TIPC:ANO_MIN, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:ANO_MIN)) , 'TIPO_COBERTURA')
       DbChangeTrigger.AddItem(TIPC:ANO_MAX, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:ANO_MAX)) , 'TIPO_COBERTURA')
       DbChangeTrigger.AddItem(TIPC:DIFERENCIA_MONTO, WHO(TIPC:RECORD,WHERE(TIPC:RECORD,TIPC:DIFERENCIA_MONTO)) , 'TIPO_COBERTURA')
    END
    DbChangeTrigger.Update('TIPO_COBERTURA')


Hide:Relate:TIPO_COBERTURA.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('TIPO_COBERTURA')
        DbChangeTrigger.CheckChanges('TIPO_COBERTURA',TIPO_COBERTURA) 
     END
  RETURN ReturnValue


Hide:Relate:SQL.Init PROCEDURE()
  CODE
  _Hide:Access:SQL.Init
  SELF.Init(Access:SQL,1)


Hide:Access:SQL.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('SQL')
      DbChangeTrigger.AddThread('SQL')
      DbChangeTrigger.AddItem(SQL:VAR1, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR1)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR2, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR2)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR3, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR3)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR4, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR4)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR5, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR5)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR6, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR6)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR7, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR7)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR8, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR8)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR9, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR9)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR10, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR10)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR11, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR11)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR12, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR12)) , 'SQL')
   END
   DbChangeTrigger.Update('SQL')
  RETURN ReturnValue


Hide:Access:SQL.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SQL:Record
  SELF.FileNameValue = 'SQL'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SQL
  PARENT.Init
  Access:SQL &= SELF


Hide:Access:SQL.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('SQL',SQL)
  RETURN ReturnValue


Hide:Access:SQL.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SQL &= NULL                                       ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SQL.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('SQL')
      DbChangeTrigger.AddThread('SQL')
      DbChangeTrigger.AddItem(SQL:VAR1, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR1)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR2, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR2)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR3, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR3)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR4, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR4)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR5, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR5)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR6, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR6)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR7, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR7)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR8, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR8)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR9, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR9)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR10, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR10)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR11, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR11)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR12, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR12)) , 'SQL')
   END
   DbChangeTrigger.Update('SQL')
  RETURN ReturnValue


Hide:Access:SQL.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('SQL')
      DbChangeTrigger.AddThread('SQL')
      DbChangeTrigger.AddItem(SQL:VAR1, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR1)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR2, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR2)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR3, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR3)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR4, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR4)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR5, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR5)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR6, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR6)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR7, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR7)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR8, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR8)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR9, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR9)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR10, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR10)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR11, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR11)) , 'SQL')
      DbChangeTrigger.AddItem(SQL:VAR12, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR12)) , 'SQL')
   END
   DbChangeTrigger.Update('SQL')
  RETURN ReturnValue


Hide:Access:SQL.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('SQL')
       DbChangeTrigger.CheckChanges('SQL',SQL) 
    END
  RETURN ReturnValue


Hide:Access:SQL.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SQL,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SQL.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('SQL',SQL)
  RETURN ReturnValue


Hide:Relate:SQL.Kill PROCEDURE

  CODE
  _Hide:Access:SQL.Kill                                    ! Kill the file manager
  PARENT.Kill
  Relate:SQL &= NULL                                       ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SQL)                                ! destroy the file manager


Hide:Relate:SQL.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('SQL')
       DbChangeTrigger.AddThread('SQL')
       DbChangeTrigger.AddItem(SQL:VAR1, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR1)) , 'SQL')
       DbChangeTrigger.AddItem(SQL:VAR2, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR2)) , 'SQL')
       DbChangeTrigger.AddItem(SQL:VAR3, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR3)) , 'SQL')
       DbChangeTrigger.AddItem(SQL:VAR4, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR4)) , 'SQL')
       DbChangeTrigger.AddItem(SQL:VAR5, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR5)) , 'SQL')
       DbChangeTrigger.AddItem(SQL:VAR6, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR6)) , 'SQL')
       DbChangeTrigger.AddItem(SQL:VAR7, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR7)) , 'SQL')
       DbChangeTrigger.AddItem(SQL:VAR8, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR8)) , 'SQL')
       DbChangeTrigger.AddItem(SQL:VAR9, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR9)) , 'SQL')
       DbChangeTrigger.AddItem(SQL:VAR10, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR10)) , 'SQL')
       DbChangeTrigger.AddItem(SQL:VAR11, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR11)) , 'SQL')
       DbChangeTrigger.AddItem(SQL:VAR12, WHO(SQL:RECORD,WHERE(SQL:RECORD,SQL:VAR12)) , 'SQL')
    END
    DbChangeTrigger.Update('SQL')


Hide:Relate:SQL.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('SQL')
        DbChangeTrigger.CheckChanges('SQL',SQL) 
     END
  RETURN ReturnValue


Hide:Relate:PAGO_CONVENIO.Init PROCEDURE()
  CODE
  _Hide:Access:PAGO_CONVENIO.Init
  SELF.Init(Access:PAGO_CONVENIO,1)


Hide:Access:PAGO_CONVENIO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('PAGO_CONVENIO')
      DbChangeTrigger.AddThread('PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDPAGO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDPAGO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDSOCIO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDSOCIO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDSOLICITUD, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDSOLICITUD)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:MONTO_CUOTA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:MONTO_CUOTA)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:NRO_CUOTA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:NRO_CUOTA)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:MES, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:MES)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:ANO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:ANO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:PERIODO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:PERIODO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:OBSERVACION, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:OBSERVACION)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:FECHA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:FECHA)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:HORA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:HORA)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDUSUARIO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDUSUARIO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDSUCURSAL, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDSUCURSAL)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDRECIBO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDRECIBO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:INTERES, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:INTERES)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDSUBCUENTA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDSUBCUENTA)) , 'PAGO_CONVENIO')
   END
   DbChangeTrigger.Update('PAGO_CONVENIO')
  RETURN ReturnValue


Hide:Access:PAGO_CONVENIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PAGCON:Record
  SELF.FileNameValue = 'PAGO_CONVENIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PAGO_CONVENIO
  PARENT.Init
  Access:PAGO_CONVENIO &= SELF


Hide:Access:PAGO_CONVENIO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('PAGO_CONVENIO',PAGO_CONVENIO)
  RETURN ReturnValue


Hide:Access:PAGO_CONVENIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PAGO_CONVENIO &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PAGO_CONVENIO.PrimeFields PROCEDURE

  CODE
  PAGCON:IDSUBCUENTA = 1                                   ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:PAGO_CONVENIO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('PAGO_CONVENIO')
      DbChangeTrigger.AddThread('PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDPAGO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDPAGO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDSOCIO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDSOCIO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDSOLICITUD, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDSOLICITUD)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:MONTO_CUOTA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:MONTO_CUOTA)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:NRO_CUOTA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:NRO_CUOTA)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:MES, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:MES)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:ANO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:ANO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:PERIODO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:PERIODO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:OBSERVACION, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:OBSERVACION)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:FECHA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:FECHA)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:HORA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:HORA)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDUSUARIO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDUSUARIO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDSUCURSAL, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDSUCURSAL)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDRECIBO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDRECIBO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:INTERES, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:INTERES)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDSUBCUENTA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDSUBCUENTA)) , 'PAGO_CONVENIO')
   END
   DbChangeTrigger.Update('PAGO_CONVENIO')
  RETURN ReturnValue


Hide:Access:PAGO_CONVENIO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('PAGO_CONVENIO')
      DbChangeTrigger.AddThread('PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDPAGO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDPAGO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDSOCIO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDSOCIO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDSOLICITUD, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDSOLICITUD)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:MONTO_CUOTA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:MONTO_CUOTA)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:NRO_CUOTA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:NRO_CUOTA)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:MES, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:MES)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:ANO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:ANO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:PERIODO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:PERIODO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:OBSERVACION, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:OBSERVACION)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:FECHA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:FECHA)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:HORA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:HORA)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDUSUARIO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDUSUARIO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDSUCURSAL, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDSUCURSAL)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDRECIBO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDRECIBO)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:INTERES, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:INTERES)) , 'PAGO_CONVENIO')
      DbChangeTrigger.AddItem(PAGCON:IDSUBCUENTA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDSUBCUENTA)) , 'PAGO_CONVENIO')
   END
   DbChangeTrigger.Update('PAGO_CONVENIO')
  RETURN ReturnValue


Hide:Access:PAGO_CONVENIO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('PAGO_CONVENIO')
       DbChangeTrigger.CheckChanges('PAGO_CONVENIO',PAGO_CONVENIO) 
    END
  RETURN ReturnValue


Hide:Access:PAGO_CONVENIO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PAGO_CONVENIO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PAGCON:PK_PAGO_CONVENIO,'PAGCON:PK_PAGO_CONVENIO',0)
    SELF.AddKey(PAGCON:FK_PAGO_CONVENIO_SOCIO,'PAGCON:FK_PAGO_CONVENIO_SOCIO',0)
    SELF.AddKey(PAGCON:IDX_PAGO_CONVENIO_UNIQUE,'PAGCON:IDX_PAGO_CONVENIO_UNIQUE',0)
    SELF.AddKey(PAGCON:FK_PAGO_CONVENIO_CONVENIO,'PAGCON:FK_PAGO_CONVENIO_CONVENIO',0)
    SELF.AddKey(PAGCON:FK_PAGO_CONVENIO_USUARIO,'PAGCON:FK_PAGO_CONVENIO_USUARIO',0)
    SELF.AddKey(PAGCON:IDX_PAGO_CONVENIO_PERIODO,'PAGCON:IDX_PAGO_CONVENIO_PERIODO',0)
    SELF.AddKey(PAGCON:IDX_PAGO_CONVENIO_FECHA,'PAGCON:IDX_PAGO_CONVENIO_FECHA',0)
    SELF.AddKey(PAGCON:FK_PAGO_CONVENIO_SUBCUENTA,'PAGCON:FK_PAGO_CONVENIO_SUBCUENTA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:PAGO_CONVENIO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS2       USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('PAGCON:IDSOCIO')
    Save:SOCIOS2 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = PAGCON:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS2)
  END
  RETURN ReturnValue


Hide:Relate:PAGO_CONVENIO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CONVENIO)

  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:USUARIO)

  SELF.AddRelation(Relate:SUBCUENTAS)


Hide:Relate:PAGO_CONVENIO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('PAGO_CONVENIO',PAGO_CONVENIO)
  RETURN ReturnValue


Hide:Relate:PAGO_CONVENIO.Kill PROCEDURE

  CODE
  _Hide:Access:PAGO_CONVENIO.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:PAGO_CONVENIO &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PAGO_CONVENIO)                      ! destroy the file manager


Hide:Relate:PAGO_CONVENIO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('PAGO_CONVENIO')
       DbChangeTrigger.AddThread('PAGO_CONVENIO')
       DbChangeTrigger.AddItem(PAGCON:IDPAGO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDPAGO)) , 'PAGO_CONVENIO')
       DbChangeTrigger.AddItem(PAGCON:IDSOCIO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDSOCIO)) , 'PAGO_CONVENIO')
       DbChangeTrigger.AddItem(PAGCON:IDSOLICITUD, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDSOLICITUD)) , 'PAGO_CONVENIO')
       DbChangeTrigger.AddItem(PAGCON:MONTO_CUOTA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:MONTO_CUOTA)) , 'PAGO_CONVENIO')
       DbChangeTrigger.AddItem(PAGCON:NRO_CUOTA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:NRO_CUOTA)) , 'PAGO_CONVENIO')
       DbChangeTrigger.AddItem(PAGCON:MES, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:MES)) , 'PAGO_CONVENIO')
       DbChangeTrigger.AddItem(PAGCON:ANO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:ANO)) , 'PAGO_CONVENIO')
       DbChangeTrigger.AddItem(PAGCON:PERIODO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:PERIODO)) , 'PAGO_CONVENIO')
       DbChangeTrigger.AddItem(PAGCON:OBSERVACION, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:OBSERVACION)) , 'PAGO_CONVENIO')
       DbChangeTrigger.AddItem(PAGCON:FECHA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:FECHA)) , 'PAGO_CONVENIO')
       DbChangeTrigger.AddItem(PAGCON:HORA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:HORA)) , 'PAGO_CONVENIO')
       DbChangeTrigger.AddItem(PAGCON:IDUSUARIO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDUSUARIO)) , 'PAGO_CONVENIO')
       DbChangeTrigger.AddItem(PAGCON:IDSUCURSAL, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDSUCURSAL)) , 'PAGO_CONVENIO')
       DbChangeTrigger.AddItem(PAGCON:IDRECIBO, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDRECIBO)) , 'PAGO_CONVENIO')
       DbChangeTrigger.AddItem(PAGCON:INTERES, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:INTERES)) , 'PAGO_CONVENIO')
       DbChangeTrigger.AddItem(PAGCON:IDSUBCUENTA, WHO(PAGCON:RECORD,WHERE(PAGCON:RECORD,PAGCON:IDSUBCUENTA)) , 'PAGO_CONVENIO')
    END
    DbChangeTrigger.Update('PAGO_CONVENIO')


Hide:Relate:PAGO_CONVENIO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('PAGO_CONVENIO')
        DbChangeTrigger.CheckChanges('PAGO_CONVENIO',PAGO_CONVENIO) 
     END
  RETURN ReturnValue


Hide:Relate:CONSULTRIO_ADHERENTE.Init PROCEDURE()
  CODE
  _Hide:Access:CONSULTRIO_ADHERENTE.Init
  SELF.Init(Access:CONSULTRIO_ADHERENTE,1)


Hide:Access:CONSULTRIO_ADHERENTE.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddThread('CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:IDCONSUL_ADE, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:IDCONSUL_ADE)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:IDCONSULTORIO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:IDCONSULTORIO)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:IDSOCIO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:IDSOCIO)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:NRO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:NRO)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:FECHA, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:FECHA)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:FOLIO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:FOLIO)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:LIBRO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:LIBRO)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:TELEFONO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:TELEFONO)) , 'CONSULTRIO_ADHERENTE')
   END
   DbChangeTrigger.Update('CONSULTRIO_ADHERENTE')
  RETURN ReturnValue


Hide:Access:CONSULTRIO_ADHERENTE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CON1:Record
  SELF.FileNameValue = 'CONSULTRIO_ADHERENTE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CONSULTRIO_ADHERENTE
  PARENT.Init
  Access:CONSULTRIO_ADHERENTE &= SELF


Hide:Access:CONSULTRIO_ADHERENTE.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CONSULTRIO_ADHERENTE',CONSULTRIO_ADHERENTE)
  RETURN ReturnValue


Hide:Access:CONSULTRIO_ADHERENTE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CONSULTRIO_ADHERENTE &= NULL                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CONSULTRIO_ADHERENTE.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddThread('CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:IDCONSUL_ADE, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:IDCONSUL_ADE)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:IDCONSULTORIO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:IDCONSULTORIO)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:IDSOCIO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:IDSOCIO)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:NRO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:NRO)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:FECHA, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:FECHA)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:FOLIO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:FOLIO)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:LIBRO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:LIBRO)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:TELEFONO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:TELEFONO)) , 'CONSULTRIO_ADHERENTE')
   END
   DbChangeTrigger.Update('CONSULTRIO_ADHERENTE')
  RETURN ReturnValue


Hide:Access:CONSULTRIO_ADHERENTE.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddThread('CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:IDCONSUL_ADE, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:IDCONSUL_ADE)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:IDCONSULTORIO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:IDCONSULTORIO)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:IDSOCIO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:IDSOCIO)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:NRO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:NRO)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:FECHA, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:FECHA)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:FOLIO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:FOLIO)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:LIBRO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:LIBRO)) , 'CONSULTRIO_ADHERENTE')
      DbChangeTrigger.AddItem(CON1:TELEFONO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:TELEFONO)) , 'CONSULTRIO_ADHERENTE')
   END
   DbChangeTrigger.Update('CONSULTRIO_ADHERENTE')
  RETURN ReturnValue


Hide:Access:CONSULTRIO_ADHERENTE.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CONSULTRIO_ADHERENTE')
       DbChangeTrigger.CheckChanges('CONSULTRIO_ADHERENTE',CONSULTRIO_ADHERENTE) 
    END
  RETURN ReturnValue


Hide:Access:CONSULTRIO_ADHERENTE.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CONSULTRIO_ADHERENTE,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CON1:FK_CONSULTRIO_ADHERENTE_CONSUL,'CON1:FK_CONSULTRIO_ADHERENTE_CONSUL',0)
    SELF.AddKey(CON1:FK_CONSULTRIO_ADHERENTE_SOCIO,'CON1:FK_CONSULTRIO_ADHERENTE_SOCIO',0)
    SELF.AddKey(CON1:IDX_CONSULTORIO_ADHERENTE_UNIQU,'CON1:IDX_CONSULTORIO_ADHERENTE_UNIQU',0)
    SELF.AddKey(CON1:PK_CONSULTRIO_ADHERENTE,'CON1:PK_CONSULTRIO_ADHERENTE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CONSULTRIO_ADHERENTE.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:CONSULTORIO2  USHORT,AUTO
Save:SOCIOS3       USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('CON1:IDCONSULTORIO')
    Save:CONSULTORIO2 = Access:CONSULTORIO.SaveFile()
    CON2:IDCONSULTORIO = CON1:IDCONSULTORIO
    ReturnValue = Access:CONSULTORIO.TryFetch(CON2:PK_CONSULTORIO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CONSULTORIO')
      END
    END
    Access:CONSULTORIO.RestoreFile(Save:CONSULTORIO2)
  OF 3
    GlobalErrors.SetField('CON1:IDSOCIO')
    Save:SOCIOS3 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = CON1:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS3)
  END
  RETURN ReturnValue


Hide:Relate:CONSULTRIO_ADHERENTE.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CONSULTORIO)

  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:SOCIOSAlias)


Hide:Relate:CONSULTRIO_ADHERENTE.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CONSULTRIO_ADHERENTE',CONSULTRIO_ADHERENTE)
  RETURN ReturnValue


Hide:Relate:CONSULTRIO_ADHERENTE.Kill PROCEDURE

  CODE
  _Hide:Access:CONSULTRIO_ADHERENTE.Kill                   ! Kill the file manager
  PARENT.Kill
  Relate:CONSULTRIO_ADHERENTE &= NULL                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CONSULTRIO_ADHERENTE)               ! destroy the file manager


Hide:Relate:CONSULTRIO_ADHERENTE.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CONSULTRIO_ADHERENTE')
       DbChangeTrigger.AddThread('CONSULTRIO_ADHERENTE')
       DbChangeTrigger.AddItem(CON1:IDCONSUL_ADE, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:IDCONSUL_ADE)) , 'CONSULTRIO_ADHERENTE')
       DbChangeTrigger.AddItem(CON1:IDCONSULTORIO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:IDCONSULTORIO)) , 'CONSULTRIO_ADHERENTE')
       DbChangeTrigger.AddItem(CON1:IDSOCIO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:IDSOCIO)) , 'CONSULTRIO_ADHERENTE')
       DbChangeTrigger.AddItem(CON1:NRO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:NRO)) , 'CONSULTRIO_ADHERENTE')
       DbChangeTrigger.AddItem(CON1:FECHA, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:FECHA)) , 'CONSULTRIO_ADHERENTE')
       DbChangeTrigger.AddItem(CON1:FOLIO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:FOLIO)) , 'CONSULTRIO_ADHERENTE')
       DbChangeTrigger.AddItem(CON1:LIBRO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:LIBRO)) , 'CONSULTRIO_ADHERENTE')
       DbChangeTrigger.AddItem(CON1:TELEFONO, WHO(CON1:RECORD,WHERE(CON1:RECORD,CON1:TELEFONO)) , 'CONSULTRIO_ADHERENTE')
    END
    DbChangeTrigger.Update('CONSULTRIO_ADHERENTE')


Hide:Relate:CONSULTRIO_ADHERENTE.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CONSULTRIO_ADHERENTE')
        DbChangeTrigger.CheckChanges('CONSULTRIO_ADHERENTE',CONSULTRIO_ADHERENTE) 
     END
  RETURN ReturnValue


Hide:Relate:AUDITORIA.Init PROCEDURE()
  CODE
  _Hide:Access:AUDITORIA.Init
  SELF.Init(Access:AUDITORIA,1)


Hide:Access:AUDITORIA.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('AUDITORIA')
      DbChangeTrigger.AddThread('AUDITORIA')
      DbChangeTrigger.AddItem(AUD:IDAUDITORIA, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:IDAUDITORIA)) , 'AUDITORIA')
      DbChangeTrigger.AddItem(AUD:ACCION, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:ACCION)) , 'AUDITORIA')
      DbChangeTrigger.AddItem(AUD:IDSOCIO, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:IDSOCIO)) , 'AUDITORIA')
      DbChangeTrigger.AddItem(AUD:FECHA, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:FECHA)) , 'AUDITORIA')
      DbChangeTrigger.AddItem(AUD:HORA, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:HORA)) , 'AUDITORIA')
      DbChangeTrigger.AddItem(AUD:IDUSUARIO, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:IDUSUARIO)) , 'AUDITORIA')
   END
   DbChangeTrigger.Update('AUDITORIA')
  RETURN ReturnValue


Hide:Access:AUDITORIA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AUD:Record
  SELF.FileNameValue = 'AUDITORIA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AUDITORIA
  PARENT.Init
  Access:AUDITORIA &= SELF


Hide:Access:AUDITORIA.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('AUDITORIA',AUDITORIA)
  RETURN ReturnValue


Hide:Access:AUDITORIA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AUDITORIA &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AUDITORIA.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('AUDITORIA')
      DbChangeTrigger.AddThread('AUDITORIA')
      DbChangeTrigger.AddItem(AUD:IDAUDITORIA, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:IDAUDITORIA)) , 'AUDITORIA')
      DbChangeTrigger.AddItem(AUD:ACCION, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:ACCION)) , 'AUDITORIA')
      DbChangeTrigger.AddItem(AUD:IDSOCIO, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:IDSOCIO)) , 'AUDITORIA')
      DbChangeTrigger.AddItem(AUD:FECHA, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:FECHA)) , 'AUDITORIA')
      DbChangeTrigger.AddItem(AUD:HORA, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:HORA)) , 'AUDITORIA')
      DbChangeTrigger.AddItem(AUD:IDUSUARIO, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:IDUSUARIO)) , 'AUDITORIA')
   END
   DbChangeTrigger.Update('AUDITORIA')
  RETURN ReturnValue


Hide:Access:AUDITORIA.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('AUDITORIA')
      DbChangeTrigger.AddThread('AUDITORIA')
      DbChangeTrigger.AddItem(AUD:IDAUDITORIA, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:IDAUDITORIA)) , 'AUDITORIA')
      DbChangeTrigger.AddItem(AUD:ACCION, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:ACCION)) , 'AUDITORIA')
      DbChangeTrigger.AddItem(AUD:IDSOCIO, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:IDSOCIO)) , 'AUDITORIA')
      DbChangeTrigger.AddItem(AUD:FECHA, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:FECHA)) , 'AUDITORIA')
      DbChangeTrigger.AddItem(AUD:HORA, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:HORA)) , 'AUDITORIA')
      DbChangeTrigger.AddItem(AUD:IDUSUARIO, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:IDUSUARIO)) , 'AUDITORIA')
   END
   DbChangeTrigger.Update('AUDITORIA')
  RETURN ReturnValue


Hide:Access:AUDITORIA.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('AUDITORIA')
       DbChangeTrigger.CheckChanges('AUDITORIA',AUDITORIA) 
    END
  RETURN ReturnValue


Hide:Access:AUDITORIA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AUDITORIA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AUD:PK_AUDITORIA,'AUD:PK_AUDITORIA',0)
    SELF.AddKey(AUD:FK_AUDITORIA_SOCIOS,'AUD:FK_AUDITORIA_SOCIOS',0)
    SELF.AddKey(AUD:FK_AUDITORIA_USUARIO,'AUD:FK_AUDITORIA_USUARIO',0)
    SELF.AddKey(AUD:IDX_AUDITRIA_ACCION,'AUD:IDX_AUDITRIA_ACCION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:AUDITORIA.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS3       USHORT,AUTO
Save:USUARIO6      USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('AUD:IDSOCIO')
    Save:SOCIOS3 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = AUD:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS3)
  OF 6
    GlobalErrors.SetField('AUD:IDUSUARIO')
    Save:USUARIO6 = Access:USUARIO.SaveFile()
    USU:IDUSUARIO = AUD:IDUSUARIO
    ReturnValue = Access:USUARIO.TryFetch(USU:PK_USUARIO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'USUARIO')
      END
    END
    Access:USUARIO.RestoreFile(Save:USUARIO6)
  END
  RETURN ReturnValue


Hide:Relate:AUDITORIA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:USUARIO)


Hide:Relate:AUDITORIA.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('AUDITORIA',AUDITORIA)
  RETURN ReturnValue


Hide:Relate:AUDITORIA.Kill PROCEDURE

  CODE
  _Hide:Access:AUDITORIA.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:AUDITORIA &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AUDITORIA)                          ! destroy the file manager


Hide:Relate:AUDITORIA.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('AUDITORIA')
       DbChangeTrigger.AddThread('AUDITORIA')
       DbChangeTrigger.AddItem(AUD:IDAUDITORIA, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:IDAUDITORIA)) , 'AUDITORIA')
       DbChangeTrigger.AddItem(AUD:ACCION, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:ACCION)) , 'AUDITORIA')
       DbChangeTrigger.AddItem(AUD:IDSOCIO, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:IDSOCIO)) , 'AUDITORIA')
       DbChangeTrigger.AddItem(AUD:FECHA, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:FECHA)) , 'AUDITORIA')
       DbChangeTrigger.AddItem(AUD:HORA, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:HORA)) , 'AUDITORIA')
       DbChangeTrigger.AddItem(AUD:IDUSUARIO, WHO(AUD:RECORD,WHERE(AUD:RECORD,AUD:IDUSUARIO)) , 'AUDITORIA')
    END
    DbChangeTrigger.Update('AUDITORIA')


Hide:Relate:AUDITORIA.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('AUDITORIA')
        DbChangeTrigger.CheckChanges('AUDITORIA',AUDITORIA) 
     END
  RETURN ReturnValue


Hide:Relate:CONTROL_LIQUIDACION.Init PROCEDURE()
  CODE
  _Hide:Access:CONTROL_LIQUIDACION.Init
  SELF.Init(Access:CONTROL_LIQUIDACION,1)


Hide:Access:CONTROL_LIQUIDACION.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CONTROL_LIQUIDACION')
      DbChangeTrigger.AddThread('CONTROL_LIQUIDACION')
      DbChangeTrigger.AddItem(CON31:IDSOCIO, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:IDSOCIO)) , 'CONTROL_LIQUIDACION')
      DbChangeTrigger.AddItem(CON31:MES, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:MES)) , 'CONTROL_LIQUIDACION')
      DbChangeTrigger.AddItem(CON31:ANO, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:ANO)) , 'CONTROL_LIQUIDACION')
      DbChangeTrigger.AddItem(CON31:PERIODO, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:PERIODO)) , 'CONTROL_LIQUIDACION')
      DbChangeTrigger.AddItem(CON31:NUMERO, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:NUMERO)) , 'CONTROL_LIQUIDACION')
   END
   DbChangeTrigger.Update('CONTROL_LIQUIDACION')
  RETURN ReturnValue


Hide:Access:CONTROL_LIQUIDACION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CON31:Record
  SELF.FileNameValue = 'CONTROL_LIQUIDACION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CONTROL_LIQUIDACION
  PARENT.Init
  Access:CONTROL_LIQUIDACION &= SELF


Hide:Access:CONTROL_LIQUIDACION.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CONTROL_LIQUIDACION',CONTROL_LIQUIDACION)
  RETURN ReturnValue


Hide:Access:CONTROL_LIQUIDACION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CONTROL_LIQUIDACION &= NULL                       ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CONTROL_LIQUIDACION.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CONTROL_LIQUIDACION')
      DbChangeTrigger.AddThread('CONTROL_LIQUIDACION')
      DbChangeTrigger.AddItem(CON31:IDSOCIO, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:IDSOCIO)) , 'CONTROL_LIQUIDACION')
      DbChangeTrigger.AddItem(CON31:MES, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:MES)) , 'CONTROL_LIQUIDACION')
      DbChangeTrigger.AddItem(CON31:ANO, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:ANO)) , 'CONTROL_LIQUIDACION')
      DbChangeTrigger.AddItem(CON31:PERIODO, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:PERIODO)) , 'CONTROL_LIQUIDACION')
      DbChangeTrigger.AddItem(CON31:NUMERO, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:NUMERO)) , 'CONTROL_LIQUIDACION')
   END
   DbChangeTrigger.Update('CONTROL_LIQUIDACION')
  RETURN ReturnValue


Hide:Access:CONTROL_LIQUIDACION.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CONTROL_LIQUIDACION')
      DbChangeTrigger.AddThread('CONTROL_LIQUIDACION')
      DbChangeTrigger.AddItem(CON31:IDSOCIO, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:IDSOCIO)) , 'CONTROL_LIQUIDACION')
      DbChangeTrigger.AddItem(CON31:MES, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:MES)) , 'CONTROL_LIQUIDACION')
      DbChangeTrigger.AddItem(CON31:ANO, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:ANO)) , 'CONTROL_LIQUIDACION')
      DbChangeTrigger.AddItem(CON31:PERIODO, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:PERIODO)) , 'CONTROL_LIQUIDACION')
      DbChangeTrigger.AddItem(CON31:NUMERO, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:NUMERO)) , 'CONTROL_LIQUIDACION')
   END
   DbChangeTrigger.Update('CONTROL_LIQUIDACION')
  RETURN ReturnValue


Hide:Access:CONTROL_LIQUIDACION.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CONTROL_LIQUIDACION')
       DbChangeTrigger.CheckChanges('CONTROL_LIQUIDACION',CONTROL_LIQUIDACION) 
    END
  RETURN ReturnValue


Hide:Access:CONTROL_LIQUIDACION.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CONTROL_LIQUIDACION,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CON31:PK_CONTROL_LIQUIDACION,'CON31:PK_CONTROL_LIQUIDACION',0)
    SELF.AddKey(CON31:FK_CONTROL_LIQUIDACION,'CON31:FK_CONTROL_LIQUIDACION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CONTROL_LIQUIDACION.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SOCIOS)


Hide:Relate:CONTROL_LIQUIDACION.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CONTROL_LIQUIDACION',CONTROL_LIQUIDACION)
  RETURN ReturnValue


Hide:Relate:CONTROL_LIQUIDACION.Kill PROCEDURE

  CODE
  _Hide:Access:CONTROL_LIQUIDACION.Kill                    ! Kill the file manager
  PARENT.Kill
  Relate:CONTROL_LIQUIDACION &= NULL                       ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CONTROL_LIQUIDACION)                ! destroy the file manager


Hide:Relate:CONTROL_LIQUIDACION.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CONTROL_LIQUIDACION')
       DbChangeTrigger.AddThread('CONTROL_LIQUIDACION')
       DbChangeTrigger.AddItem(CON31:IDSOCIO, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:IDSOCIO)) , 'CONTROL_LIQUIDACION')
       DbChangeTrigger.AddItem(CON31:MES, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:MES)) , 'CONTROL_LIQUIDACION')
       DbChangeTrigger.AddItem(CON31:ANO, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:ANO)) , 'CONTROL_LIQUIDACION')
       DbChangeTrigger.AddItem(CON31:PERIODO, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:PERIODO)) , 'CONTROL_LIQUIDACION')
       DbChangeTrigger.AddItem(CON31:NUMERO, WHO(CON31:RECORD,WHERE(CON31:RECORD,CON31:NUMERO)) , 'CONTROL_LIQUIDACION')
    END
    DbChangeTrigger.Update('CONTROL_LIQUIDACION')


Hide:Relate:CONTROL_LIQUIDACION.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CONTROL_LIQUIDACION')
        DbChangeTrigger.CheckChanges('CONTROL_LIQUIDACION',CONTROL_LIQUIDACION) 
     END
  RETURN ReturnValue


Hide:Relate:EMAIL.Init PROCEDURE()
  CODE
  _Hide:Access:EMAIL.Init
  SELF.Init(Access:EMAIL,1)


Hide:Access:EMAIL.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('EMAIL')
      DbChangeTrigger.AddThread('EMAIL')
      DbChangeTrigger.AddItem(EMA:MENSAJE, WHO(EMA:RECORD,WHERE(EMA:RECORD,EMA:MENSAJE)) , 'EMAIL')
   END
   DbChangeTrigger.Update('EMAIL')
  RETURN ReturnValue


Hide:Access:EMAIL.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= EMA:Record
  SELF.FileNameValue = 'EMAIL'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= EMAIL
  PARENT.Init
  Access:EMAIL &= SELF


Hide:Access:EMAIL.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('EMAIL',EMAIL)
  RETURN ReturnValue


Hide:Access:EMAIL.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:EMAIL &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:EMAIL.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('EMAIL')
      DbChangeTrigger.AddThread('EMAIL')
      DbChangeTrigger.AddItem(EMA:MENSAJE, WHO(EMA:RECORD,WHERE(EMA:RECORD,EMA:MENSAJE)) , 'EMAIL')
   END
   DbChangeTrigger.Update('EMAIL')
  RETURN ReturnValue


Hide:Access:EMAIL.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('EMAIL')
      DbChangeTrigger.AddThread('EMAIL')
      DbChangeTrigger.AddItem(EMA:MENSAJE, WHO(EMA:RECORD,WHERE(EMA:RECORD,EMA:MENSAJE)) , 'EMAIL')
   END
   DbChangeTrigger.Update('EMAIL')
  RETURN ReturnValue


Hide:Access:EMAIL.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('EMAIL')
       DbChangeTrigger.CheckChanges('EMAIL',EMAIL) 
    END
  RETURN ReturnValue


Hide:Access:EMAIL.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(EMAIL,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:EMAIL.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('EMAIL',EMAIL)
  RETURN ReturnValue


Hide:Relate:EMAIL.Kill PROCEDURE

  CODE
  _Hide:Access:EMAIL.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:EMAIL &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:EMAIL)                              ! destroy the file manager


Hide:Relate:EMAIL.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('EMAIL')
       DbChangeTrigger.AddThread('EMAIL')
       DbChangeTrigger.AddItem(EMA:MENSAJE, WHO(EMA:RECORD,WHERE(EMA:RECORD,EMA:MENSAJE)) , 'EMAIL')
    END
    DbChangeTrigger.Update('EMAIL')


Hide:Relate:EMAIL.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('EMAIL')
        DbChangeTrigger.CheckChanges('EMAIL',EMAIL) 
     END
  RETURN ReturnValue

