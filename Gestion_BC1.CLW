  MEMBER('Gestion.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
Gestion_BC1:DctInit    PROCEDURE()
Gestion_BC1:DctKill    PROCEDURE()
Gestion_BC1:FilesInit  PROCEDURE()
  END

Hide:Access:RANKING  CLASS(FileManager),TYPE               ! FileManager for RANKING
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:RANKING  CLASS(RelationManager),TYPE           ! RelationManager for RANKING
Init                   PROCEDURE
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CONTROL_CUOTA CLASS(FileManager),TYPE          ! FileManager for CONTROL_CUOTA
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CONTROL_CUOTA CLASS(RelationManager),TYPE      ! RelationManager for CONTROL_CUOTA
Init                   PROCEDURE
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:EXP_CURSO_INSCRIPCION_DETALLE CLASS(FileManager),TYPE ! FileManager for EXP_CURSO_INSCRIPCION_DETALLE
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:EXP_CURSO_INSCRIPCION_DETALLE CLASS(RelationManager),TYPE ! RelationManager for EXP_CURSO_INSCRIPCION_DETALLE
Init                   PROCEDURE
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:EXP_INGRESOS CLASS(FileManager),TYPE           ! FileManager for EXP_INGRESOS
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:EXP_INGRESOS CLASS(RelationManager),TYPE       ! RelationManager for EXP_INGRESOS
Init                   PROCEDURE
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:COBERTURA CLASS(FileManager),TYPE              ! FileManager for COBERTURA
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:COBERTURA CLASS(RelationManager),TYPE          ! RelationManager for COBERTURA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CONSULTORIO CLASS(FileManager),TYPE            ! FileManager for CONSULTORIO
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


Hide:Relate:CONSULTORIO CLASS(RelationManager),TYPE        ! RelationManager for CONSULTORIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CONTROL_FACTURA CLASS(FileManager),TYPE        ! FileManager for CONTROL_FACTURA
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


Hide:Relate:CONTROL_FACTURA CLASS(RelationManager),TYPE    ! RelationManager for CONTROL_FACTURA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CONVENIO CLASS(FileManager),TYPE               ! FileManager for CONVENIO
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


Hide:Relate:CONVENIO CLASS(RelationManager),TYPE           ! RelationManager for CONVENIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CONVENIO_DETALLE CLASS(FileManager),TYPE       ! FileManager for CONVENIO_DETALLE
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


Hide:Relate:CONVENIO_DETALLE CLASS(RelationManager),TYPE   ! RelationManager for CONVENIO_DETALLE
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CV       CLASS(FileManager),TYPE               ! FileManager for CV
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


Hide:Relate:CV       CLASS(RelationManager),TYPE           ! RelationManager for CV
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:DETALLE_FACTURA CLASS(FileManager),TYPE        ! FileManager for DETALLE_FACTURA
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


Hide:Relate:DETALLE_FACTURA CLASS(RelationManager),TYPE    ! RelationManager for DETALLE_FACTURA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:ESPECIALIDAD CLASS(FileManager),TYPE           ! FileManager for ESPECIALIDAD
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ESPECIALIDAD CLASS(RelationManager),TYPE       ! RelationManager for ESPECIALIDAD
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:FACTURA  CLASS(FileManager),TYPE               ! FileManager for FACTURA
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


Hide:Relate:FACTURA  CLASS(RelationManager),TYPE           ! RelationManager for FACTURA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:INSPECTOR CLASS(FileManager),TYPE              ! FileManager for INSPECTOR
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


Hide:Relate:INSPECTOR CLASS(RelationManager),TYPE          ! RelationManager for INSPECTOR
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:INSTITUCION CLASS(FileManager),TYPE            ! FileManager for INSTITUCION
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


Hide:Relate:INSTITUCION CLASS(RelationManager),TYPE        ! RelationManager for INSTITUCION
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:TIPO_COMPROBANTE CLASS(FileManager),TYPE       ! FileManager for TIPO_COMPROBANTE
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_COMPROBANTE CLASS(RelationManager),TYPE   ! RelationManager for TIPO_COMPROBANTE
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:LOCALIDAD CLASS(FileManager),TYPE              ! FileManager for LOCALIDAD
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


Hide:Relate:LOCALIDAD CLASS(RelationManager),TYPE          ! RelationManager for LOCALIDAD
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:PADRONXESPECIALIDAD CLASS(FileManager),TYPE    ! FileManager for PADRONXESPECIALIDAD
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


Hide:Relate:PADRONXESPECIALIDAD CLASS(RelationManager),TYPE ! RelationManager for PADRONXESPECIALIDAD
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:EXP_PROVEEDORES CLASS(FileManager),TYPE        ! FileManager for EXP_PROVEEDORES
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:EXP_PROVEEDORES CLASS(RelationManager),TYPE    ! RelationManager for EXP_PROVEEDORES
Init                   PROCEDURE
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:PAGOS    CLASS(FileManager),TYPE               ! FileManager for PAGOS
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


Hide:Relate:PAGOS    CLASS(RelationManager),TYPE           ! RelationManager for PAGOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END


_Hide:Access:RANKING &Hide:Access:RANKING,AUTO,THREAD
_Hide:Relate:RANKING &Hide:Relate:RANKING,AUTO,THREAD
_Hide:Access:CONTROL_CUOTA &Hide:Access:CONTROL_CUOTA,AUTO,THREAD
_Hide:Relate:CONTROL_CUOTA &Hide:Relate:CONTROL_CUOTA,AUTO,THREAD
_Hide:Access:EXP_CURSO_INSCRIPCION_DETALLE &Hide:Access:EXP_CURSO_INSCRIPCION_DETALLE,AUTO,THREAD
_Hide:Relate:EXP_CURSO_INSCRIPCION_DETALLE &Hide:Relate:EXP_CURSO_INSCRIPCION_DETALLE,AUTO,THREAD
_Hide:Access:EXP_INGRESOS &Hide:Access:EXP_INGRESOS,AUTO,THREAD
_Hide:Relate:EXP_INGRESOS &Hide:Relate:EXP_INGRESOS,AUTO,THREAD
_Hide:Access:COBERTURA &Hide:Access:COBERTURA,AUTO,THREAD
_Hide:Relate:COBERTURA &Hide:Relate:COBERTURA,AUTO,THREAD
_Hide:Access:CONSULTORIO &Hide:Access:CONSULTORIO,AUTO,THREAD
_Hide:Relate:CONSULTORIO &Hide:Relate:CONSULTORIO,AUTO,THREAD
_Hide:Access:CONTROL_FACTURA &Hide:Access:CONTROL_FACTURA,AUTO,THREAD
_Hide:Relate:CONTROL_FACTURA &Hide:Relate:CONTROL_FACTURA,AUTO,THREAD
_Hide:Access:CONVENIO &Hide:Access:CONVENIO,AUTO,THREAD
_Hide:Relate:CONVENIO &Hide:Relate:CONVENIO,AUTO,THREAD
_Hide:Access:CONVENIO_DETALLE &Hide:Access:CONVENIO_DETALLE,AUTO,THREAD
_Hide:Relate:CONVENIO_DETALLE &Hide:Relate:CONVENIO_DETALLE,AUTO,THREAD
_Hide:Access:CV      &Hide:Access:CV,AUTO,THREAD
_Hide:Relate:CV      &Hide:Relate:CV,AUTO,THREAD
_Hide:Access:DETALLE_FACTURA &Hide:Access:DETALLE_FACTURA,AUTO,THREAD
_Hide:Relate:DETALLE_FACTURA &Hide:Relate:DETALLE_FACTURA,AUTO,THREAD
_Hide:Access:ESPECIALIDAD &Hide:Access:ESPECIALIDAD,AUTO,THREAD
_Hide:Relate:ESPECIALIDAD &Hide:Relate:ESPECIALIDAD,AUTO,THREAD
_Hide:Access:FACTURA &Hide:Access:FACTURA,AUTO,THREAD
_Hide:Relate:FACTURA &Hide:Relate:FACTURA,AUTO,THREAD
_Hide:Access:INSPECTOR &Hide:Access:INSPECTOR,AUTO,THREAD
_Hide:Relate:INSPECTOR &Hide:Relate:INSPECTOR,AUTO,THREAD
_Hide:Access:INSTITUCION &Hide:Access:INSTITUCION,AUTO,THREAD
_Hide:Relate:INSTITUCION &Hide:Relate:INSTITUCION,AUTO,THREAD
_Hide:Access:TIPO_COMPROBANTE &Hide:Access:TIPO_COMPROBANTE,AUTO,THREAD
_Hide:Relate:TIPO_COMPROBANTE &Hide:Relate:TIPO_COMPROBANTE,AUTO,THREAD
_Hide:Access:LOCALIDAD &Hide:Access:LOCALIDAD,AUTO,THREAD
_Hide:Relate:LOCALIDAD &Hide:Relate:LOCALIDAD,AUTO,THREAD
_Hide:Access:PADRONXESPECIALIDAD &Hide:Access:PADRONXESPECIALIDAD,AUTO,THREAD
_Hide:Relate:PADRONXESPECIALIDAD &Hide:Relate:PADRONXESPECIALIDAD,AUTO,THREAD
_Hide:Access:EXP_PROVEEDORES &Hide:Access:EXP_PROVEEDORES,AUTO,THREAD
_Hide:Relate:EXP_PROVEEDORES &Hide:Relate:EXP_PROVEEDORES,AUTO,THREAD
_Hide:Access:PAGOS   &Hide:Access:PAGOS,AUTO,THREAD
_Hide:Relate:PAGOS   &Hide:Relate:PAGOS,AUTO,THREAD


Gestion_BC1:DctInit PROCEDURE()
  CODE
  _Hide:Access:RANKING &= NEW(Hide:Access:RANKING)
  _Hide:Relate:RANKING &= NEW(Hide:Relate:RANKING)
  _Hide:Access:CONTROL_CUOTA &= NEW(Hide:Access:CONTROL_CUOTA)
  _Hide:Relate:CONTROL_CUOTA &= NEW(Hide:Relate:CONTROL_CUOTA)
  _Hide:Access:EXP_CURSO_INSCRIPCION_DETALLE &= NEW(Hide:Access:EXP_CURSO_INSCRIPCION_DETALLE)
  _Hide:Relate:EXP_CURSO_INSCRIPCION_DETALLE &= NEW(Hide:Relate:EXP_CURSO_INSCRIPCION_DETALLE)
  _Hide:Access:EXP_INGRESOS &= NEW(Hide:Access:EXP_INGRESOS)
  _Hide:Relate:EXP_INGRESOS &= NEW(Hide:Relate:EXP_INGRESOS)
  _Hide:Access:COBERTURA &= NEW(Hide:Access:COBERTURA)
  _Hide:Relate:COBERTURA &= NEW(Hide:Relate:COBERTURA)
  _Hide:Access:CONSULTORIO &= NEW(Hide:Access:CONSULTORIO)
  _Hide:Relate:CONSULTORIO &= NEW(Hide:Relate:CONSULTORIO)
  _Hide:Access:CONTROL_FACTURA &= NEW(Hide:Access:CONTROL_FACTURA)
  _Hide:Relate:CONTROL_FACTURA &= NEW(Hide:Relate:CONTROL_FACTURA)
  _Hide:Access:CONVENIO &= NEW(Hide:Access:CONVENIO)
  _Hide:Relate:CONVENIO &= NEW(Hide:Relate:CONVENIO)
  _Hide:Access:CONVENIO_DETALLE &= NEW(Hide:Access:CONVENIO_DETALLE)
  _Hide:Relate:CONVENIO_DETALLE &= NEW(Hide:Relate:CONVENIO_DETALLE)
  _Hide:Access:CV &= NEW(Hide:Access:CV)
  _Hide:Relate:CV &= NEW(Hide:Relate:CV)
  _Hide:Access:DETALLE_FACTURA &= NEW(Hide:Access:DETALLE_FACTURA)
  _Hide:Relate:DETALLE_FACTURA &= NEW(Hide:Relate:DETALLE_FACTURA)
  _Hide:Access:ESPECIALIDAD &= NEW(Hide:Access:ESPECIALIDAD)
  _Hide:Relate:ESPECIALIDAD &= NEW(Hide:Relate:ESPECIALIDAD)
  _Hide:Access:FACTURA &= NEW(Hide:Access:FACTURA)
  _Hide:Relate:FACTURA &= NEW(Hide:Relate:FACTURA)
  _Hide:Access:INSPECTOR &= NEW(Hide:Access:INSPECTOR)
  _Hide:Relate:INSPECTOR &= NEW(Hide:Relate:INSPECTOR)
  _Hide:Access:INSTITUCION &= NEW(Hide:Access:INSTITUCION)
  _Hide:Relate:INSTITUCION &= NEW(Hide:Relate:INSTITUCION)
  _Hide:Access:TIPO_COMPROBANTE &= NEW(Hide:Access:TIPO_COMPROBANTE)
  _Hide:Relate:TIPO_COMPROBANTE &= NEW(Hide:Relate:TIPO_COMPROBANTE)
  _Hide:Access:LOCALIDAD &= NEW(Hide:Access:LOCALIDAD)
  _Hide:Relate:LOCALIDAD &= NEW(Hide:Relate:LOCALIDAD)
  _Hide:Access:PADRONXESPECIALIDAD &= NEW(Hide:Access:PADRONXESPECIALIDAD)
  _Hide:Relate:PADRONXESPECIALIDAD &= NEW(Hide:Relate:PADRONXESPECIALIDAD)
  _Hide:Access:EXP_PROVEEDORES &= NEW(Hide:Access:EXP_PROVEEDORES)
  _Hide:Relate:EXP_PROVEEDORES &= NEW(Hide:Relate:EXP_PROVEEDORES)
  _Hide:Access:PAGOS &= NEW(Hide:Access:PAGOS)
  _Hide:Relate:PAGOS &= NEW(Hide:Relate:PAGOS)
  Relate:RANKING &= _Hide:Relate:RANKING
  Relate:CONTROL_CUOTA &= _Hide:Relate:CONTROL_CUOTA
  Relate:EXP_CURSO_INSCRIPCION_DETALLE &= _Hide:Relate:EXP_CURSO_INSCRIPCION_DETALLE
  Relate:EXP_INGRESOS &= _Hide:Relate:EXP_INGRESOS
  Relate:COBERTURA &= _Hide:Relate:COBERTURA
  Relate:CONSULTORIO &= _Hide:Relate:CONSULTORIO
  Relate:CONTROL_FACTURA &= _Hide:Relate:CONTROL_FACTURA
  Relate:CONVENIO &= _Hide:Relate:CONVENIO
  Relate:CONVENIO_DETALLE &= _Hide:Relate:CONVENIO_DETALLE
  Relate:CV &= _Hide:Relate:CV
  Relate:DETALLE_FACTURA &= _Hide:Relate:DETALLE_FACTURA
  Relate:ESPECIALIDAD &= _Hide:Relate:ESPECIALIDAD
  Relate:FACTURA &= _Hide:Relate:FACTURA
  Relate:INSPECTOR &= _Hide:Relate:INSPECTOR
  Relate:INSTITUCION &= _Hide:Relate:INSTITUCION
  Relate:TIPO_COMPROBANTE &= _Hide:Relate:TIPO_COMPROBANTE
  Relate:LOCALIDAD &= _Hide:Relate:LOCALIDAD
  Relate:PADRONXESPECIALIDAD &= _Hide:Relate:PADRONXESPECIALIDAD
  Relate:EXP_PROVEEDORES &= _Hide:Relate:EXP_PROVEEDORES
  Relate:PAGOS &= _Hide:Relate:PAGOS


Gestion_BC1:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:RANKING.Init
  _Hide:Relate:CONTROL_CUOTA.Init
  _Hide:Relate:EXP_CURSO_INSCRIPCION_DETALLE.Init
  _Hide:Relate:EXP_INGRESOS.Init
  _Hide:Relate:COBERTURA.Init
  _Hide:Relate:CONSULTORIO.Init
  _Hide:Relate:CONTROL_FACTURA.Init
  _Hide:Relate:CONVENIO.Init
  _Hide:Relate:CONVENIO_DETALLE.Init
  _Hide:Relate:CV.Init
  _Hide:Relate:DETALLE_FACTURA.Init
  _Hide:Relate:ESPECIALIDAD.Init
  _Hide:Relate:FACTURA.Init
  _Hide:Relate:INSPECTOR.Init
  _Hide:Relate:INSTITUCION.Init
  _Hide:Relate:TIPO_COMPROBANTE.Init
  _Hide:Relate:LOCALIDAD.Init
  _Hide:Relate:PADRONXESPECIALIDAD.Init
  _Hide:Relate:EXP_PROVEEDORES.Init
  _Hide:Relate:PAGOS.Init


Gestion_BC1:DctKill PROCEDURE()
  CODE
  _Hide:Relate:RANKING.Kill
  DISPOSE(_Hide:Relate:RANKING)
  _Hide:Relate:CONTROL_CUOTA.Kill
  DISPOSE(_Hide:Relate:CONTROL_CUOTA)
  _Hide:Relate:EXP_CURSO_INSCRIPCION_DETALLE.Kill
  DISPOSE(_Hide:Relate:EXP_CURSO_INSCRIPCION_DETALLE)
  _Hide:Relate:EXP_INGRESOS.Kill
  DISPOSE(_Hide:Relate:EXP_INGRESOS)
  _Hide:Relate:COBERTURA.Kill
  DISPOSE(_Hide:Relate:COBERTURA)
  _Hide:Relate:CONSULTORIO.Kill
  DISPOSE(_Hide:Relate:CONSULTORIO)
  _Hide:Relate:CONTROL_FACTURA.Kill
  DISPOSE(_Hide:Relate:CONTROL_FACTURA)
  _Hide:Relate:CONVENIO.Kill
  DISPOSE(_Hide:Relate:CONVENIO)
  _Hide:Relate:CONVENIO_DETALLE.Kill
  DISPOSE(_Hide:Relate:CONVENIO_DETALLE)
  _Hide:Relate:CV.Kill
  DISPOSE(_Hide:Relate:CV)
  _Hide:Relate:DETALLE_FACTURA.Kill
  DISPOSE(_Hide:Relate:DETALLE_FACTURA)
  _Hide:Relate:ESPECIALIDAD.Kill
  DISPOSE(_Hide:Relate:ESPECIALIDAD)
  _Hide:Relate:FACTURA.Kill
  DISPOSE(_Hide:Relate:FACTURA)
  _Hide:Relate:INSPECTOR.Kill
  DISPOSE(_Hide:Relate:INSPECTOR)
  _Hide:Relate:INSTITUCION.Kill
  DISPOSE(_Hide:Relate:INSTITUCION)
  _Hide:Relate:TIPO_COMPROBANTE.Kill
  DISPOSE(_Hide:Relate:TIPO_COMPROBANTE)
  _Hide:Relate:LOCALIDAD.Kill
  DISPOSE(_Hide:Relate:LOCALIDAD)
  _Hide:Relate:PADRONXESPECIALIDAD.Kill
  DISPOSE(_Hide:Relate:PADRONXESPECIALIDAD)
  _Hide:Relate:EXP_PROVEEDORES.Kill
  DISPOSE(_Hide:Relate:EXP_PROVEEDORES)
  _Hide:Relate:PAGOS.Kill
  DISPOSE(_Hide:Relate:PAGOS)


Hide:Relate:RANKING.Init PROCEDURE()
  CODE
  _Hide:Access:RANKING.Init
  SELF.Init(Access:RANKING,1)


Hide:Access:RANKING.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('RANKING')
      DbChangeTrigger.AddThread('RANKING')
      DbChangeTrigger.AddItem(RAN:C1, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C1)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C2, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C2)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C3, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C3)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C4, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C4)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C5, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C5)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C6, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C6)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C7, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C7)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C8, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C8)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C9, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C9)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C10, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C10)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C11, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C11)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C12, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C12)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:CANTIDAD, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:CANTIDAD)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:IMPORTE, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:IMPORTE)) , 'RANKING')
   END
   DbChangeTrigger.Update('RANKING')
  RETURN ReturnValue


Hide:Access:RANKING.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RAN:Record
  SELF.FileNameValue = 'RANKING'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RANKING
  PARENT.Init
  Access:RANKING &= SELF


Hide:Access:RANKING.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('RANKING',RANKING)
  RETURN ReturnValue


Hide:Access:RANKING.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RANKING &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RANKING.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('RANKING')
      DbChangeTrigger.AddThread('RANKING')
      DbChangeTrigger.AddItem(RAN:C1, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C1)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C2, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C2)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C3, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C3)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C4, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C4)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C5, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C5)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C6, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C6)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C7, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C7)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C8, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C8)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C9, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C9)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C10, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C10)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C11, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C11)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C12, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C12)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:CANTIDAD, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:CANTIDAD)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:IMPORTE, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:IMPORTE)) , 'RANKING')
   END
   DbChangeTrigger.Update('RANKING')
  RETURN ReturnValue


Hide:Access:RANKING.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('RANKING')
      DbChangeTrigger.AddThread('RANKING')
      DbChangeTrigger.AddItem(RAN:C1, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C1)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C2, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C2)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C3, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C3)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C4, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C4)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C5, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C5)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C6, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C6)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C7, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C7)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C8, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C8)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C9, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C9)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C10, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C10)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C11, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C11)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:C12, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C12)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:CANTIDAD, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:CANTIDAD)) , 'RANKING')
      DbChangeTrigger.AddItem(RAN:IMPORTE, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:IMPORTE)) , 'RANKING')
   END
   DbChangeTrigger.Update('RANKING')
  RETURN ReturnValue


Hide:Access:RANKING.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('RANKING')
       DbChangeTrigger.CheckChanges('RANKING',RANKING) 
    END
  RETURN ReturnValue


Hide:Access:RANKING.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RANKING,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(RAN:PK_RANKING,'RAN:PK_RANKING',0)
    SELF.AddKey(RAN:IDX_C2,'RAN:IDX_C2',0)
    SELF.AddKey(RAN:IDX_C3,'RAN:IDX_C3',0)
    SELF.AddKey(RAN:IDX_C4,'RAN:IDX_C4',0)
    SELF.AddKey(RAN:IDX_C5,'RAN:IDX_C5',0)
    SELF.AddKey(RAN:IDX_CANTIDAD,'RAN:IDX_CANTIDAD',0)
    SELF.AddKey(RAN:IDX_IMPORTE,'RAN:IDX_IMPORTE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RANKING.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('RANKING',RANKING)
  RETURN ReturnValue


Hide:Relate:RANKING.Kill PROCEDURE

  CODE
  _Hide:Access:RANKING.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:RANKING &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RANKING)                            ! destroy the file manager


Hide:Relate:RANKING.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('RANKING')
       DbChangeTrigger.AddThread('RANKING')
       DbChangeTrigger.AddItem(RAN:C1, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C1)) , 'RANKING')
       DbChangeTrigger.AddItem(RAN:C2, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C2)) , 'RANKING')
       DbChangeTrigger.AddItem(RAN:C3, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C3)) , 'RANKING')
       DbChangeTrigger.AddItem(RAN:C4, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C4)) , 'RANKING')
       DbChangeTrigger.AddItem(RAN:C5, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C5)) , 'RANKING')
       DbChangeTrigger.AddItem(RAN:C6, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C6)) , 'RANKING')
       DbChangeTrigger.AddItem(RAN:C7, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C7)) , 'RANKING')
       DbChangeTrigger.AddItem(RAN:C8, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C8)) , 'RANKING')
       DbChangeTrigger.AddItem(RAN:C9, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C9)) , 'RANKING')
       DbChangeTrigger.AddItem(RAN:C10, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C10)) , 'RANKING')
       DbChangeTrigger.AddItem(RAN:C11, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C11)) , 'RANKING')
       DbChangeTrigger.AddItem(RAN:C12, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:C12)) , 'RANKING')
       DbChangeTrigger.AddItem(RAN:CANTIDAD, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:CANTIDAD)) , 'RANKING')
       DbChangeTrigger.AddItem(RAN:IMPORTE, WHO(RAN:RECORD,WHERE(RAN:RECORD,RAN:IMPORTE)) , 'RANKING')
    END
    DbChangeTrigger.Update('RANKING')


Hide:Relate:RANKING.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('RANKING')
        DbChangeTrigger.CheckChanges('RANKING',RANKING) 
     END
  RETURN ReturnValue


Hide:Relate:CONTROL_CUOTA.Init PROCEDURE()
  CODE
  _Hide:Access:CONTROL_CUOTA.Init
  SELF.Init(Access:CONTROL_CUOTA,1)


Hide:Access:CONTROL_CUOTA.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CONTROL_CUOTA')
      DbChangeTrigger.AddThread('CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:IDCONTROL, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:IDCONTROL)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:ANO, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:ANO)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:CANT_CUOTAS_MAX, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:CANT_CUOTAS_MAX)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:FECHA_TOPE_PAGO, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:FECHA_TOPE_PAGO)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:DESCUENTO_CUOTA, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:DESCUENTO_CUOTA)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:GENERADO, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:GENERADO)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:MONTO_ANUAL, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:MONTO_ANUAL)) , 'CONTROL_CUOTA')
   END
   DbChangeTrigger.Update('CONTROL_CUOTA')
  RETURN ReturnValue


Hide:Access:CONTROL_CUOTA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CONC:Record
  SELF.FileNameValue = 'CONTROL_CUOTA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CONTROL_CUOTA
  PARENT.Init
  Access:CONTROL_CUOTA &= SELF


Hide:Access:CONTROL_CUOTA.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CONTROL_CUOTA',CONTROL_CUOTA)
  RETURN ReturnValue


Hide:Access:CONTROL_CUOTA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CONTROL_CUOTA &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CONTROL_CUOTA.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CONTROL_CUOTA')
      DbChangeTrigger.AddThread('CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:IDCONTROL, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:IDCONTROL)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:ANO, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:ANO)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:CANT_CUOTAS_MAX, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:CANT_CUOTAS_MAX)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:FECHA_TOPE_PAGO, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:FECHA_TOPE_PAGO)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:DESCUENTO_CUOTA, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:DESCUENTO_CUOTA)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:GENERADO, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:GENERADO)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:MONTO_ANUAL, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:MONTO_ANUAL)) , 'CONTROL_CUOTA')
   END
   DbChangeTrigger.Update('CONTROL_CUOTA')
  RETURN ReturnValue


Hide:Access:CONTROL_CUOTA.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CONTROL_CUOTA')
      DbChangeTrigger.AddThread('CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:IDCONTROL, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:IDCONTROL)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:ANO, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:ANO)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:CANT_CUOTAS_MAX, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:CANT_CUOTAS_MAX)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:FECHA_TOPE_PAGO, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:FECHA_TOPE_PAGO)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:DESCUENTO_CUOTA, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:DESCUENTO_CUOTA)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:GENERADO, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:GENERADO)) , 'CONTROL_CUOTA')
      DbChangeTrigger.AddItem(CONC:MONTO_ANUAL, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:MONTO_ANUAL)) , 'CONTROL_CUOTA')
   END
   DbChangeTrigger.Update('CONTROL_CUOTA')
  RETURN ReturnValue


Hide:Access:CONTROL_CUOTA.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CONTROL_CUOTA')
       DbChangeTrigger.CheckChanges('CONTROL_CUOTA',CONTROL_CUOTA) 
    END
  RETURN ReturnValue


Hide:Access:CONTROL_CUOTA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CONTROL_CUOTA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CONC:PK_CONTROL_CUOTA,'CONC:PK_CONTROL_CUOTA',0)
    SELF.AddKey(CONC:CONTROL_CUOTA_ANO,'CONC:CONTROL_CUOTA_ANO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CONTROL_CUOTA.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CONTROL_CUOTA',CONTROL_CUOTA)
  RETURN ReturnValue


Hide:Relate:CONTROL_CUOTA.Kill PROCEDURE

  CODE
  _Hide:Access:CONTROL_CUOTA.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:CONTROL_CUOTA &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CONTROL_CUOTA)                      ! destroy the file manager


Hide:Relate:CONTROL_CUOTA.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CONTROL_CUOTA')
       DbChangeTrigger.AddThread('CONTROL_CUOTA')
       DbChangeTrigger.AddItem(CONC:IDCONTROL, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:IDCONTROL)) , 'CONTROL_CUOTA')
       DbChangeTrigger.AddItem(CONC:ANO, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:ANO)) , 'CONTROL_CUOTA')
       DbChangeTrigger.AddItem(CONC:CANT_CUOTAS_MAX, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:CANT_CUOTAS_MAX)) , 'CONTROL_CUOTA')
       DbChangeTrigger.AddItem(CONC:FECHA_TOPE_PAGO, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:FECHA_TOPE_PAGO)) , 'CONTROL_CUOTA')
       DbChangeTrigger.AddItem(CONC:DESCUENTO_CUOTA, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:DESCUENTO_CUOTA)) , 'CONTROL_CUOTA')
       DbChangeTrigger.AddItem(CONC:GENERADO, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:GENERADO)) , 'CONTROL_CUOTA')
       DbChangeTrigger.AddItem(CONC:MONTO_ANUAL, WHO(CONC:RECORD,WHERE(CONC:RECORD,CONC:MONTO_ANUAL)) , 'CONTROL_CUOTA')
    END
    DbChangeTrigger.Update('CONTROL_CUOTA')


Hide:Relate:CONTROL_CUOTA.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CONTROL_CUOTA')
        DbChangeTrigger.CheckChanges('CONTROL_CUOTA',CONTROL_CUOTA) 
     END
  RETURN ReturnValue


Hide:Relate:EXP_CURSO_INSCRIPCION_DETALLE.Init PROCEDURE()
  CODE
  _Hide:Access:EXP_CURSO_INSCRIPCION_DETALLE.Init
  SELF.Init(Access:EXP_CURSO_INSCRIPCION_DETALLE,1)


Hide:Access:EXP_CURSO_INSCRIPCION_DETALLE.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddThread('EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:IDINSCRIPCION, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:IDINSCRIPCION)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:IDCURSO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:IDCURSO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:ID_MODULO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:ID_MODULO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:FECHA_INSCRIPCION, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:FECHA_INSCRIPCION)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:PRESENTE, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:PRESENTE)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:NOTA, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:NOTA)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:MONTO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:MONTO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:PAGADO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:PAGADO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:FECHA_PAGO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:FECHA_PAGO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:HORA_PAGO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:HORA_PAGO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:USUARIO_PAGO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:USUARIO_PAGO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:IDSUBCUENTA, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:IDSUBCUENTA)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:DESCUENTO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:DESCUENTO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:SUCURSAL, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:SUCURSAL)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:IDRECIBO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:IDRECIBO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
   END
   DbChangeTrigger.Update('EXP_CURSO_INSCRIPCION_DETALLE')
  RETURN ReturnValue


Hide:Access:EXP_CURSO_INSCRIPCION_DETALLE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CURD1:Record
  SELF.FileNameValue = 'EXP_CURSO_INSCRIPCION_DETALLE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= EXP_CURSO_INSCRIPCION_DETALLE
  PARENT.Init
  Access:EXP_CURSO_INSCRIPCION_DETALLE &= SELF


Hide:Access:EXP_CURSO_INSCRIPCION_DETALLE.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('EXP_CURSO_INSCRIPCION_DETALLE',EXP_CURSO_INSCRIPCION_DETALLE)
  RETURN ReturnValue


Hide:Access:EXP_CURSO_INSCRIPCION_DETALLE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:EXP_CURSO_INSCRIPCION_DETALLE &= NULL             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:EXP_CURSO_INSCRIPCION_DETALLE.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddThread('EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:IDINSCRIPCION, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:IDINSCRIPCION)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:IDCURSO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:IDCURSO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:ID_MODULO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:ID_MODULO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:FECHA_INSCRIPCION, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:FECHA_INSCRIPCION)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:PRESENTE, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:PRESENTE)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:NOTA, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:NOTA)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:MONTO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:MONTO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:PAGADO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:PAGADO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:FECHA_PAGO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:FECHA_PAGO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:HORA_PAGO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:HORA_PAGO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:USUARIO_PAGO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:USUARIO_PAGO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:IDSUBCUENTA, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:IDSUBCUENTA)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:DESCUENTO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:DESCUENTO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:SUCURSAL, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:SUCURSAL)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:IDRECIBO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:IDRECIBO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
   END
   DbChangeTrigger.Update('EXP_CURSO_INSCRIPCION_DETALLE')
  RETURN ReturnValue


Hide:Access:EXP_CURSO_INSCRIPCION_DETALLE.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddThread('EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:IDINSCRIPCION, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:IDINSCRIPCION)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:IDCURSO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:IDCURSO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:ID_MODULO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:ID_MODULO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:FECHA_INSCRIPCION, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:FECHA_INSCRIPCION)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:PRESENTE, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:PRESENTE)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:NOTA, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:NOTA)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:MONTO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:MONTO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:PAGADO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:PAGADO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:FECHA_PAGO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:FECHA_PAGO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:HORA_PAGO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:HORA_PAGO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:USUARIO_PAGO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:USUARIO_PAGO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:IDSUBCUENTA, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:IDSUBCUENTA)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:DESCUENTO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:DESCUENTO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:SUCURSAL, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:SUCURSAL)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD1:IDRECIBO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:IDRECIBO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
   END
   DbChangeTrigger.Update('EXP_CURSO_INSCRIPCION_DETALLE')
  RETURN ReturnValue


Hide:Access:EXP_CURSO_INSCRIPCION_DETALLE.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.CheckChanges('EXP_CURSO_INSCRIPCION_DETALLE',EXP_CURSO_INSCRIPCION_DETALLE) 
    END
  RETURN ReturnValue


Hide:Access:EXP_CURSO_INSCRIPCION_DETALLE.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(EXP_CURSO_INSCRIPCION_DETALLE,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(CURD1:PK_CURSO_INSCRIPCION_DETALLE,'CURD1:PK_CURSO_INSCRIPCION_DETALLE',0)
    SELF.AddKey(CURD1:FK_CURSO_INSCRIPCION_DETALLE_IN,'CURD1:FK_CURSO_INSCRIPCION_DETALLE_IN',0)
    SELF.AddKey(CURD1:IDX_CURSO_DETALLE_CURSO,'CURD1:IDX_CURSO_DETALLE_CURSO',0)
    SELF.AddKey(CURD1:IDX_CURSO_DETALLE_MODULO,'CURD1:IDX_CURSO_DETALLE_MODULO',0)
    SELF.AddKey(CURD1:IDX_CURSO_DETALLE_PAGADO,'CURD1:IDX_CURSO_DETALLE_PAGADO',0)
    SELF.AddKey(CURD1:IDX_CURSO_DETALLE_SUBCTA,'CURD1:IDX_CURSO_DETALLE_SUBCTA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:EXP_CURSO_INSCRIPCION_DETALLE.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('EXP_CURSO_INSCRIPCION_DETALLE',EXP_CURSO_INSCRIPCION_DETALLE)
  RETURN ReturnValue


Hide:Relate:EXP_CURSO_INSCRIPCION_DETALLE.Kill PROCEDURE

  CODE
  _Hide:Access:EXP_CURSO_INSCRIPCION_DETALLE.Kill          ! Kill the file manager
  PARENT.Kill
  Relate:EXP_CURSO_INSCRIPCION_DETALLE &= NULL             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:EXP_CURSO_INSCRIPCION_DETALLE)      ! destroy the file manager


Hide:Relate:EXP_CURSO_INSCRIPCION_DETALLE.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddThread('EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD1:IDINSCRIPCION, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:IDINSCRIPCION)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD1:IDCURSO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:IDCURSO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD1:ID_MODULO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:ID_MODULO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD1:FECHA_INSCRIPCION, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:FECHA_INSCRIPCION)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD1:PRESENTE, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:PRESENTE)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD1:NOTA, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:NOTA)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD1:MONTO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:MONTO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD1:PAGADO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:PAGADO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD1:FECHA_PAGO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:FECHA_PAGO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD1:HORA_PAGO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:HORA_PAGO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD1:USUARIO_PAGO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:USUARIO_PAGO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD1:IDSUBCUENTA, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:IDSUBCUENTA)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD1:DESCUENTO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:DESCUENTO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD1:SUCURSAL, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:SUCURSAL)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD1:IDRECIBO, WHO(CURD1:RECORD,WHERE(CURD1:RECORD,CURD1:IDRECIBO)) , 'EXP_CURSO_INSCRIPCION_DETALLE')
    END
    DbChangeTrigger.Update('EXP_CURSO_INSCRIPCION_DETALLE')


Hide:Relate:EXP_CURSO_INSCRIPCION_DETALLE.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('EXP_CURSO_INSCRIPCION_DETALLE')
        DbChangeTrigger.CheckChanges('EXP_CURSO_INSCRIPCION_DETALLE',EXP_CURSO_INSCRIPCION_DETALLE) 
     END
  RETURN ReturnValue


Hide:Relate:EXP_INGRESOS.Init PROCEDURE()
  CODE
  _Hide:Access:EXP_INGRESOS.Init
  SELF.Init(Access:EXP_INGRESOS,1)


Hide:Access:EXP_INGRESOS.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('EXP_INGRESOS')
      DbChangeTrigger.AddThread('EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:IDINGRESO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDINGRESO)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:IDUSUARIO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDUSUARIO)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:IDSUBCUENTA, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDSUBCUENTA)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:OBSERVACION, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:OBSERVACION)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:MONTO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:MONTO)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:FECHA, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:FECHA)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:HORA, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:HORA)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:MES, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:MES)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:ANO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:ANO)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:PERIODO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:PERIODO)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:IDPROVEEDOR, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDPROVEEDOR)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:SUCURSAL, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:SUCURSAL)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:IDRECIBO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDRECIBO)) , 'EXP_INGRESOS')
   END
   DbChangeTrigger.Update('EXP_INGRESOS')
  RETURN ReturnValue


Hide:Access:EXP_INGRESOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ING1:Record
  SELF.FileNameValue = 'EXP_INGRESOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= EXP_INGRESOS
  PARENT.Init
  Access:EXP_INGRESOS &= SELF


Hide:Access:EXP_INGRESOS.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('EXP_INGRESOS',EXP_INGRESOS)
  RETURN ReturnValue


Hide:Access:EXP_INGRESOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:EXP_INGRESOS &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:EXP_INGRESOS.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('EXP_INGRESOS')
      DbChangeTrigger.AddThread('EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:IDINGRESO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDINGRESO)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:IDUSUARIO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDUSUARIO)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:IDSUBCUENTA, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDSUBCUENTA)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:OBSERVACION, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:OBSERVACION)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:MONTO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:MONTO)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:FECHA, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:FECHA)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:HORA, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:HORA)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:MES, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:MES)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:ANO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:ANO)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:PERIODO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:PERIODO)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:IDPROVEEDOR, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDPROVEEDOR)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:SUCURSAL, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:SUCURSAL)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:IDRECIBO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDRECIBO)) , 'EXP_INGRESOS')
   END
   DbChangeTrigger.Update('EXP_INGRESOS')
  RETURN ReturnValue


Hide:Access:EXP_INGRESOS.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('EXP_INGRESOS')
      DbChangeTrigger.AddThread('EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:IDINGRESO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDINGRESO)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:IDUSUARIO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDUSUARIO)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:IDSUBCUENTA, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDSUBCUENTA)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:OBSERVACION, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:OBSERVACION)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:MONTO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:MONTO)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:FECHA, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:FECHA)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:HORA, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:HORA)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:MES, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:MES)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:ANO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:ANO)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:PERIODO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:PERIODO)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:IDPROVEEDOR, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDPROVEEDOR)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:SUCURSAL, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:SUCURSAL)) , 'EXP_INGRESOS')
      DbChangeTrigger.AddItem(ING1:IDRECIBO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDRECIBO)) , 'EXP_INGRESOS')
   END
   DbChangeTrigger.Update('EXP_INGRESOS')
  RETURN ReturnValue


Hide:Access:EXP_INGRESOS.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('EXP_INGRESOS')
       DbChangeTrigger.CheckChanges('EXP_INGRESOS',EXP_INGRESOS) 
    END
  RETURN ReturnValue


Hide:Access:EXP_INGRESOS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(EXP_INGRESOS,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ING1:PK_INGRESOS,'ING1:PK_INGRESOS',0)
    SELF.AddKey(ING1:FK_INGRESOS_SUBCUENTA,'ING1:FK_INGRESOS_SUBCUENTA',0)
    SELF.AddKey(ING1:FK_INGRESOS_USUARIOS,'ING1:FK_INGRESOS_USUARIOS',0)
    SELF.AddKey(ING1:FK_INGRESOS_PROVEEDOR,'ING1:FK_INGRESOS_PROVEEDOR',0)
    SELF.AddKey(ING1:IDX_INGRESOS_UNIQUE,'ING1:IDX_INGRESOS_UNIQUE',0)
    SELF.AddKey(ING1:IDX_INGRESOS_FECHA,'ING1:IDX_INGRESOS_FECHA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:EXP_INGRESOS.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('EXP_INGRESOS',EXP_INGRESOS)
  RETURN ReturnValue


Hide:Relate:EXP_INGRESOS.Kill PROCEDURE

  CODE
  _Hide:Access:EXP_INGRESOS.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:EXP_INGRESOS &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:EXP_INGRESOS)                       ! destroy the file manager


Hide:Relate:EXP_INGRESOS.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('EXP_INGRESOS')
       DbChangeTrigger.AddThread('EXP_INGRESOS')
       DbChangeTrigger.AddItem(ING1:IDINGRESO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDINGRESO)) , 'EXP_INGRESOS')
       DbChangeTrigger.AddItem(ING1:IDUSUARIO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDUSUARIO)) , 'EXP_INGRESOS')
       DbChangeTrigger.AddItem(ING1:IDSUBCUENTA, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDSUBCUENTA)) , 'EXP_INGRESOS')
       DbChangeTrigger.AddItem(ING1:OBSERVACION, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:OBSERVACION)) , 'EXP_INGRESOS')
       DbChangeTrigger.AddItem(ING1:MONTO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:MONTO)) , 'EXP_INGRESOS')
       DbChangeTrigger.AddItem(ING1:FECHA, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:FECHA)) , 'EXP_INGRESOS')
       DbChangeTrigger.AddItem(ING1:HORA, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:HORA)) , 'EXP_INGRESOS')
       DbChangeTrigger.AddItem(ING1:MES, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:MES)) , 'EXP_INGRESOS')
       DbChangeTrigger.AddItem(ING1:ANO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:ANO)) , 'EXP_INGRESOS')
       DbChangeTrigger.AddItem(ING1:PERIODO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:PERIODO)) , 'EXP_INGRESOS')
       DbChangeTrigger.AddItem(ING1:IDPROVEEDOR, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDPROVEEDOR)) , 'EXP_INGRESOS')
       DbChangeTrigger.AddItem(ING1:SUCURSAL, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:SUCURSAL)) , 'EXP_INGRESOS')
       DbChangeTrigger.AddItem(ING1:IDRECIBO, WHO(ING1:RECORD,WHERE(ING1:RECORD,ING1:IDRECIBO)) , 'EXP_INGRESOS')
    END
    DbChangeTrigger.Update('EXP_INGRESOS')


Hide:Relate:EXP_INGRESOS.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('EXP_INGRESOS')
        DbChangeTrigger.CheckChanges('EXP_INGRESOS',EXP_INGRESOS) 
     END
  RETURN ReturnValue


Hide:Relate:COBERTURA.Init PROCEDURE()
  CODE
  _Hide:Access:COBERTURA.Init
  SELF.Init(Access:COBERTURA,1)


Hide:Access:COBERTURA.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('COBERTURA')
      DbChangeTrigger.AddThread('COBERTURA')
      DbChangeTrigger.AddItem(COB:IDCOBERTURA, WHO(COB:RECORD,WHERE(COB:RECORD,COB:IDCOBERTURA)) , 'COBERTURA')
      DbChangeTrigger.AddItem(COB:DESCRIPCION, WHO(COB:RECORD,WHERE(COB:RECORD,COB:DESCRIPCION)) , 'COBERTURA')
      DbChangeTrigger.AddItem(COB:MONTO, WHO(COB:RECORD,WHERE(COB:RECORD,COB:MONTO)) , 'COBERTURA')
      DbChangeTrigger.AddItem(COB:DESCUENTO, WHO(COB:RECORD,WHERE(COB:RECORD,COB:DESCUENTO)) , 'COBERTURA')
      DbChangeTrigger.AddItem(COB:FORMA_PAGO, WHO(COB:RECORD,WHERE(COB:RECORD,COB:FORMA_PAGO)) , 'COBERTURA')
      DbChangeTrigger.AddItem(COB:INTERES, WHO(COB:RECORD,WHERE(COB:RECORD,COB:INTERES)) , 'COBERTURA')
   END
   DbChangeTrigger.Update('COBERTURA')
  RETURN ReturnValue


Hide:Access:COBERTURA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= COB:Record
  SELF.FileNameValue = 'COBERTURA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= COBERTURA
  PARENT.Init
  Access:COBERTURA &= SELF


Hide:Access:COBERTURA.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('COBERTURA',COBERTURA)
  RETURN ReturnValue


Hide:Access:COBERTURA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:COBERTURA &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:COBERTURA.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('COBERTURA')
      DbChangeTrigger.AddThread('COBERTURA')
      DbChangeTrigger.AddItem(COB:IDCOBERTURA, WHO(COB:RECORD,WHERE(COB:RECORD,COB:IDCOBERTURA)) , 'COBERTURA')
      DbChangeTrigger.AddItem(COB:DESCRIPCION, WHO(COB:RECORD,WHERE(COB:RECORD,COB:DESCRIPCION)) , 'COBERTURA')
      DbChangeTrigger.AddItem(COB:MONTO, WHO(COB:RECORD,WHERE(COB:RECORD,COB:MONTO)) , 'COBERTURA')
      DbChangeTrigger.AddItem(COB:DESCUENTO, WHO(COB:RECORD,WHERE(COB:RECORD,COB:DESCUENTO)) , 'COBERTURA')
      DbChangeTrigger.AddItem(COB:FORMA_PAGO, WHO(COB:RECORD,WHERE(COB:RECORD,COB:FORMA_PAGO)) , 'COBERTURA')
      DbChangeTrigger.AddItem(COB:INTERES, WHO(COB:RECORD,WHERE(COB:RECORD,COB:INTERES)) , 'COBERTURA')
   END
   DbChangeTrigger.Update('COBERTURA')
  RETURN ReturnValue


Hide:Access:COBERTURA.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('COBERTURA')
      DbChangeTrigger.AddThread('COBERTURA')
      DbChangeTrigger.AddItem(COB:IDCOBERTURA, WHO(COB:RECORD,WHERE(COB:RECORD,COB:IDCOBERTURA)) , 'COBERTURA')
      DbChangeTrigger.AddItem(COB:DESCRIPCION, WHO(COB:RECORD,WHERE(COB:RECORD,COB:DESCRIPCION)) , 'COBERTURA')
      DbChangeTrigger.AddItem(COB:MONTO, WHO(COB:RECORD,WHERE(COB:RECORD,COB:MONTO)) , 'COBERTURA')
      DbChangeTrigger.AddItem(COB:DESCUENTO, WHO(COB:RECORD,WHERE(COB:RECORD,COB:DESCUENTO)) , 'COBERTURA')
      DbChangeTrigger.AddItem(COB:FORMA_PAGO, WHO(COB:RECORD,WHERE(COB:RECORD,COB:FORMA_PAGO)) , 'COBERTURA')
      DbChangeTrigger.AddItem(COB:INTERES, WHO(COB:RECORD,WHERE(COB:RECORD,COB:INTERES)) , 'COBERTURA')
   END
   DbChangeTrigger.Update('COBERTURA')
  RETURN ReturnValue


Hide:Access:COBERTURA.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('COBERTURA')
       DbChangeTrigger.CheckChanges('COBERTURA',COBERTURA) 
    END
  RETURN ReturnValue


Hide:Access:COBERTURA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(COBERTURA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(COB:PK_COBERTURA,'COB:PK_COBERTURA',0)
    SELF.AddKey(COB:IDX_COBERTURA,'COB:IDX_COBERTURA',0)
    SELF.AddKey(COB:IDX_MONTO,'COB:IDX_MONTO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:COBERTURA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TIPO_COBERTURA,RI:None,RI:None,TIPC:FK_TIPO_COBERTURA_1)
  SELF.AddRelationLink(COB:IDCOBERTURA,TIPC:IDCOBERTURA)

  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_COBERTURA)
  SELF.AddRelationLink(COB:IDCOBERTURA,SOC:IDCOBERTURA)


Hide:Relate:COBERTURA.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('COBERTURA',COBERTURA)
  RETURN ReturnValue


Hide:Relate:COBERTURA.Kill PROCEDURE

  CODE
  _Hide:Access:COBERTURA.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:COBERTURA &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:COBERTURA)                          ! destroy the file manager


Hide:Relate:COBERTURA.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('COBERTURA')
       DbChangeTrigger.AddThread('COBERTURA')
       DbChangeTrigger.AddItem(COB:IDCOBERTURA, WHO(COB:RECORD,WHERE(COB:RECORD,COB:IDCOBERTURA)) , 'COBERTURA')
       DbChangeTrigger.AddItem(COB:DESCRIPCION, WHO(COB:RECORD,WHERE(COB:RECORD,COB:DESCRIPCION)) , 'COBERTURA')
       DbChangeTrigger.AddItem(COB:MONTO, WHO(COB:RECORD,WHERE(COB:RECORD,COB:MONTO)) , 'COBERTURA')
       DbChangeTrigger.AddItem(COB:DESCUENTO, WHO(COB:RECORD,WHERE(COB:RECORD,COB:DESCUENTO)) , 'COBERTURA')
       DbChangeTrigger.AddItem(COB:FORMA_PAGO, WHO(COB:RECORD,WHERE(COB:RECORD,COB:FORMA_PAGO)) , 'COBERTURA')
       DbChangeTrigger.AddItem(COB:INTERES, WHO(COB:RECORD,WHERE(COB:RECORD,COB:INTERES)) , 'COBERTURA')
    END
    DbChangeTrigger.Update('COBERTURA')


Hide:Relate:COBERTURA.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('COBERTURA')
        DbChangeTrigger.CheckChanges('COBERTURA',COBERTURA) 
     END
  RETURN ReturnValue


Hide:Relate:CONSULTORIO.Init PROCEDURE()
  CODE
  _Hide:Access:CONSULTORIO.Init
  SELF.Init(Access:CONSULTORIO,1)


Hide:Access:CONSULTORIO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CONSULTORIO')
      DbChangeTrigger.AddThread('CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:IDCONSULTORIO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:IDCONSULTORIO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:IDLOCALIDAD, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:IDLOCALIDAD)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:IDSOCIO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:IDSOCIO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:DIRECCION, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:DIRECCION)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:FECHA, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:FECHA)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:LIBRO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:LIBRO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:FOLIO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:FOLIO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:ACTA, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:ACTA)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:IDINSPECTOR, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:IDINSPECTOR)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:HABILITADO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:HABILITADO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:FECHA_HABILITACION, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:FECHA_HABILITACION)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:FECHA_VTO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:FECHA_VTO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:TELEFONO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:TELEFONO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:ACTIVO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:ACTIVO)) , 'CONSULTORIO')
   END
   DbChangeTrigger.Update('CONSULTORIO')
  RETURN ReturnValue


Hide:Access:CONSULTORIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CON2:Record
  SELF.FileNameValue = 'CONSULTORIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CONSULTORIO
  PARENT.Init
  Access:CONSULTORIO &= SELF


Hide:Access:CONSULTORIO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CONSULTORIO',CONSULTORIO)
  RETURN ReturnValue


Hide:Access:CONSULTORIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CONSULTORIO &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CONSULTORIO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CONSULTORIO')
      DbChangeTrigger.AddThread('CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:IDCONSULTORIO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:IDCONSULTORIO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:IDLOCALIDAD, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:IDLOCALIDAD)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:IDSOCIO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:IDSOCIO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:DIRECCION, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:DIRECCION)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:FECHA, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:FECHA)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:LIBRO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:LIBRO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:FOLIO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:FOLIO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:ACTA, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:ACTA)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:IDINSPECTOR, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:IDINSPECTOR)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:HABILITADO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:HABILITADO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:FECHA_HABILITACION, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:FECHA_HABILITACION)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:FECHA_VTO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:FECHA_VTO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:TELEFONO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:TELEFONO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:ACTIVO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:ACTIVO)) , 'CONSULTORIO')
   END
   DbChangeTrigger.Update('CONSULTORIO')
  RETURN ReturnValue


Hide:Access:CONSULTORIO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CONSULTORIO')
      DbChangeTrigger.AddThread('CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:IDCONSULTORIO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:IDCONSULTORIO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:IDLOCALIDAD, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:IDLOCALIDAD)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:IDSOCIO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:IDSOCIO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:DIRECCION, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:DIRECCION)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:FECHA, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:FECHA)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:LIBRO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:LIBRO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:FOLIO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:FOLIO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:ACTA, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:ACTA)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:IDINSPECTOR, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:IDINSPECTOR)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:HABILITADO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:HABILITADO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:FECHA_HABILITACION, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:FECHA_HABILITACION)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:FECHA_VTO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:FECHA_VTO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:TELEFONO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:TELEFONO)) , 'CONSULTORIO')
      DbChangeTrigger.AddItem(CON2:ACTIVO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:ACTIVO)) , 'CONSULTORIO')
   END
   DbChangeTrigger.Update('CONSULTORIO')
  RETURN ReturnValue


Hide:Access:CONSULTORIO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CONSULTORIO')
       DbChangeTrigger.CheckChanges('CONSULTORIO',CONSULTORIO) 
    END
  RETURN ReturnValue


Hide:Access:CONSULTORIO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CONSULTORIO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CON2:PK_CONSULTORIO,'CON2:PK_CONSULTORIO',0)
    SELF.AddKey(CON2:FK_CONSULTORIO_INSPECTOR,'CON2:FK_CONSULTORIO_INSPECTOR',0)
    SELF.AddKey(CON2:FK_CONSULTORIO_LOCALIDAD,'CON2:FK_CONSULTORIO_LOCALIDAD',0)
    SELF.AddKey(CON2:FK_CONSULTORIO_SOCIOS,'CON2:FK_CONSULTORIO_SOCIOS',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CONSULTORIO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:LOCALIDAD2    USHORT,AUTO
Save:SOCIOS3       USHORT,AUTO
Save:INSPECTOR9    USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('CON2:IDLOCALIDAD')
    Save:LOCALIDAD2 = Access:LOCALIDAD.SaveFile()
    LOC:IDLOCALIDAD = CON2:IDLOCALIDAD
    ReturnValue = Access:LOCALIDAD.TryFetch(LOC:PK_LOCALIDAD)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'LOCALIDAD')
      END
    END
    Access:LOCALIDAD.RestoreFile(Save:LOCALIDAD2)
  OF 3
    GlobalErrors.SetField('CON2:IDSOCIO')
    Save:SOCIOS3 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = CON2:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS3)
  OF 9
    GlobalErrors.SetField('CON2:IDINSPECTOR')
    Save:INSPECTOR9 = Access:INSPECTOR.SaveFile()
    INS:IDINSPECTOR = CON2:IDINSPECTOR
    ReturnValue = Access:INSPECTOR.TryFetch(INS:PK_INSPECTOR)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'INSPECTOR')
      END
    END
    Access:INSPECTOR.RestoreFile(Save:INSPECTOR9)
  END
  RETURN ReturnValue


Hide:Relate:CONSULTORIO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CONSULTRIO_ADHERENTE,RI:None,RI:None,CON1:FK_CONSULTRIO_ADHERENTE_CONSUL)
  SELF.AddRelationLink(CON2:IDCONSULTORIO,CON1:IDCONSULTORIO)

  SELF.AddRelation(Relate:CONSULTORIO_EQUIPO,RI:None,RI:None,CON:FK_CONSULTORIO_EQUIPO_CONS)
  SELF.AddRelationLink(CON2:IDCONSULTORIO,CON:IDCONSULTORIO)

  SELF.AddRelation(Relate:INSPECTOR)

  SELF.AddRelation(Relate:LOCALIDAD)

  SELF.AddRelation(Relate:SOCIOS)


Hide:Relate:CONSULTORIO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CONSULTORIO',CONSULTORIO)
  RETURN ReturnValue


Hide:Relate:CONSULTORIO.Kill PROCEDURE

  CODE
  _Hide:Access:CONSULTORIO.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:CONSULTORIO &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CONSULTORIO)                        ! destroy the file manager


Hide:Relate:CONSULTORIO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CONSULTORIO')
       DbChangeTrigger.AddThread('CONSULTORIO')
       DbChangeTrigger.AddItem(CON2:IDCONSULTORIO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:IDCONSULTORIO)) , 'CONSULTORIO')
       DbChangeTrigger.AddItem(CON2:IDLOCALIDAD, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:IDLOCALIDAD)) , 'CONSULTORIO')
       DbChangeTrigger.AddItem(CON2:IDSOCIO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:IDSOCIO)) , 'CONSULTORIO')
       DbChangeTrigger.AddItem(CON2:DIRECCION, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:DIRECCION)) , 'CONSULTORIO')
       DbChangeTrigger.AddItem(CON2:FECHA, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:FECHA)) , 'CONSULTORIO')
       DbChangeTrigger.AddItem(CON2:LIBRO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:LIBRO)) , 'CONSULTORIO')
       DbChangeTrigger.AddItem(CON2:FOLIO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:FOLIO)) , 'CONSULTORIO')
       DbChangeTrigger.AddItem(CON2:ACTA, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:ACTA)) , 'CONSULTORIO')
       DbChangeTrigger.AddItem(CON2:IDINSPECTOR, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:IDINSPECTOR)) , 'CONSULTORIO')
       DbChangeTrigger.AddItem(CON2:HABILITADO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:HABILITADO)) , 'CONSULTORIO')
       DbChangeTrigger.AddItem(CON2:FECHA_HABILITACION, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:FECHA_HABILITACION)) , 'CONSULTORIO')
       DbChangeTrigger.AddItem(CON2:FECHA_VTO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:FECHA_VTO)) , 'CONSULTORIO')
       DbChangeTrigger.AddItem(CON2:TELEFONO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:TELEFONO)) , 'CONSULTORIO')
       DbChangeTrigger.AddItem(CON2:ACTIVO, WHO(CON2:RECORD,WHERE(CON2:RECORD,CON2:ACTIVO)) , 'CONSULTORIO')
    END
    DbChangeTrigger.Update('CONSULTORIO')


Hide:Relate:CONSULTORIO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CONSULTORIO')
        DbChangeTrigger.CheckChanges('CONSULTORIO',CONSULTORIO) 
     END
  RETURN ReturnValue


Hide:Relate:CONTROL_FACTURA.Init PROCEDURE()
  CODE
  _Hide:Access:CONTROL_FACTURA.Init
  SELF.Init(Access:CONTROL_FACTURA,1)


Hide:Access:CONTROL_FACTURA.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CONTROL_FACTURA')
      DbChangeTrigger.AddThread('CONTROL_FACTURA')
      DbChangeTrigger.AddItem(CON3:IDSOCIO, WHO(CON3:RECORD,WHERE(CON3:RECORD,CON3:IDSOCIO)) , 'CONTROL_FACTURA')
      DbChangeTrigger.AddItem(CON3:MES, WHO(CON3:RECORD,WHERE(CON3:RECORD,CON3:MES)) , 'CONTROL_FACTURA')
      DbChangeTrigger.AddItem(CON3:ANO, WHO(CON3:RECORD,WHERE(CON3:RECORD,CON3:ANO)) , 'CONTROL_FACTURA')
      DbChangeTrigger.AddItem(CON3:PEDIODO, WHO(CON3:RECORD,WHERE(CON3:RECORD,CON3:PEDIODO)) , 'CONTROL_FACTURA')
   END
   DbChangeTrigger.Update('CONTROL_FACTURA')
  RETURN ReturnValue


Hide:Access:CONTROL_FACTURA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CON3:Record
  SELF.FileNameValue = 'CONTROL_FACTURA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CONTROL_FACTURA
  PARENT.Init
  Access:CONTROL_FACTURA &= SELF


Hide:Access:CONTROL_FACTURA.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CONTROL_FACTURA',CONTROL_FACTURA)
  RETURN ReturnValue


Hide:Access:CONTROL_FACTURA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CONTROL_FACTURA &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CONTROL_FACTURA.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CONTROL_FACTURA')
      DbChangeTrigger.AddThread('CONTROL_FACTURA')
      DbChangeTrigger.AddItem(CON3:IDSOCIO, WHO(CON3:RECORD,WHERE(CON3:RECORD,CON3:IDSOCIO)) , 'CONTROL_FACTURA')
      DbChangeTrigger.AddItem(CON3:MES, WHO(CON3:RECORD,WHERE(CON3:RECORD,CON3:MES)) , 'CONTROL_FACTURA')
      DbChangeTrigger.AddItem(CON3:ANO, WHO(CON3:RECORD,WHERE(CON3:RECORD,CON3:ANO)) , 'CONTROL_FACTURA')
      DbChangeTrigger.AddItem(CON3:PEDIODO, WHO(CON3:RECORD,WHERE(CON3:RECORD,CON3:PEDIODO)) , 'CONTROL_FACTURA')
   END
   DbChangeTrigger.Update('CONTROL_FACTURA')
  RETURN ReturnValue


Hide:Access:CONTROL_FACTURA.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CONTROL_FACTURA')
      DbChangeTrigger.AddThread('CONTROL_FACTURA')
      DbChangeTrigger.AddItem(CON3:IDSOCIO, WHO(CON3:RECORD,WHERE(CON3:RECORD,CON3:IDSOCIO)) , 'CONTROL_FACTURA')
      DbChangeTrigger.AddItem(CON3:MES, WHO(CON3:RECORD,WHERE(CON3:RECORD,CON3:MES)) , 'CONTROL_FACTURA')
      DbChangeTrigger.AddItem(CON3:ANO, WHO(CON3:RECORD,WHERE(CON3:RECORD,CON3:ANO)) , 'CONTROL_FACTURA')
      DbChangeTrigger.AddItem(CON3:PEDIODO, WHO(CON3:RECORD,WHERE(CON3:RECORD,CON3:PEDIODO)) , 'CONTROL_FACTURA')
   END
   DbChangeTrigger.Update('CONTROL_FACTURA')
  RETURN ReturnValue


Hide:Access:CONTROL_FACTURA.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CONTROL_FACTURA')
       DbChangeTrigger.CheckChanges('CONTROL_FACTURA',CONTROL_FACTURA) 
    END
  RETURN ReturnValue


Hide:Access:CONTROL_FACTURA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CONTROL_FACTURA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CON3:PK_CONTROL_FACTURA,'CON3:PK_CONTROL_FACTURA',0)
    SELF.AddKey(CON3:FK_CONTROL_FACTURA,'CON3:FK_CONTROL_FACTURA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CONTROL_FACTURA.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS1       USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('CON3:IDSOCIO')
    Save:SOCIOS1 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = CON3:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS1)
  END
  RETURN ReturnValue


Hide:Relate:CONTROL_FACTURA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SOCIOS)


Hide:Relate:CONTROL_FACTURA.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CONTROL_FACTURA',CONTROL_FACTURA)
  RETURN ReturnValue


Hide:Relate:CONTROL_FACTURA.Kill PROCEDURE

  CODE
  _Hide:Access:CONTROL_FACTURA.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:CONTROL_FACTURA &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CONTROL_FACTURA)                    ! destroy the file manager


Hide:Relate:CONTROL_FACTURA.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CONTROL_FACTURA')
       DbChangeTrigger.AddThread('CONTROL_FACTURA')
       DbChangeTrigger.AddItem(CON3:IDSOCIO, WHO(CON3:RECORD,WHERE(CON3:RECORD,CON3:IDSOCIO)) , 'CONTROL_FACTURA')
       DbChangeTrigger.AddItem(CON3:MES, WHO(CON3:RECORD,WHERE(CON3:RECORD,CON3:MES)) , 'CONTROL_FACTURA')
       DbChangeTrigger.AddItem(CON3:ANO, WHO(CON3:RECORD,WHERE(CON3:RECORD,CON3:ANO)) , 'CONTROL_FACTURA')
       DbChangeTrigger.AddItem(CON3:PEDIODO, WHO(CON3:RECORD,WHERE(CON3:RECORD,CON3:PEDIODO)) , 'CONTROL_FACTURA')
    END
    DbChangeTrigger.Update('CONTROL_FACTURA')


Hide:Relate:CONTROL_FACTURA.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CONTROL_FACTURA')
        DbChangeTrigger.CheckChanges('CONTROL_FACTURA',CONTROL_FACTURA) 
     END
  RETURN ReturnValue


Hide:Relate:CONVENIO.Init PROCEDURE()
  CODE
  _Hide:Access:CONVENIO.Init
  SELF.Init(Access:CONVENIO,1)


Hide:Access:CONVENIO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CONVENIO')
      DbChangeTrigger.AddThread('CONVENIO')
      DbChangeTrigger.AddItem(CON4:IDSOLICITUD, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:IDSOLICITUD)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:IDSOCIO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:IDSOCIO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:IDTIPO_CONVENIO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:IDTIPO_CONVENIO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:MONTO_TOTAL, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:MONTO_TOTAL)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:CANTIDAD_CUOTAS, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:CANTIDAD_CUOTAS)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:MONTO_CUOTA, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:MONTO_CUOTA)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:MONTO_BONIFICADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:MONTO_BONIFICADO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:INTERES, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:INTERES)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:GASTOS_ADMINISTRATIVOS, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:GASTOS_ADMINISTRATIVOS)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:FECHA, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:FECHA)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:HORA, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:HORA)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:MES, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:MES)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:ANO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:ANO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:PERIODO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:PERIODO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:APROBADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:APROBADO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:EXEPCION, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:EXEPCION)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:CANCELADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:CANCELADO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:PAGADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:PAGADO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:LIBRO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:LIBRO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:FOLIO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:FOLIO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:ACTA, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:ACTA)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:OBSERVACION, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:OBSERVACION)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:FECHA_CANCELADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:FECHA_CANCELADO)) , 'CONVENIO')
   END
   DbChangeTrigger.Update('CONVENIO')
  RETURN ReturnValue


Hide:Access:CONVENIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CON4:Record
  SELF.FileNameValue = 'CONVENIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CONVENIO
  PARENT.Init
  Access:CONVENIO &= SELF


Hide:Access:CONVENIO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CONVENIO',CONVENIO)
  RETURN ReturnValue


Hide:Access:CONVENIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CONVENIO &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CONVENIO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CONVENIO')
      DbChangeTrigger.AddThread('CONVENIO')
      DbChangeTrigger.AddItem(CON4:IDSOLICITUD, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:IDSOLICITUD)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:IDSOCIO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:IDSOCIO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:IDTIPO_CONVENIO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:IDTIPO_CONVENIO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:MONTO_TOTAL, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:MONTO_TOTAL)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:CANTIDAD_CUOTAS, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:CANTIDAD_CUOTAS)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:MONTO_CUOTA, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:MONTO_CUOTA)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:MONTO_BONIFICADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:MONTO_BONIFICADO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:INTERES, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:INTERES)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:GASTOS_ADMINISTRATIVOS, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:GASTOS_ADMINISTRATIVOS)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:FECHA, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:FECHA)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:HORA, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:HORA)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:MES, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:MES)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:ANO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:ANO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:PERIODO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:PERIODO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:APROBADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:APROBADO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:EXEPCION, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:EXEPCION)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:CANCELADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:CANCELADO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:PAGADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:PAGADO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:LIBRO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:LIBRO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:FOLIO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:FOLIO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:ACTA, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:ACTA)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:OBSERVACION, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:OBSERVACION)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:FECHA_CANCELADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:FECHA_CANCELADO)) , 'CONVENIO')
   END
   DbChangeTrigger.Update('CONVENIO')
  RETURN ReturnValue


Hide:Access:CONVENIO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CONVENIO')
      DbChangeTrigger.AddThread('CONVENIO')
      DbChangeTrigger.AddItem(CON4:IDSOLICITUD, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:IDSOLICITUD)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:IDSOCIO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:IDSOCIO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:IDTIPO_CONVENIO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:IDTIPO_CONVENIO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:MONTO_TOTAL, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:MONTO_TOTAL)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:CANTIDAD_CUOTAS, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:CANTIDAD_CUOTAS)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:MONTO_CUOTA, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:MONTO_CUOTA)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:MONTO_BONIFICADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:MONTO_BONIFICADO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:INTERES, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:INTERES)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:GASTOS_ADMINISTRATIVOS, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:GASTOS_ADMINISTRATIVOS)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:FECHA, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:FECHA)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:HORA, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:HORA)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:MES, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:MES)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:ANO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:ANO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:PERIODO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:PERIODO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:APROBADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:APROBADO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:EXEPCION, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:EXEPCION)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:CANCELADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:CANCELADO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:PAGADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:PAGADO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:LIBRO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:LIBRO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:FOLIO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:FOLIO)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:ACTA, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:ACTA)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:OBSERVACION, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:OBSERVACION)) , 'CONVENIO')
      DbChangeTrigger.AddItem(CON4:FECHA_CANCELADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:FECHA_CANCELADO)) , 'CONVENIO')
   END
   DbChangeTrigger.Update('CONVENIO')
  RETURN ReturnValue


Hide:Access:CONVENIO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CONVENIO')
       DbChangeTrigger.CheckChanges('CONVENIO',CONVENIO) 
    END
  RETURN ReturnValue


Hide:Access:CONVENIO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CONVENIO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CON4:PK_CONVENIO,'CON4:PK_CONVENIO',0)
    SELF.AddKey(CON4:FK_CONVENIO_SOCIOS,'CON4:FK_CONVENIO_SOCIOS',0)
    SELF.AddKey(CON4:FK_CONVENIO_TIPO,'CON4:FK_CONVENIO_TIPO',0)
    SELF.AddKey(CON4:IDX_CONVENCIO_PERIODO,'CON4:IDX_CONVENCIO_PERIODO',0)
    SELF.AddKey(CON4:IDX_CONVENIO_CONTROL,'CON4:IDX_CONVENIO_CONTROL',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CONVENIO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS2       USHORT,AUTO
Save:TIPO_CONVENIO3 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('CON4:IDSOCIO')
    Save:SOCIOS2 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = CON4:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS2)
  OF 3
    GlobalErrors.SetField('CON4:IDTIPO_CONVENIO')
    Save:TIPO_CONVENIO3 = Access:TIPO_CONVENIO.SaveFile()
    TIP:IDTIPO_CONVENIO = CON4:IDTIPO_CONVENIO
    ReturnValue = Access:TIPO_CONVENIO.TryFetch(TIP:PK_T_CONVENIO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_CONVENIO')
      END
    END
    Access:TIPO_CONVENIO.RestoreFile(Save:TIPO_CONVENIO3)
  END
  RETURN ReturnValue


Hide:Relate:CONVENIO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:FACTURA_CONVENIO,RI:None,RI:None,FACXCONV:FACTURA_CONVENIO_CONVENIO)
  SELF.AddRelationLink(CON4:IDSOLICITUD,FACXCONV:IDCONVENIO)

  SELF.AddRelation(Relate:PAGO_CONVENIO,RI:None,RI:None,PAGCON:FK_PAGO_CONVENIO_CONVENIO)
  SELF.AddRelationLink(CON4:IDSOLICITUD,PAGCON:IDSOLICITUD)

  SELF.AddRelation(Relate:CONVENIO_DETALLE,RI:None,RI:None,CON5:FK_CONVENIO_DETALLE)
  SELF.AddRelationLink(CON4:IDSOLICITUD,CON5:IDSOLICITUD)

  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:TIPO_CONVENIO)


Hide:Relate:CONVENIO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CONVENIO',CONVENIO)
  RETURN ReturnValue


Hide:Relate:CONVENIO.Kill PROCEDURE

  CODE
  _Hide:Access:CONVENIO.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:CONVENIO &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CONVENIO)                           ! destroy the file manager


Hide:Relate:CONVENIO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CONVENIO')
       DbChangeTrigger.AddThread('CONVENIO')
       DbChangeTrigger.AddItem(CON4:IDSOLICITUD, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:IDSOLICITUD)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:IDSOCIO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:IDSOCIO)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:IDTIPO_CONVENIO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:IDTIPO_CONVENIO)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:MONTO_TOTAL, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:MONTO_TOTAL)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:CANTIDAD_CUOTAS, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:CANTIDAD_CUOTAS)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:MONTO_CUOTA, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:MONTO_CUOTA)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:MONTO_BONIFICADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:MONTO_BONIFICADO)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:INTERES, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:INTERES)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:GASTOS_ADMINISTRATIVOS, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:GASTOS_ADMINISTRATIVOS)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:FECHA, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:FECHA)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:HORA, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:HORA)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:MES, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:MES)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:ANO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:ANO)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:PERIODO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:PERIODO)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:APROBADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:APROBADO)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:EXEPCION, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:EXEPCION)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:CANCELADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:CANCELADO)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:PAGADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:PAGADO)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:LIBRO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:LIBRO)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:FOLIO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:FOLIO)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:ACTA, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:ACTA)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:OBSERVACION, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:OBSERVACION)) , 'CONVENIO')
       DbChangeTrigger.AddItem(CON4:FECHA_CANCELADO, WHO(CON4:RECORD,WHERE(CON4:RECORD,CON4:FECHA_CANCELADO)) , 'CONVENIO')
    END
    DbChangeTrigger.Update('CONVENIO')


Hide:Relate:CONVENIO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CONVENIO')
        DbChangeTrigger.CheckChanges('CONVENIO',CONVENIO) 
     END
  RETURN ReturnValue


Hide:Relate:CONVENIO_DETALLE.Init PROCEDURE()
  CODE
  _Hide:Access:CONVENIO_DETALLE.Init
  SELF.Init(Access:CONVENIO_DETALLE,1)


Hide:Access:CONVENIO_DETALLE.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CONVENIO_DETALLE')
      DbChangeTrigger.AddThread('CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:IDSOLICITUD, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:IDSOLICITUD)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:MES, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:MES)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:ANO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:ANO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:PERIODO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:PERIODO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:IDSOCIO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:IDSOCIO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:INTERES, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:INTERES)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:NRO_CUOTA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:NRO_CUOTA)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:MONTO_CUOTA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:MONTO_CUOTA)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:MONTO_TOTAL, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:MONTO_TOTAL)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:DEUDA_INICIAL, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:DEUDA_INICIAL)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:CAPITAL_ACUMULADO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:CAPITAL_ACUMULADO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:INTERES_ACUMULADO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:INTERES_ACUMULADO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:SALDO_ADEUDADO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:SALDO_ADEUDADO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:BONIFICACION, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:BONIFICACION)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:CUOTA_BONIFICADA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:CUOTA_BONIFICADA)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:CANCELADO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:CANCELADO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:OBSERVACION, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:OBSERVACION)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:FECHA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:FECHA)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:HORA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:HORA)) , 'CONVENIO_DETALLE')
   END
   DbChangeTrigger.Update('CONVENIO_DETALLE')
  RETURN ReturnValue


Hide:Access:CONVENIO_DETALLE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CON5:Record
  SELF.FileNameValue = 'CONVENIO_DETALLE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CONVENIO_DETALLE
  PARENT.Init
  Access:CONVENIO_DETALLE &= SELF


Hide:Access:CONVENIO_DETALLE.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CONVENIO_DETALLE',CONVENIO_DETALLE)
  RETURN ReturnValue


Hide:Access:CONVENIO_DETALLE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CONVENIO_DETALLE &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CONVENIO_DETALLE.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CONVENIO_DETALLE')
      DbChangeTrigger.AddThread('CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:IDSOLICITUD, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:IDSOLICITUD)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:MES, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:MES)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:ANO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:ANO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:PERIODO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:PERIODO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:IDSOCIO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:IDSOCIO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:INTERES, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:INTERES)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:NRO_CUOTA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:NRO_CUOTA)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:MONTO_CUOTA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:MONTO_CUOTA)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:MONTO_TOTAL, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:MONTO_TOTAL)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:DEUDA_INICIAL, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:DEUDA_INICIAL)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:CAPITAL_ACUMULADO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:CAPITAL_ACUMULADO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:INTERES_ACUMULADO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:INTERES_ACUMULADO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:SALDO_ADEUDADO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:SALDO_ADEUDADO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:BONIFICACION, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:BONIFICACION)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:CUOTA_BONIFICADA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:CUOTA_BONIFICADA)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:CANCELADO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:CANCELADO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:OBSERVACION, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:OBSERVACION)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:FECHA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:FECHA)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:HORA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:HORA)) , 'CONVENIO_DETALLE')
   END
   DbChangeTrigger.Update('CONVENIO_DETALLE')
  RETURN ReturnValue


Hide:Access:CONVENIO_DETALLE.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CONVENIO_DETALLE')
      DbChangeTrigger.AddThread('CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:IDSOLICITUD, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:IDSOLICITUD)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:MES, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:MES)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:ANO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:ANO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:PERIODO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:PERIODO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:IDSOCIO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:IDSOCIO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:INTERES, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:INTERES)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:NRO_CUOTA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:NRO_CUOTA)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:MONTO_CUOTA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:MONTO_CUOTA)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:MONTO_TOTAL, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:MONTO_TOTAL)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:DEUDA_INICIAL, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:DEUDA_INICIAL)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:CAPITAL_ACUMULADO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:CAPITAL_ACUMULADO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:INTERES_ACUMULADO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:INTERES_ACUMULADO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:SALDO_ADEUDADO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:SALDO_ADEUDADO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:BONIFICACION, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:BONIFICACION)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:CUOTA_BONIFICADA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:CUOTA_BONIFICADA)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:CANCELADO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:CANCELADO)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:OBSERVACION, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:OBSERVACION)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:FECHA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:FECHA)) , 'CONVENIO_DETALLE')
      DbChangeTrigger.AddItem(CON5:HORA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:HORA)) , 'CONVENIO_DETALLE')
   END
   DbChangeTrigger.Update('CONVENIO_DETALLE')
  RETURN ReturnValue


Hide:Access:CONVENIO_DETALLE.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CONVENIO_DETALLE')
       DbChangeTrigger.CheckChanges('CONVENIO_DETALLE',CONVENIO_DETALLE) 
    END
  RETURN ReturnValue


Hide:Access:CONVENIO_DETALLE.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CONVENIO_DETALLE,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CON5:PK_CONVENIO_DETALLE,'CON5:PK_CONVENIO_DETALLE',0)
    SELF.AddKey(CON5:FK_CONVENIO_DETALLE,'CON5:FK_CONVENIO_DETALLE',0)
    SELF.AddKey(CON5:IDX_CONVENIO_DETALLE_PERIODO,'CON5:IDX_CONVENIO_DETALLE_PERIODO',0)
    SELF.AddKey(CON5:IDX_CONVENIO_DETALLE_SOL_PER,'CON5:IDX_CONVENIO_DETALLE_SOL_PER',0)
    SELF.AddKey(CON5:IDX_CONVENIO_DETALLE_SOCIO,'CON5:IDX_CONVENIO_DETALLE_SOCIO',0)
    SELF.AddKey(CON5:IDX_CONVENIO_DETALLE_SOL_NCUOTA,'CON5:IDX_CONVENIO_DETALLE_SOL_NCUOTA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CONVENIO_DETALLE.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:CONVENIO1     USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('CON5:IDSOLICITUD')
    Save:CONVENIO1 = Access:CONVENIO.SaveFile()
    CON4:IDSOLICITUD = CON5:IDSOLICITUD
    ReturnValue = Access:CONVENIO.TryFetch(CON4:PK_CONVENIO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CONVENIO')
      END
    END
    Access:CONVENIO.RestoreFile(Save:CONVENIO1)
  END
  RETURN ReturnValue


Hide:Relate:CONVENIO_DETALLE.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CONVENIO)


Hide:Relate:CONVENIO_DETALLE.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CONVENIO_DETALLE',CONVENIO_DETALLE)
  RETURN ReturnValue


Hide:Relate:CONVENIO_DETALLE.Kill PROCEDURE

  CODE
  _Hide:Access:CONVENIO_DETALLE.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:CONVENIO_DETALLE &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CONVENIO_DETALLE)                   ! destroy the file manager


Hide:Relate:CONVENIO_DETALLE.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CONVENIO_DETALLE')
       DbChangeTrigger.AddThread('CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:IDSOLICITUD, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:IDSOLICITUD)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:MES, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:MES)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:ANO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:ANO)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:PERIODO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:PERIODO)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:IDSOCIO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:IDSOCIO)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:INTERES, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:INTERES)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:NRO_CUOTA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:NRO_CUOTA)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:MONTO_CUOTA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:MONTO_CUOTA)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:MONTO_TOTAL, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:MONTO_TOTAL)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:DEUDA_INICIAL, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:DEUDA_INICIAL)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:CAPITAL_ACUMULADO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:CAPITAL_ACUMULADO)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:INTERES_ACUMULADO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:INTERES_ACUMULADO)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:SALDO_ADEUDADO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:SALDO_ADEUDADO)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:BONIFICACION, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:BONIFICACION)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:CUOTA_BONIFICADA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:CUOTA_BONIFICADA)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:CANCELADO, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:CANCELADO)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:OBSERVACION, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:OBSERVACION)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:FECHA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:FECHA)) , 'CONVENIO_DETALLE')
       DbChangeTrigger.AddItem(CON5:HORA, WHO(CON5:RECORD,WHERE(CON5:RECORD,CON5:HORA)) , 'CONVENIO_DETALLE')
    END
    DbChangeTrigger.Update('CONVENIO_DETALLE')


Hide:Relate:CONVENIO_DETALLE.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CONVENIO_DETALLE')
        DbChangeTrigger.CheckChanges('CONVENIO_DETALLE',CONVENIO_DETALLE) 
     END
  RETURN ReturnValue


Hide:Relate:CV.Init PROCEDURE()
  CODE
  _Hide:Access:CV.Init
  SELF.Init(Access:CV,1)


Hide:Access:CV.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CV')
      DbChangeTrigger.AddThread('CV')
      DbChangeTrigger.AddItem(CV:IDCV, WHO(CV:RECORD,WHERE(CV:RECORD,CV:IDCV)) , 'CV')
      DbChangeTrigger.AddItem(CV:DESCRIPCION, WHO(CV:RECORD,WHERE(CV:RECORD,CV:DESCRIPCION)) , 'CV')
      DbChangeTrigger.AddItem(CV:IDSOCIO, WHO(CV:RECORD,WHERE(CV:RECORD,CV:IDSOCIO)) , 'CV')
      DbChangeTrigger.AddItem(CV:IDINSTITUCION, WHO(CV:RECORD,WHERE(CV:RECORD,CV:IDINSTITUCION)) , 'CV')
      DbChangeTrigger.AddItem(CV:ID_TIPO_CURSO, WHO(CV:RECORD,WHERE(CV:RECORD,CV:ID_TIPO_CURSO)) , 'CV')
      DbChangeTrigger.AddItem(CV:ANO_EGRESO, WHO(CV:RECORD,WHERE(CV:RECORD,CV:ANO_EGRESO)) , 'CV')
      DbChangeTrigger.AddItem(CV:CANTIDAD_HORAS, WHO(CV:RECORD,WHERE(CV:RECORD,CV:CANTIDAD_HORAS)) , 'CV')
      DbChangeTrigger.AddItem(CV:OBSERVACION, WHO(CV:RECORD,WHERE(CV:RECORD,CV:OBSERVACION)) , 'CV')
   END
   DbChangeTrigger.Update('CV')
  RETURN ReturnValue


Hide:Access:CV.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CV:Record
  SELF.FileNameValue = 'CV'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CV
  PARENT.Init
  Access:CV &= SELF


Hide:Access:CV.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CV',CV)
  RETURN ReturnValue


Hide:Access:CV.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CV &= NULL                                        ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CV.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CV')
      DbChangeTrigger.AddThread('CV')
      DbChangeTrigger.AddItem(CV:IDCV, WHO(CV:RECORD,WHERE(CV:RECORD,CV:IDCV)) , 'CV')
      DbChangeTrigger.AddItem(CV:DESCRIPCION, WHO(CV:RECORD,WHERE(CV:RECORD,CV:DESCRIPCION)) , 'CV')
      DbChangeTrigger.AddItem(CV:IDSOCIO, WHO(CV:RECORD,WHERE(CV:RECORD,CV:IDSOCIO)) , 'CV')
      DbChangeTrigger.AddItem(CV:IDINSTITUCION, WHO(CV:RECORD,WHERE(CV:RECORD,CV:IDINSTITUCION)) , 'CV')
      DbChangeTrigger.AddItem(CV:ID_TIPO_CURSO, WHO(CV:RECORD,WHERE(CV:RECORD,CV:ID_TIPO_CURSO)) , 'CV')
      DbChangeTrigger.AddItem(CV:ANO_EGRESO, WHO(CV:RECORD,WHERE(CV:RECORD,CV:ANO_EGRESO)) , 'CV')
      DbChangeTrigger.AddItem(CV:CANTIDAD_HORAS, WHO(CV:RECORD,WHERE(CV:RECORD,CV:CANTIDAD_HORAS)) , 'CV')
      DbChangeTrigger.AddItem(CV:OBSERVACION, WHO(CV:RECORD,WHERE(CV:RECORD,CV:OBSERVACION)) , 'CV')
   END
   DbChangeTrigger.Update('CV')
  RETURN ReturnValue


Hide:Access:CV.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CV')
      DbChangeTrigger.AddThread('CV')
      DbChangeTrigger.AddItem(CV:IDCV, WHO(CV:RECORD,WHERE(CV:RECORD,CV:IDCV)) , 'CV')
      DbChangeTrigger.AddItem(CV:DESCRIPCION, WHO(CV:RECORD,WHERE(CV:RECORD,CV:DESCRIPCION)) , 'CV')
      DbChangeTrigger.AddItem(CV:IDSOCIO, WHO(CV:RECORD,WHERE(CV:RECORD,CV:IDSOCIO)) , 'CV')
      DbChangeTrigger.AddItem(CV:IDINSTITUCION, WHO(CV:RECORD,WHERE(CV:RECORD,CV:IDINSTITUCION)) , 'CV')
      DbChangeTrigger.AddItem(CV:ID_TIPO_CURSO, WHO(CV:RECORD,WHERE(CV:RECORD,CV:ID_TIPO_CURSO)) , 'CV')
      DbChangeTrigger.AddItem(CV:ANO_EGRESO, WHO(CV:RECORD,WHERE(CV:RECORD,CV:ANO_EGRESO)) , 'CV')
      DbChangeTrigger.AddItem(CV:CANTIDAD_HORAS, WHO(CV:RECORD,WHERE(CV:RECORD,CV:CANTIDAD_HORAS)) , 'CV')
      DbChangeTrigger.AddItem(CV:OBSERVACION, WHO(CV:RECORD,WHERE(CV:RECORD,CV:OBSERVACION)) , 'CV')
   END
   DbChangeTrigger.Update('CV')
  RETURN ReturnValue


Hide:Access:CV.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CV')
       DbChangeTrigger.CheckChanges('CV',CV) 
    END
  RETURN ReturnValue


Hide:Access:CV.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CV,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CV:PK_CV,'CV:PK_CV',0)
    SELF.AddKey(CV:FK_CV_INSTITUCION,'CV:FK_CV_INSTITUCION',0)
    SELF.AddKey(CV:FK_CV_SOCIOS,'CV:FK_CV_SOCIOS',0)
    SELF.AddKey(CV:FK_CV_T_CURSO,'CV:FK_CV_T_CURSO',0)
    SELF.AddKey(CV:IDX_CV_DESCRIPCION,'CV:IDX_CV_DESCRIPCION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CV.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS3       USHORT,AUTO
Save:INSTITUCION4  USHORT,AUTO
Save:TIPO_CURSO5   USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('CV:IDSOCIO')
    Save:SOCIOS3 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = CV:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS3)
  OF 4
    GlobalErrors.SetField('CV:IDINSTITUCION')
    Save:INSTITUCION4 = Access:INSTITUCION.SaveFile()
    INS2:IDINSTITUCION = CV:IDINSTITUCION
    ReturnValue = Access:INSTITUCION.TryFetch(INS2:PK_INSTITUCION)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'INSTITUCION')
      END
    END
    Access:INSTITUCION.RestoreFile(Save:INSTITUCION4)
  OF 5
    GlobalErrors.SetField('CV:ID_TIPO_CURSO')
    Save:TIPO_CURSO5 = Access:TIPO_CURSO.SaveFile()
    TIP2:ID_TIPO_CURSO = CV:ID_TIPO_CURSO
    ReturnValue = Access:TIPO_CURSO.TryFetch(TIP2:PK_T_CURSO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_CURSO')
      END
    END
    Access:TIPO_CURSO.RestoreFile(Save:TIPO_CURSO5)
  END
  RETURN ReturnValue


Hide:Relate:CV.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:INSTITUCION)

  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:TIPO_CURSO)


Hide:Relate:CV.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CV',CV)
  RETURN ReturnValue


Hide:Relate:CV.Kill PROCEDURE

  CODE
  _Hide:Access:CV.Kill                                     ! Kill the file manager
  PARENT.Kill
  Relate:CV &= NULL                                        ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CV)                                 ! destroy the file manager


Hide:Relate:CV.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CV')
       DbChangeTrigger.AddThread('CV')
       DbChangeTrigger.AddItem(CV:IDCV, WHO(CV:RECORD,WHERE(CV:RECORD,CV:IDCV)) , 'CV')
       DbChangeTrigger.AddItem(CV:DESCRIPCION, WHO(CV:RECORD,WHERE(CV:RECORD,CV:DESCRIPCION)) , 'CV')
       DbChangeTrigger.AddItem(CV:IDSOCIO, WHO(CV:RECORD,WHERE(CV:RECORD,CV:IDSOCIO)) , 'CV')
       DbChangeTrigger.AddItem(CV:IDINSTITUCION, WHO(CV:RECORD,WHERE(CV:RECORD,CV:IDINSTITUCION)) , 'CV')
       DbChangeTrigger.AddItem(CV:ID_TIPO_CURSO, WHO(CV:RECORD,WHERE(CV:RECORD,CV:ID_TIPO_CURSO)) , 'CV')
       DbChangeTrigger.AddItem(CV:ANO_EGRESO, WHO(CV:RECORD,WHERE(CV:RECORD,CV:ANO_EGRESO)) , 'CV')
       DbChangeTrigger.AddItem(CV:CANTIDAD_HORAS, WHO(CV:RECORD,WHERE(CV:RECORD,CV:CANTIDAD_HORAS)) , 'CV')
       DbChangeTrigger.AddItem(CV:OBSERVACION, WHO(CV:RECORD,WHERE(CV:RECORD,CV:OBSERVACION)) , 'CV')
    END
    DbChangeTrigger.Update('CV')


Hide:Relate:CV.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CV')
        DbChangeTrigger.CheckChanges('CV',CV) 
     END
  RETURN ReturnValue


Hide:Relate:DETALLE_FACTURA.Init PROCEDURE()
  CODE
  _Hide:Access:DETALLE_FACTURA.Init
  SELF.Init(Access:DETALLE_FACTURA,1)


Hide:Access:DETALLE_FACTURA.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('DETALLE_FACTURA')
      DbChangeTrigger.AddThread('DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:IDFACTURA, WHO(DET:RECORD,WHERE(DET:RECORD,DET:IDFACTURA)) , 'DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:CONCEPTO, WHO(DET:RECORD,WHERE(DET:RECORD,DET:CONCEPTO)) , 'DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:MES, WHO(DET:RECORD,WHERE(DET:RECORD,DET:MES)) , 'DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:ANO, WHO(DET:RECORD,WHERE(DET:RECORD,DET:ANO)) , 'DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:PERIODO, WHO(DET:RECORD,WHERE(DET:RECORD,DET:PERIODO)) , 'DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:MONTO, WHO(DET:RECORD,WHERE(DET:RECORD,DET:MONTO)) , 'DETALLE_FACTURA')
   END
   DbChangeTrigger.Update('DETALLE_FACTURA')
  RETURN ReturnValue


Hide:Access:DETALLE_FACTURA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DET:Record
  SELF.FileNameValue = 'DETALLE_FACTURA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DETALLE_FACTURA
  PARENT.Init
  Access:DETALLE_FACTURA &= SELF


Hide:Access:DETALLE_FACTURA.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('DETALLE_FACTURA',DETALLE_FACTURA)
  RETURN ReturnValue


Hide:Access:DETALLE_FACTURA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DETALLE_FACTURA &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DETALLE_FACTURA.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('DETALLE_FACTURA')
      DbChangeTrigger.AddThread('DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:IDFACTURA, WHO(DET:RECORD,WHERE(DET:RECORD,DET:IDFACTURA)) , 'DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:CONCEPTO, WHO(DET:RECORD,WHERE(DET:RECORD,DET:CONCEPTO)) , 'DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:MES, WHO(DET:RECORD,WHERE(DET:RECORD,DET:MES)) , 'DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:ANO, WHO(DET:RECORD,WHERE(DET:RECORD,DET:ANO)) , 'DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:PERIODO, WHO(DET:RECORD,WHERE(DET:RECORD,DET:PERIODO)) , 'DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:MONTO, WHO(DET:RECORD,WHERE(DET:RECORD,DET:MONTO)) , 'DETALLE_FACTURA')
   END
   DbChangeTrigger.Update('DETALLE_FACTURA')
  RETURN ReturnValue


Hide:Access:DETALLE_FACTURA.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('DETALLE_FACTURA')
      DbChangeTrigger.AddThread('DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:IDFACTURA, WHO(DET:RECORD,WHERE(DET:RECORD,DET:IDFACTURA)) , 'DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:CONCEPTO, WHO(DET:RECORD,WHERE(DET:RECORD,DET:CONCEPTO)) , 'DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:MES, WHO(DET:RECORD,WHERE(DET:RECORD,DET:MES)) , 'DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:ANO, WHO(DET:RECORD,WHERE(DET:RECORD,DET:ANO)) , 'DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:PERIODO, WHO(DET:RECORD,WHERE(DET:RECORD,DET:PERIODO)) , 'DETALLE_FACTURA')
      DbChangeTrigger.AddItem(DET:MONTO, WHO(DET:RECORD,WHERE(DET:RECORD,DET:MONTO)) , 'DETALLE_FACTURA')
   END
   DbChangeTrigger.Update('DETALLE_FACTURA')
  RETURN ReturnValue


Hide:Access:DETALLE_FACTURA.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('DETALLE_FACTURA')
       DbChangeTrigger.CheckChanges('DETALLE_FACTURA',DETALLE_FACTURA) 
    END
  RETURN ReturnValue


Hide:Access:DETALLE_FACTURA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DETALLE_FACTURA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(DET:PK_DETALLE_FACTURA,'DET:PK_DETALLE_FACTURA',0)
    SELF.AddKey(DET:FK_DETALLE_FACTURA,'DET:FK_DETALLE_FACTURA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:DETALLE_FACTURA.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:FACTURA1      USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('DET:IDFACTURA')
    Save:FACTURA1 = Access:FACTURA.SaveFile()
    FAC:IDFACTURA = DET:IDFACTURA
    ReturnValue = Access:FACTURA.TryFetch(FAC:PK_FACTURA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'FACTURA')
      END
    END
    Access:FACTURA.RestoreFile(Save:FACTURA1)
  END
  RETURN ReturnValue


Hide:Relate:DETALLE_FACTURA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:FACTURA)


Hide:Relate:DETALLE_FACTURA.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('DETALLE_FACTURA',DETALLE_FACTURA)
  RETURN ReturnValue


Hide:Relate:DETALLE_FACTURA.Kill PROCEDURE

  CODE
  _Hide:Access:DETALLE_FACTURA.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:DETALLE_FACTURA &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DETALLE_FACTURA)                    ! destroy the file manager


Hide:Relate:DETALLE_FACTURA.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('DETALLE_FACTURA')
       DbChangeTrigger.AddThread('DETALLE_FACTURA')
       DbChangeTrigger.AddItem(DET:IDFACTURA, WHO(DET:RECORD,WHERE(DET:RECORD,DET:IDFACTURA)) , 'DETALLE_FACTURA')
       DbChangeTrigger.AddItem(DET:CONCEPTO, WHO(DET:RECORD,WHERE(DET:RECORD,DET:CONCEPTO)) , 'DETALLE_FACTURA')
       DbChangeTrigger.AddItem(DET:MES, WHO(DET:RECORD,WHERE(DET:RECORD,DET:MES)) , 'DETALLE_FACTURA')
       DbChangeTrigger.AddItem(DET:ANO, WHO(DET:RECORD,WHERE(DET:RECORD,DET:ANO)) , 'DETALLE_FACTURA')
       DbChangeTrigger.AddItem(DET:PERIODO, WHO(DET:RECORD,WHERE(DET:RECORD,DET:PERIODO)) , 'DETALLE_FACTURA')
       DbChangeTrigger.AddItem(DET:MONTO, WHO(DET:RECORD,WHERE(DET:RECORD,DET:MONTO)) , 'DETALLE_FACTURA')
    END
    DbChangeTrigger.Update('DETALLE_FACTURA')


Hide:Relate:DETALLE_FACTURA.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('DETALLE_FACTURA')
        DbChangeTrigger.CheckChanges('DETALLE_FACTURA',DETALLE_FACTURA) 
     END
  RETURN ReturnValue


Hide:Relate:ESPECIALIDAD.Init PROCEDURE()
  CODE
  _Hide:Access:ESPECIALIDAD.Init
  SELF.Init(Access:ESPECIALIDAD,1)


Hide:Access:ESPECIALIDAD.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('ESPECIALIDAD')
      DbChangeTrigger.AddThread('ESPECIALIDAD')
      DbChangeTrigger.AddItem(ESP:IDESPECIALIDAD, WHO(ESP:RECORD,WHERE(ESP:RECORD,ESP:IDESPECIALIDAD)) , 'ESPECIALIDAD')
      DbChangeTrigger.AddItem(ESP:DESCRIPCION, WHO(ESP:RECORD,WHERE(ESP:RECORD,ESP:DESCRIPCION)) , 'ESPECIALIDAD')
   END
   DbChangeTrigger.Update('ESPECIALIDAD')
  RETURN ReturnValue


Hide:Access:ESPECIALIDAD.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ESP:Record
  SELF.FileNameValue = 'ESPECIALIDAD'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ESPECIALIDAD
  PARENT.Init
  Access:ESPECIALIDAD &= SELF


Hide:Access:ESPECIALIDAD.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('ESPECIALIDAD',ESPECIALIDAD)
  RETURN ReturnValue


Hide:Access:ESPECIALIDAD.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ESPECIALIDAD &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ESPECIALIDAD.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('ESPECIALIDAD')
      DbChangeTrigger.AddThread('ESPECIALIDAD')
      DbChangeTrigger.AddItem(ESP:IDESPECIALIDAD, WHO(ESP:RECORD,WHERE(ESP:RECORD,ESP:IDESPECIALIDAD)) , 'ESPECIALIDAD')
      DbChangeTrigger.AddItem(ESP:DESCRIPCION, WHO(ESP:RECORD,WHERE(ESP:RECORD,ESP:DESCRIPCION)) , 'ESPECIALIDAD')
   END
   DbChangeTrigger.Update('ESPECIALIDAD')
  RETURN ReturnValue


Hide:Access:ESPECIALIDAD.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('ESPECIALIDAD')
      DbChangeTrigger.AddThread('ESPECIALIDAD')
      DbChangeTrigger.AddItem(ESP:IDESPECIALIDAD, WHO(ESP:RECORD,WHERE(ESP:RECORD,ESP:IDESPECIALIDAD)) , 'ESPECIALIDAD')
      DbChangeTrigger.AddItem(ESP:DESCRIPCION, WHO(ESP:RECORD,WHERE(ESP:RECORD,ESP:DESCRIPCION)) , 'ESPECIALIDAD')
   END
   DbChangeTrigger.Update('ESPECIALIDAD')
  RETURN ReturnValue


Hide:Access:ESPECIALIDAD.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('ESPECIALIDAD')
       DbChangeTrigger.CheckChanges('ESPECIALIDAD',ESPECIALIDAD) 
    END
  RETURN ReturnValue


Hide:Access:ESPECIALIDAD.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ESPECIALIDAD,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(ESP:PK_ESPECIALIDAD,'ESP:PK_ESPECIALIDAD',0)
    SELF.AddKey(ESP:IDX_ESPECIALIDAD_DESCRIPCION,'ESP:IDX_ESPECIALIDAD_DESCRIPCION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ESPECIALIDAD.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:PADRONXESPECIALIDAD,RI:None,RI:None,PAD:FK_PADRONXESPECIALIDAD_ESP)
  SELF.AddRelationLink(ESP:IDESPECIALIDAD,PAD:IDESPECIALIDAD)


Hide:Relate:ESPECIALIDAD.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('ESPECIALIDAD',ESPECIALIDAD)
  RETURN ReturnValue


Hide:Relate:ESPECIALIDAD.Kill PROCEDURE

  CODE
  _Hide:Access:ESPECIALIDAD.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:ESPECIALIDAD &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ESPECIALIDAD)                       ! destroy the file manager


Hide:Relate:ESPECIALIDAD.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('ESPECIALIDAD')
       DbChangeTrigger.AddThread('ESPECIALIDAD')
       DbChangeTrigger.AddItem(ESP:IDESPECIALIDAD, WHO(ESP:RECORD,WHERE(ESP:RECORD,ESP:IDESPECIALIDAD)) , 'ESPECIALIDAD')
       DbChangeTrigger.AddItem(ESP:DESCRIPCION, WHO(ESP:RECORD,WHERE(ESP:RECORD,ESP:DESCRIPCION)) , 'ESPECIALIDAD')
    END
    DbChangeTrigger.Update('ESPECIALIDAD')


Hide:Relate:ESPECIALIDAD.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('ESPECIALIDAD')
        DbChangeTrigger.CheckChanges('ESPECIALIDAD',ESPECIALIDAD) 
     END
  RETURN ReturnValue


Hide:Relate:FACTURA.Init PROCEDURE()
  CODE
  _Hide:Access:FACTURA.Init
  SELF.Init(Access:FACTURA,1)


Hide:Access:FACTURA.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('FACTURA')
      DbChangeTrigger.AddThread('FACTURA')
      DbChangeTrigger.AddItem(FAC:IDFACTURA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDFACTURA)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:IDSOCIO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDSOCIO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:IDUSUARIO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDUSUARIO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:MONTOCOBERTURA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:MONTOCOBERTURA)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:INTERES, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:INTERES)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:TOTAL, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:TOTAL)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:MES, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:MES)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:ANO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:ANO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:PERIODO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:PERIODO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:FECHA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:FECHA)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:HORA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:HORA)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:ESTADO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:ESTADO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:DESCUENTOCOBERTURA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:DESCUENTOCOBERTURA)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:DESCUENTOESPECIAL, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:DESCUENTOESPECIAL)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:IDPAGO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDPAGO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:IDPAGO_LIQ, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDPAGO_LIQ)) , 'FACTURA')
   END
   DbChangeTrigger.Update('FACTURA')
  RETURN ReturnValue


Hide:Access:FACTURA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FAC:Record
  SELF.FileNameValue = 'FACTURA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= FACTURA
  PARENT.Init
  Access:FACTURA &= SELF


Hide:Access:FACTURA.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('FACTURA',FACTURA)
  RETURN ReturnValue


Hide:Access:FACTURA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:FACTURA &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:FACTURA.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('FACTURA')
      DbChangeTrigger.AddThread('FACTURA')
      DbChangeTrigger.AddItem(FAC:IDFACTURA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDFACTURA)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:IDSOCIO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDSOCIO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:IDUSUARIO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDUSUARIO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:MONTOCOBERTURA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:MONTOCOBERTURA)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:INTERES, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:INTERES)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:TOTAL, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:TOTAL)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:MES, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:MES)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:ANO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:ANO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:PERIODO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:PERIODO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:FECHA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:FECHA)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:HORA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:HORA)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:ESTADO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:ESTADO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:DESCUENTOCOBERTURA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:DESCUENTOCOBERTURA)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:DESCUENTOESPECIAL, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:DESCUENTOESPECIAL)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:IDPAGO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDPAGO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:IDPAGO_LIQ, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDPAGO_LIQ)) , 'FACTURA')
   END
   DbChangeTrigger.Update('FACTURA')
  RETURN ReturnValue


Hide:Access:FACTURA.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('FACTURA')
      DbChangeTrigger.AddThread('FACTURA')
      DbChangeTrigger.AddItem(FAC:IDFACTURA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDFACTURA)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:IDSOCIO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDSOCIO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:IDUSUARIO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDUSUARIO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:MONTOCOBERTURA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:MONTOCOBERTURA)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:INTERES, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:INTERES)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:TOTAL, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:TOTAL)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:MES, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:MES)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:ANO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:ANO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:PERIODO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:PERIODO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:FECHA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:FECHA)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:HORA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:HORA)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:ESTADO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:ESTADO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:DESCUENTOCOBERTURA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:DESCUENTOCOBERTURA)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:DESCUENTOESPECIAL, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:DESCUENTOESPECIAL)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:IDPAGO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDPAGO)) , 'FACTURA')
      DbChangeTrigger.AddItem(FAC:IDPAGO_LIQ, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDPAGO_LIQ)) , 'FACTURA')
   END
   DbChangeTrigger.Update('FACTURA')
  RETURN ReturnValue


Hide:Access:FACTURA.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('FACTURA')
       DbChangeTrigger.CheckChanges('FACTURA',FACTURA) 
    END
  RETURN ReturnValue


Hide:Access:FACTURA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(FACTURA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(FAC:PK_FACTURA,'FAC:PK_FACTURA',0)
    SELF.AddKey(FAC:FK_FACTURA_SOCIO,'FAC:FK_FACTURA_SOCIO',0)
    SELF.AddKey(FAC:FK_FACTURA_USUARIO,'FAC:FK_FACTURA_USUARIO',0)
    SELF.AddKey(FAC:IDX_FACTURA_ANO,'FAC:IDX_FACTURA_ANO',0)
    SELF.AddKey(FAC:IDX_FACTURA_ESTADO,'FAC:IDX_FACTURA_ESTADO',0)
    SELF.AddKey(FAC:IDX_FACTURA_FECHA,'FAC:IDX_FACTURA_FECHA',0)
    SELF.AddKey(FAC:IDX_FACTURA_MES,'FAC:IDX_FACTURA_MES',0)
    SELF.AddKey(FAC:IDX_FACTURA_PERIODO,'FAC:IDX_FACTURA_PERIODO',0)
    SELF.AddKey(FAC:IDX_FACTURA_TOTAL,'FAC:IDX_FACTURA_TOTAL',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:FACTURA.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS2       USHORT,AUTO
Save:USUARIO3      USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('FAC:IDSOCIO')
    Save:SOCIOS2 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = FAC:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS2)
  OF 3
    GlobalErrors.SetField('FAC:IDUSUARIO')
    Save:USUARIO3 = Access:USUARIO.SaveFile()
    USU:IDUSUARIO = FAC:IDUSUARIO
    ReturnValue = Access:USUARIO.TryFetch(USU:PK_USUARIO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'USUARIO')
      END
    END
    Access:USUARIO.RestoreFile(Save:USUARIO3)
  END
  RETURN ReturnValue


Hide:Relate:FACTURA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:FACTURA_CONVENIO,RI:None,RI:None,FACXCONV:FK_FACTURA_CONVENIO_FACTURA)
  SELF.AddRelationLink(FAC:IDFACTURA,FACXCONV:IDFACTURA)

  SELF.AddRelation(Relate:FACTURAXCUPON,RI:None,RI:None,FAC2:PK_FACTURAXCUPON)
  SELF.AddRelationLink(FAC:IDFACTURA,FAC2:IDFACTURA)

  SELF.AddRelation(Relate:PAGOS,RI:None,RI:None,PAG:FK_PAGOS_FACTURA)
  SELF.AddRelationLink(FAC:IDFACTURA,PAG:IDFACTURA)

  SELF.AddRelation(Relate:DETALLE_FACTURA,RI:None,RI:None,DET:FK_DETALLE_FACTURA)
  SELF.AddRelationLink(FAC:IDFACTURA,DET:IDFACTURA)

  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:USUARIO)


Hide:Relate:FACTURA.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('FACTURA',FACTURA)
  RETURN ReturnValue


Hide:Relate:FACTURA.Kill PROCEDURE

  CODE
  _Hide:Access:FACTURA.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:FACTURA &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:FACTURA)                            ! destroy the file manager


Hide:Relate:FACTURA.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('FACTURA')
       DbChangeTrigger.AddThread('FACTURA')
       DbChangeTrigger.AddItem(FAC:IDFACTURA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDFACTURA)) , 'FACTURA')
       DbChangeTrigger.AddItem(FAC:IDSOCIO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDSOCIO)) , 'FACTURA')
       DbChangeTrigger.AddItem(FAC:IDUSUARIO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDUSUARIO)) , 'FACTURA')
       DbChangeTrigger.AddItem(FAC:MONTOCOBERTURA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:MONTOCOBERTURA)) , 'FACTURA')
       DbChangeTrigger.AddItem(FAC:INTERES, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:INTERES)) , 'FACTURA')
       DbChangeTrigger.AddItem(FAC:TOTAL, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:TOTAL)) , 'FACTURA')
       DbChangeTrigger.AddItem(FAC:MES, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:MES)) , 'FACTURA')
       DbChangeTrigger.AddItem(FAC:ANO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:ANO)) , 'FACTURA')
       DbChangeTrigger.AddItem(FAC:PERIODO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:PERIODO)) , 'FACTURA')
       DbChangeTrigger.AddItem(FAC:FECHA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:FECHA)) , 'FACTURA')
       DbChangeTrigger.AddItem(FAC:HORA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:HORA)) , 'FACTURA')
       DbChangeTrigger.AddItem(FAC:ESTADO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:ESTADO)) , 'FACTURA')
       DbChangeTrigger.AddItem(FAC:DESCUENTOCOBERTURA, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:DESCUENTOCOBERTURA)) , 'FACTURA')
       DbChangeTrigger.AddItem(FAC:DESCUENTOESPECIAL, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:DESCUENTOESPECIAL)) , 'FACTURA')
       DbChangeTrigger.AddItem(FAC:IDPAGO, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDPAGO)) , 'FACTURA')
       DbChangeTrigger.AddItem(FAC:IDPAGO_LIQ, WHO(FAC:RECORD,WHERE(FAC:RECORD,FAC:IDPAGO_LIQ)) , 'FACTURA')
    END
    DbChangeTrigger.Update('FACTURA')


Hide:Relate:FACTURA.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('FACTURA')
        DbChangeTrigger.CheckChanges('FACTURA',FACTURA) 
     END
  RETURN ReturnValue


Hide:Relate:INSPECTOR.Init PROCEDURE()
  CODE
  _Hide:Access:INSPECTOR.Init
  SELF.Init(Access:INSPECTOR,1)


Hide:Access:INSPECTOR.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('INSPECTOR')
      DbChangeTrigger.AddThread('INSPECTOR')
      DbChangeTrigger.AddItem(INS:IDINSPECTOR, WHO(INS:RECORD,WHERE(INS:RECORD,INS:IDINSPECTOR)) , 'INSPECTOR')
      DbChangeTrigger.AddItem(INS:IDSOCIO, WHO(INS:RECORD,WHERE(INS:RECORD,INS:IDSOCIO)) , 'INSPECTOR')
      DbChangeTrigger.AddItem(INS:OBSERVACION, WHO(INS:RECORD,WHERE(INS:RECORD,INS:OBSERVACION)) , 'INSPECTOR')
   END
   DbChangeTrigger.Update('INSPECTOR')
  RETURN ReturnValue


Hide:Access:INSPECTOR.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= INS:Record
  SELF.FileNameValue = 'INSPECTOR'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= INSPECTOR
  PARENT.Init
  Access:INSPECTOR &= SELF


Hide:Access:INSPECTOR.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('INSPECTOR',INSPECTOR)
  RETURN ReturnValue


Hide:Access:INSPECTOR.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:INSPECTOR &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:INSPECTOR.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('INSPECTOR')
      DbChangeTrigger.AddThread('INSPECTOR')
      DbChangeTrigger.AddItem(INS:IDINSPECTOR, WHO(INS:RECORD,WHERE(INS:RECORD,INS:IDINSPECTOR)) , 'INSPECTOR')
      DbChangeTrigger.AddItem(INS:IDSOCIO, WHO(INS:RECORD,WHERE(INS:RECORD,INS:IDSOCIO)) , 'INSPECTOR')
      DbChangeTrigger.AddItem(INS:OBSERVACION, WHO(INS:RECORD,WHERE(INS:RECORD,INS:OBSERVACION)) , 'INSPECTOR')
   END
   DbChangeTrigger.Update('INSPECTOR')
  RETURN ReturnValue


Hide:Access:INSPECTOR.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('INSPECTOR')
      DbChangeTrigger.AddThread('INSPECTOR')
      DbChangeTrigger.AddItem(INS:IDINSPECTOR, WHO(INS:RECORD,WHERE(INS:RECORD,INS:IDINSPECTOR)) , 'INSPECTOR')
      DbChangeTrigger.AddItem(INS:IDSOCIO, WHO(INS:RECORD,WHERE(INS:RECORD,INS:IDSOCIO)) , 'INSPECTOR')
      DbChangeTrigger.AddItem(INS:OBSERVACION, WHO(INS:RECORD,WHERE(INS:RECORD,INS:OBSERVACION)) , 'INSPECTOR')
   END
   DbChangeTrigger.Update('INSPECTOR')
  RETURN ReturnValue


Hide:Access:INSPECTOR.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('INSPECTOR')
       DbChangeTrigger.CheckChanges('INSPECTOR',INSPECTOR) 
    END
  RETURN ReturnValue


Hide:Access:INSPECTOR.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(INSPECTOR,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(INS:PK_INSPECTOR,'INS:PK_INSPECTOR',0)
    SELF.AddKey(INS:FK_INSPECTOR_SOCIOS,'INS:FK_INSPECTOR_SOCIOS',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:INSPECTOR.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS2       USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('INS:IDSOCIO')
    Save:SOCIOS2 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = INS:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS2)
  END
  RETURN ReturnValue


Hide:Relate:INSPECTOR.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CONSULTORIO,RI:None,RI:None,CON2:FK_CONSULTORIO_INSPECTOR)
  SELF.AddRelationLink(INS:IDINSPECTOR,CON2:IDINSPECTOR)

  SELF.AddRelation(Relate:SOCIOS)


Hide:Relate:INSPECTOR.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('INSPECTOR',INSPECTOR)
  RETURN ReturnValue


Hide:Relate:INSPECTOR.Kill PROCEDURE

  CODE
  _Hide:Access:INSPECTOR.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:INSPECTOR &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:INSPECTOR)                          ! destroy the file manager


Hide:Relate:INSPECTOR.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('INSPECTOR')
       DbChangeTrigger.AddThread('INSPECTOR')
       DbChangeTrigger.AddItem(INS:IDINSPECTOR, WHO(INS:RECORD,WHERE(INS:RECORD,INS:IDINSPECTOR)) , 'INSPECTOR')
       DbChangeTrigger.AddItem(INS:IDSOCIO, WHO(INS:RECORD,WHERE(INS:RECORD,INS:IDSOCIO)) , 'INSPECTOR')
       DbChangeTrigger.AddItem(INS:OBSERVACION, WHO(INS:RECORD,WHERE(INS:RECORD,INS:OBSERVACION)) , 'INSPECTOR')
    END
    DbChangeTrigger.Update('INSPECTOR')


Hide:Relate:INSPECTOR.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('INSPECTOR')
        DbChangeTrigger.CheckChanges('INSPECTOR',INSPECTOR) 
     END
  RETURN ReturnValue


Hide:Relate:INSTITUCION.Init PROCEDURE()
  CODE
  _Hide:Access:INSTITUCION.Init
  SELF.Init(Access:INSTITUCION,1)


Hide:Access:INSTITUCION.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('INSTITUCION')
      DbChangeTrigger.AddThread('INSTITUCION')
      DbChangeTrigger.AddItem(INS2:IDINSTITUCION, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:IDINSTITUCION)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:IDTIPO_INSTITUCION, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:IDTIPO_INSTITUCION)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:IDLOCALIDAD, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:IDLOCALIDAD)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:NOMBRE, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:NOMBRE)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:DIRECCION, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:DIRECCION)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:TELEFONO, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:TELEFONO)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:E_MAIL, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:E_MAIL)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:NOMBRE_CORTO, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:NOMBRE_CORTO)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:TIPO_ESTADO, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:TIPO_ESTADO)) , 'INSTITUCION')
   END
   DbChangeTrigger.Update('INSTITUCION')
  RETURN ReturnValue


Hide:Access:INSTITUCION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= INS2:Record
  SELF.FileNameValue = 'INSTITUCION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= INSTITUCION
  PARENT.Init
  Access:INSTITUCION &= SELF


Hide:Access:INSTITUCION.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('INSTITUCION',INSTITUCION)
  RETURN ReturnValue


Hide:Access:INSTITUCION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:INSTITUCION &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:INSTITUCION.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('INSTITUCION')
      DbChangeTrigger.AddThread('INSTITUCION')
      DbChangeTrigger.AddItem(INS2:IDINSTITUCION, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:IDINSTITUCION)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:IDTIPO_INSTITUCION, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:IDTIPO_INSTITUCION)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:IDLOCALIDAD, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:IDLOCALIDAD)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:NOMBRE, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:NOMBRE)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:DIRECCION, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:DIRECCION)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:TELEFONO, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:TELEFONO)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:E_MAIL, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:E_MAIL)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:NOMBRE_CORTO, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:NOMBRE_CORTO)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:TIPO_ESTADO, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:TIPO_ESTADO)) , 'INSTITUCION')
   END
   DbChangeTrigger.Update('INSTITUCION')
  RETURN ReturnValue


Hide:Access:INSTITUCION.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('INSTITUCION')
      DbChangeTrigger.AddThread('INSTITUCION')
      DbChangeTrigger.AddItem(INS2:IDINSTITUCION, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:IDINSTITUCION)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:IDTIPO_INSTITUCION, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:IDTIPO_INSTITUCION)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:IDLOCALIDAD, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:IDLOCALIDAD)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:NOMBRE, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:NOMBRE)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:DIRECCION, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:DIRECCION)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:TELEFONO, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:TELEFONO)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:E_MAIL, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:E_MAIL)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:NOMBRE_CORTO, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:NOMBRE_CORTO)) , 'INSTITUCION')
      DbChangeTrigger.AddItem(INS2:TIPO_ESTADO, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:TIPO_ESTADO)) , 'INSTITUCION')
   END
   DbChangeTrigger.Update('INSTITUCION')
  RETURN ReturnValue


Hide:Access:INSTITUCION.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('INSTITUCION')
       DbChangeTrigger.CheckChanges('INSTITUCION',INSTITUCION) 
    END
  RETURN ReturnValue


Hide:Access:INSTITUCION.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(INSTITUCION,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(INS2:PK_INSTITUCION,'INS2:PK_INSTITUCION',0)
    SELF.AddKey(INS2:IDX_INSTITUCION_NOMBRE,'INS2:IDX_INSTITUCION_NOMBRE',0)
    SELF.AddKey(INS2:FK_INSTITUCION_LOCALIDAD,'INS2:FK_INSTITUCION_LOCALIDAD',0)
    SELF.AddKey(INS2:FK_INSTITUCION_TIPO,'INS2:FK_INSTITUCION_TIPO',0)
    SELF.AddKey(INS2:IDX_INSTITUCION_NOMBRECORTO,'INS2:IDX_INSTITUCION_NOMBRECORTO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:INSTITUCION.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:TIPO_INSTITUCION2 USHORT,AUTO
Save:LOCALIDAD3    USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('INS2:IDTIPO_INSTITUCION')
    Save:TIPO_INSTITUCION2 = Access:TIPO_INSTITUCION.SaveFile()
    TIP4:IDTIPO_INSTITUCION = INS2:IDTIPO_INSTITUCION
    ReturnValue = Access:TIPO_INSTITUCION.TryFetch(TIP4:PK_T_INSTITUCION)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_INSTITUCION')
      END
    END
    Access:TIPO_INSTITUCION.RestoreFile(Save:TIPO_INSTITUCION2)
  OF 3
    GlobalErrors.SetField('INS2:IDLOCALIDAD')
    Save:LOCALIDAD3 = Access:LOCALIDAD.SaveFile()
    LOC:IDLOCALIDAD = INS2:IDLOCALIDAD
    ReturnValue = Access:LOCALIDAD.TryFetch(LOC:PK_LOCALIDAD)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'LOCALIDAD')
      END
    END
    Access:LOCALIDAD.RestoreFile(Save:LOCALIDAD3)
  END
  RETURN ReturnValue


Hide:Relate:INSTITUCION.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CV,RI:None,RI:None,CV:FK_CV_INSTITUCION)
  SELF.AddRelationLink(INS2:IDINSTITUCION,CV:IDINSTITUCION)

  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_INSTITUCION)
  SELF.AddRelationLink(INS2:IDINSTITUCION,SOC:IDINSTITUCION)

  SELF.AddRelation(Relate:LOCALIDAD)

  SELF.AddRelation(Relate:TIPO_INSTITUCION)


Hide:Relate:INSTITUCION.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('INSTITUCION',INSTITUCION)
  RETURN ReturnValue


Hide:Relate:INSTITUCION.Kill PROCEDURE

  CODE
  _Hide:Access:INSTITUCION.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:INSTITUCION &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:INSTITUCION)                        ! destroy the file manager


Hide:Relate:INSTITUCION.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('INSTITUCION')
       DbChangeTrigger.AddThread('INSTITUCION')
       DbChangeTrigger.AddItem(INS2:IDINSTITUCION, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:IDINSTITUCION)) , 'INSTITUCION')
       DbChangeTrigger.AddItem(INS2:IDTIPO_INSTITUCION, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:IDTIPO_INSTITUCION)) , 'INSTITUCION')
       DbChangeTrigger.AddItem(INS2:IDLOCALIDAD, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:IDLOCALIDAD)) , 'INSTITUCION')
       DbChangeTrigger.AddItem(INS2:NOMBRE, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:NOMBRE)) , 'INSTITUCION')
       DbChangeTrigger.AddItem(INS2:DIRECCION, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:DIRECCION)) , 'INSTITUCION')
       DbChangeTrigger.AddItem(INS2:TELEFONO, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:TELEFONO)) , 'INSTITUCION')
       DbChangeTrigger.AddItem(INS2:E_MAIL, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:E_MAIL)) , 'INSTITUCION')
       DbChangeTrigger.AddItem(INS2:NOMBRE_CORTO, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:NOMBRE_CORTO)) , 'INSTITUCION')
       DbChangeTrigger.AddItem(INS2:TIPO_ESTADO, WHO(INS2:RECORD,WHERE(INS2:RECORD,INS2:TIPO_ESTADO)) , 'INSTITUCION')
    END
    DbChangeTrigger.Update('INSTITUCION')


Hide:Relate:INSTITUCION.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('INSTITUCION')
        DbChangeTrigger.CheckChanges('INSTITUCION',INSTITUCION) 
     END
  RETURN ReturnValue


Hide:Relate:TIPO_COMPROBANTE.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_COMPROBANTE.Init
  SELF.Init(Access:TIPO_COMPROBANTE,1)


Hide:Access:TIPO_COMPROBANTE.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_COMPROBANTE')
      DbChangeTrigger.AddThread('TIPO_COMPROBANTE')
      DbChangeTrigger.AddItem(TIPCOM:IDTIPO_COMPROBANTE, WHO(TIPCOM:RECORD,WHERE(TIPCOM:RECORD,TIPCOM:IDTIPO_COMPROBANTE)) , 'TIPO_COMPROBANTE')
      DbChangeTrigger.AddItem(TIPCOM:DESCRIPCION, WHO(TIPCOM:RECORD,WHERE(TIPCOM:RECORD,TIPCOM:DESCRIPCION)) , 'TIPO_COMPROBANTE')
   END
   DbChangeTrigger.Update('TIPO_COMPROBANTE')
  RETURN ReturnValue


Hide:Access:TIPO_COMPROBANTE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIPCOM:Record
  SELF.FileNameValue = 'TIPO_COMPROBANTE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_COMPROBANTE
  PARENT.Init
  Access:TIPO_COMPROBANTE &= SELF


Hide:Access:TIPO_COMPROBANTE.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('TIPO_COMPROBANTE',TIPO_COMPROBANTE)
  RETURN ReturnValue


Hide:Access:TIPO_COMPROBANTE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_COMPROBANTE &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TIPO_COMPROBANTE.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('TIPO_COMPROBANTE')
      DbChangeTrigger.AddThread('TIPO_COMPROBANTE')
      DbChangeTrigger.AddItem(TIPCOM:IDTIPO_COMPROBANTE, WHO(TIPCOM:RECORD,WHERE(TIPCOM:RECORD,TIPCOM:IDTIPO_COMPROBANTE)) , 'TIPO_COMPROBANTE')
      DbChangeTrigger.AddItem(TIPCOM:DESCRIPCION, WHO(TIPCOM:RECORD,WHERE(TIPCOM:RECORD,TIPCOM:DESCRIPCION)) , 'TIPO_COMPROBANTE')
   END
   DbChangeTrigger.Update('TIPO_COMPROBANTE')
  RETURN ReturnValue


Hide:Access:TIPO_COMPROBANTE.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_COMPROBANTE')
      DbChangeTrigger.AddThread('TIPO_COMPROBANTE')
      DbChangeTrigger.AddItem(TIPCOM:IDTIPO_COMPROBANTE, WHO(TIPCOM:RECORD,WHERE(TIPCOM:RECORD,TIPCOM:IDTIPO_COMPROBANTE)) , 'TIPO_COMPROBANTE')
      DbChangeTrigger.AddItem(TIPCOM:DESCRIPCION, WHO(TIPCOM:RECORD,WHERE(TIPCOM:RECORD,TIPCOM:DESCRIPCION)) , 'TIPO_COMPROBANTE')
   END
   DbChangeTrigger.Update('TIPO_COMPROBANTE')
  RETURN ReturnValue


Hide:Access:TIPO_COMPROBANTE.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('TIPO_COMPROBANTE')
       DbChangeTrigger.CheckChanges('TIPO_COMPROBANTE',TIPO_COMPROBANTE) 
    END
  RETURN ReturnValue


Hide:Access:TIPO_COMPROBANTE.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TIPO_COMPROBANTE,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TIPCOM:IDX_TIPO_COMPROBANTE_DEC,'TIPCOM:IDX_TIPO_COMPROBANTE_DEC',0)
    SELF.AddKey(TIPCOM:PK_TIPO_COMPROBANTE,'TIPCOM:PK_TIPO_COMPROBANTE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TIPO_COMPROBANTE.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GASTOS,RI:None,RI:None,GAS:FK_GASTOS_TIPO_COMPROBANTE)
  SELF.AddRelationLink(TIPCOM:IDTIPO_COMPROBANTE,GAS:IDTIPO_COMPROBANTE)


Hide:Relate:TIPO_COMPROBANTE.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('TIPO_COMPROBANTE',TIPO_COMPROBANTE)
  RETURN ReturnValue


Hide:Relate:TIPO_COMPROBANTE.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_COMPROBANTE.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_COMPROBANTE &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_COMPROBANTE)                   ! destroy the file manager


Hide:Relate:TIPO_COMPROBANTE.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('TIPO_COMPROBANTE')
       DbChangeTrigger.AddThread('TIPO_COMPROBANTE')
       DbChangeTrigger.AddItem(TIPCOM:IDTIPO_COMPROBANTE, WHO(TIPCOM:RECORD,WHERE(TIPCOM:RECORD,TIPCOM:IDTIPO_COMPROBANTE)) , 'TIPO_COMPROBANTE')
       DbChangeTrigger.AddItem(TIPCOM:DESCRIPCION, WHO(TIPCOM:RECORD,WHERE(TIPCOM:RECORD,TIPCOM:DESCRIPCION)) , 'TIPO_COMPROBANTE')
    END
    DbChangeTrigger.Update('TIPO_COMPROBANTE')


Hide:Relate:TIPO_COMPROBANTE.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('TIPO_COMPROBANTE')
        DbChangeTrigger.CheckChanges('TIPO_COMPROBANTE',TIPO_COMPROBANTE) 
     END
  RETURN ReturnValue


Hide:Relate:LOCALIDAD.Init PROCEDURE()
  CODE
  _Hide:Access:LOCALIDAD.Init
  SELF.Init(Access:LOCALIDAD,1)


Hide:Access:LOCALIDAD.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('LOCALIDAD')
      DbChangeTrigger.AddThread('LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:IDLOCALIDAD, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:IDLOCALIDAD)) , 'LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:DESCRIPCION, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:DESCRIPCION)) , 'LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:CP, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:CP)) , 'LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:CPNUEVO, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:CPNUEVO)) , 'LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:IDPAIS, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:IDPAIS)) , 'LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:COD_TELEFONICO, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:COD_TELEFONICO)) , 'LOCALIDAD')
   END
   DbChangeTrigger.Update('LOCALIDAD')
  RETURN ReturnValue


Hide:Access:LOCALIDAD.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LOC:Record
  SELF.FileNameValue = 'LOCALIDAD'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LOCALIDAD
  PARENT.Init
  Access:LOCALIDAD &= SELF


Hide:Access:LOCALIDAD.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('LOCALIDAD',LOCALIDAD)
  RETURN ReturnValue


Hide:Access:LOCALIDAD.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LOCALIDAD &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LOCALIDAD.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('LOCALIDAD')
      DbChangeTrigger.AddThread('LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:IDLOCALIDAD, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:IDLOCALIDAD)) , 'LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:DESCRIPCION, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:DESCRIPCION)) , 'LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:CP, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:CP)) , 'LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:CPNUEVO, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:CPNUEVO)) , 'LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:IDPAIS, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:IDPAIS)) , 'LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:COD_TELEFONICO, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:COD_TELEFONICO)) , 'LOCALIDAD')
   END
   DbChangeTrigger.Update('LOCALIDAD')
  RETURN ReturnValue


Hide:Access:LOCALIDAD.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('LOCALIDAD')
      DbChangeTrigger.AddThread('LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:IDLOCALIDAD, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:IDLOCALIDAD)) , 'LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:DESCRIPCION, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:DESCRIPCION)) , 'LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:CP, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:CP)) , 'LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:CPNUEVO, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:CPNUEVO)) , 'LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:IDPAIS, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:IDPAIS)) , 'LOCALIDAD')
      DbChangeTrigger.AddItem(LOC:COD_TELEFONICO, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:COD_TELEFONICO)) , 'LOCALIDAD')
   END
   DbChangeTrigger.Update('LOCALIDAD')
  RETURN ReturnValue


Hide:Access:LOCALIDAD.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('LOCALIDAD')
       DbChangeTrigger.CheckChanges('LOCALIDAD',LOCALIDAD) 
    END
  RETURN ReturnValue


Hide:Access:LOCALIDAD.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LOCALIDAD,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(LOC:PK_LOCALIDAD,'LOC:PK_LOCALIDAD',0)
    SELF.AddKey(LOC:FK_LOCALIDAD_PAIS,'LOC:FK_LOCALIDAD_PAIS',0)
    SELF.AddKey(LOC:KEY_CP,'LOC:KEY_CP',0)
    SELF.AddKey(LOC:NOMBRE,'LOC:NOMBRE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:LOCALIDAD.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:PAIS5         USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 5
    GlobalErrors.SetField('LOC:IDPAIS')
    Save:PAIS5 = Access:PAIS.SaveFile()
    PAI:IDPAIS = LOC:IDPAIS
    ReturnValue = Access:PAIS.TryFetch(PAI:PK_PAIS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'PAIS')
      END
    END
    Access:PAIS.RestoreFile(Save:PAIS5)
  END
  RETURN ReturnValue


Hide:Relate:LOCALIDAD.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TRABAJO,RI:None,RI:None,TRA:FK_TRABAJO_LOCALIDAD)
  SELF.AddRelationLink(LOC:IDLOCALIDAD,TRA:IDLOCALIDAD)

  SELF.AddRelation(Relate:CONSULTORIO,RI:None,RI:None,CON2:FK_CONSULTORIO_LOCALIDAD)
  SELF.AddRelationLink(LOC:IDLOCALIDAD,CON2:IDLOCALIDAD)

  SELF.AddRelation(Relate:INSTITUCION,RI:None,RI:None,INS2:FK_INSTITUCION_LOCALIDAD)
  SELF.AddRelationLink(LOC:IDLOCALIDAD,INS2:IDLOCALIDAD)

  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_LOCALIDAD)
  SELF.AddRelationLink(LOC:IDLOCALIDAD,SOC:IDLOCALIDAD)

  SELF.AddRelation(Relate:PAIS)


Hide:Relate:LOCALIDAD.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('LOCALIDAD',LOCALIDAD)
  RETURN ReturnValue


Hide:Relate:LOCALIDAD.Kill PROCEDURE

  CODE
  _Hide:Access:LOCALIDAD.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:LOCALIDAD &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LOCALIDAD)                          ! destroy the file manager


Hide:Relate:LOCALIDAD.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('LOCALIDAD')
       DbChangeTrigger.AddThread('LOCALIDAD')
       DbChangeTrigger.AddItem(LOC:IDLOCALIDAD, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:IDLOCALIDAD)) , 'LOCALIDAD')
       DbChangeTrigger.AddItem(LOC:DESCRIPCION, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:DESCRIPCION)) , 'LOCALIDAD')
       DbChangeTrigger.AddItem(LOC:CP, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:CP)) , 'LOCALIDAD')
       DbChangeTrigger.AddItem(LOC:CPNUEVO, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:CPNUEVO)) , 'LOCALIDAD')
       DbChangeTrigger.AddItem(LOC:IDPAIS, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:IDPAIS)) , 'LOCALIDAD')
       DbChangeTrigger.AddItem(LOC:COD_TELEFONICO, WHO(LOC:RECORD,WHERE(LOC:RECORD,LOC:COD_TELEFONICO)) , 'LOCALIDAD')
    END
    DbChangeTrigger.Update('LOCALIDAD')


Hide:Relate:LOCALIDAD.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('LOCALIDAD')
        DbChangeTrigger.CheckChanges('LOCALIDAD',LOCALIDAD) 
     END
  RETURN ReturnValue


Hide:Relate:PADRONXESPECIALIDAD.Init PROCEDURE()
  CODE
  _Hide:Access:PADRONXESPECIALIDAD.Init
  SELF.Init(Access:PADRONXESPECIALIDAD,1)


Hide:Access:PADRONXESPECIALIDAD.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('PADRONXESPECIALIDAD')
      DbChangeTrigger.AddThread('PADRONXESPECIALIDAD')
      DbChangeTrigger.AddItem(PAD:IDESPECIALIDAD, WHO(PAD:RECORD,WHERE(PAD:RECORD,PAD:IDESPECIALIDAD)) , 'PADRONXESPECIALIDAD')
      DbChangeTrigger.AddItem(PAD:IDSOCIO, WHO(PAD:RECORD,WHERE(PAD:RECORD,PAD:IDSOCIO)) , 'PADRONXESPECIALIDAD')
   END
   DbChangeTrigger.Update('PADRONXESPECIALIDAD')
  RETURN ReturnValue


Hide:Access:PADRONXESPECIALIDAD.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PAD:Record
  SELF.FileNameValue = 'PADRONXESPECIALIDAD'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PADRONXESPECIALIDAD
  PARENT.Init
  Access:PADRONXESPECIALIDAD &= SELF


Hide:Access:PADRONXESPECIALIDAD.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('PADRONXESPECIALIDAD',PADRONXESPECIALIDAD)
  RETURN ReturnValue


Hide:Access:PADRONXESPECIALIDAD.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PADRONXESPECIALIDAD &= NULL                       ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PADRONXESPECIALIDAD.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('PADRONXESPECIALIDAD')
      DbChangeTrigger.AddThread('PADRONXESPECIALIDAD')
      DbChangeTrigger.AddItem(PAD:IDESPECIALIDAD, WHO(PAD:RECORD,WHERE(PAD:RECORD,PAD:IDESPECIALIDAD)) , 'PADRONXESPECIALIDAD')
      DbChangeTrigger.AddItem(PAD:IDSOCIO, WHO(PAD:RECORD,WHERE(PAD:RECORD,PAD:IDSOCIO)) , 'PADRONXESPECIALIDAD')
   END
   DbChangeTrigger.Update('PADRONXESPECIALIDAD')
  RETURN ReturnValue


Hide:Access:PADRONXESPECIALIDAD.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('PADRONXESPECIALIDAD')
      DbChangeTrigger.AddThread('PADRONXESPECIALIDAD')
      DbChangeTrigger.AddItem(PAD:IDESPECIALIDAD, WHO(PAD:RECORD,WHERE(PAD:RECORD,PAD:IDESPECIALIDAD)) , 'PADRONXESPECIALIDAD')
      DbChangeTrigger.AddItem(PAD:IDSOCIO, WHO(PAD:RECORD,WHERE(PAD:RECORD,PAD:IDSOCIO)) , 'PADRONXESPECIALIDAD')
   END
   DbChangeTrigger.Update('PADRONXESPECIALIDAD')
  RETURN ReturnValue


Hide:Access:PADRONXESPECIALIDAD.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('PADRONXESPECIALIDAD')
       DbChangeTrigger.CheckChanges('PADRONXESPECIALIDAD',PADRONXESPECIALIDAD) 
    END
  RETURN ReturnValue


Hide:Access:PADRONXESPECIALIDAD.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PADRONXESPECIALIDAD,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PAD:PK_ESPXSOC,'PAD:PK_ESPXSOC',0)
    SELF.AddKey(PAD:FK_PADRONXESPECIALIDAD_ESP,'PAD:FK_PADRONXESPECIALIDAD_ESP',0)
    SELF.AddKey(PAD:FK_PADRONXESPECIALIDAD_SOCI,'PAD:FK_PADRONXESPECIALIDAD_SOCI',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:PADRONXESPECIALIDAD.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:ESPECIALIDAD1 USHORT,AUTO
Save:SOCIOS2       USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('PAD:IDESPECIALIDAD')
    Save:ESPECIALIDAD1 = Access:ESPECIALIDAD.SaveFile()
    ESP:IDESPECIALIDAD = PAD:IDESPECIALIDAD
    ReturnValue = Access:ESPECIALIDAD.TryFetch(ESP:PK_ESPECIALIDAD)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'ESPECIALIDAD')
      END
    END
    Access:ESPECIALIDAD.RestoreFile(Save:ESPECIALIDAD1)
  OF 2
    GlobalErrors.SetField('PAD:IDSOCIO')
    Save:SOCIOS2 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = PAD:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS2)
  END
  RETURN ReturnValue


Hide:Relate:PADRONXESPECIALIDAD.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ESPECIALIDAD)

  SELF.AddRelation(Relate:SOCIOS)


Hide:Relate:PADRONXESPECIALIDAD.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('PADRONXESPECIALIDAD',PADRONXESPECIALIDAD)
  RETURN ReturnValue


Hide:Relate:PADRONXESPECIALIDAD.Kill PROCEDURE

  CODE
  _Hide:Access:PADRONXESPECIALIDAD.Kill                    ! Kill the file manager
  PARENT.Kill
  Relate:PADRONXESPECIALIDAD &= NULL                       ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PADRONXESPECIALIDAD)                ! destroy the file manager


Hide:Relate:PADRONXESPECIALIDAD.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('PADRONXESPECIALIDAD')
       DbChangeTrigger.AddThread('PADRONXESPECIALIDAD')
       DbChangeTrigger.AddItem(PAD:IDESPECIALIDAD, WHO(PAD:RECORD,WHERE(PAD:RECORD,PAD:IDESPECIALIDAD)) , 'PADRONXESPECIALIDAD')
       DbChangeTrigger.AddItem(PAD:IDSOCIO, WHO(PAD:RECORD,WHERE(PAD:RECORD,PAD:IDSOCIO)) , 'PADRONXESPECIALIDAD')
    END
    DbChangeTrigger.Update('PADRONXESPECIALIDAD')


Hide:Relate:PADRONXESPECIALIDAD.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('PADRONXESPECIALIDAD')
        DbChangeTrigger.CheckChanges('PADRONXESPECIALIDAD',PADRONXESPECIALIDAD) 
     END
  RETURN ReturnValue


Hide:Relate:EXP_PROVEEDORES.Init PROCEDURE()
  CODE
  _Hide:Access:EXP_PROVEEDORES.Init
  SELF.Init(Access:EXP_PROVEEDORES,1)


Hide:Access:EXP_PROVEEDORES.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('EXP_PROVEEDORES')
      DbChangeTrigger.AddThread('EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:IDPROVEEDOR, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:IDPROVEEDOR)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:DESCRIPCION, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:DESCRIPCION)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:DIRECCION, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:DIRECCION)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:TELEFONO, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:TELEFONO)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:EMAIL, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:EMAIL)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:CUIT, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:CUIT)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:FECHA, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:FECHA)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:HORA, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:HORA)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:IDUSUARIO, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:IDUSUARIO)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:IDTIPOIVA, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:IDTIPOIVA)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:FECHA_BAJA, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:FECHA_BAJA)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:OBSERVACION, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:OBSERVACION)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:IDTIPO_PROVEEDOR, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:IDTIPO_PROVEEDOR)) , 'EXP_PROVEEDORES')
   END
   DbChangeTrigger.Update('EXP_PROVEEDORES')
  RETURN ReturnValue


Hide:Access:EXP_PROVEEDORES.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PRO21:Record
  SELF.FileNameValue = 'EXP_PROVEEDORES'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= EXP_PROVEEDORES
  PARENT.Init
  Access:EXP_PROVEEDORES &= SELF


Hide:Access:EXP_PROVEEDORES.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('EXP_PROVEEDORES',EXP_PROVEEDORES)
  RETURN ReturnValue


Hide:Access:EXP_PROVEEDORES.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:EXP_PROVEEDORES &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:EXP_PROVEEDORES.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('EXP_PROVEEDORES')
      DbChangeTrigger.AddThread('EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:IDPROVEEDOR, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:IDPROVEEDOR)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:DESCRIPCION, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:DESCRIPCION)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:DIRECCION, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:DIRECCION)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:TELEFONO, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:TELEFONO)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:EMAIL, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:EMAIL)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:CUIT, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:CUIT)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:FECHA, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:FECHA)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:HORA, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:HORA)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:IDUSUARIO, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:IDUSUARIO)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:IDTIPOIVA, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:IDTIPOIVA)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:FECHA_BAJA, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:FECHA_BAJA)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:OBSERVACION, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:OBSERVACION)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:IDTIPO_PROVEEDOR, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:IDTIPO_PROVEEDOR)) , 'EXP_PROVEEDORES')
   END
   DbChangeTrigger.Update('EXP_PROVEEDORES')
  RETURN ReturnValue


Hide:Access:EXP_PROVEEDORES.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('EXP_PROVEEDORES')
      DbChangeTrigger.AddThread('EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:IDPROVEEDOR, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:IDPROVEEDOR)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:DESCRIPCION, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:DESCRIPCION)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:DIRECCION, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:DIRECCION)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:TELEFONO, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:TELEFONO)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:EMAIL, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:EMAIL)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:CUIT, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:CUIT)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:FECHA, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:FECHA)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:HORA, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:HORA)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:IDUSUARIO, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:IDUSUARIO)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:IDTIPOIVA, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:IDTIPOIVA)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:FECHA_BAJA, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:FECHA_BAJA)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:OBSERVACION, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:OBSERVACION)) , 'EXP_PROVEEDORES')
      DbChangeTrigger.AddItem(PRO21:IDTIPO_PROVEEDOR, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:IDTIPO_PROVEEDOR)) , 'EXP_PROVEEDORES')
   END
   DbChangeTrigger.Update('EXP_PROVEEDORES')
  RETURN ReturnValue


Hide:Access:EXP_PROVEEDORES.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('EXP_PROVEEDORES')
       DbChangeTrigger.CheckChanges('EXP_PROVEEDORES',EXP_PROVEEDORES) 
    END
  RETURN ReturnValue


Hide:Access:EXP_PROVEEDORES.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(EXP_PROVEEDORES,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(PRO21:PK_PROVEEDOR,'PRO21:PK_PROVEEDOR',0)
    SELF.AddKey(PRO21:FK_PROVEEDORES_USUARIO,'PRO21:FK_PROVEEDORES_USUARIO',0)
    SELF.AddKey(PRO21:FK_PROVEEDORES_TIPOIVA,'PRO21:FK_PROVEEDORES_TIPOIVA',0)
    SELF.AddKey(PRO21:IDX_PROVEEDORES_CUIT,'PRO21:IDX_PROVEEDORES_CUIT',0)
    SELF.AddKey(PRO21:IDX_PROVEEDORES_DESCRIPCION,'PRO21:IDX_PROVEEDORES_DESCRIPCION',0)
    SELF.AddKey(PRO21:FK_PROVEEDORES_TIPO_PROVEEDOR,'PRO21:FK_PROVEEDORES_TIPO_PROVEEDOR',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:EXP_PROVEEDORES.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('EXP_PROVEEDORES',EXP_PROVEEDORES)
  RETURN ReturnValue


Hide:Relate:EXP_PROVEEDORES.Kill PROCEDURE

  CODE
  _Hide:Access:EXP_PROVEEDORES.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:EXP_PROVEEDORES &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:EXP_PROVEEDORES)                    ! destroy the file manager


Hide:Relate:EXP_PROVEEDORES.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('EXP_PROVEEDORES')
       DbChangeTrigger.AddThread('EXP_PROVEEDORES')
       DbChangeTrigger.AddItem(PRO21:IDPROVEEDOR, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:IDPROVEEDOR)) , 'EXP_PROVEEDORES')
       DbChangeTrigger.AddItem(PRO21:DESCRIPCION, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:DESCRIPCION)) , 'EXP_PROVEEDORES')
       DbChangeTrigger.AddItem(PRO21:DIRECCION, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:DIRECCION)) , 'EXP_PROVEEDORES')
       DbChangeTrigger.AddItem(PRO21:TELEFONO, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:TELEFONO)) , 'EXP_PROVEEDORES')
       DbChangeTrigger.AddItem(PRO21:EMAIL, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:EMAIL)) , 'EXP_PROVEEDORES')
       DbChangeTrigger.AddItem(PRO21:CUIT, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:CUIT)) , 'EXP_PROVEEDORES')
       DbChangeTrigger.AddItem(PRO21:FECHA, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:FECHA)) , 'EXP_PROVEEDORES')
       DbChangeTrigger.AddItem(PRO21:HORA, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:HORA)) , 'EXP_PROVEEDORES')
       DbChangeTrigger.AddItem(PRO21:IDUSUARIO, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:IDUSUARIO)) , 'EXP_PROVEEDORES')
       DbChangeTrigger.AddItem(PRO21:IDTIPOIVA, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:IDTIPOIVA)) , 'EXP_PROVEEDORES')
       DbChangeTrigger.AddItem(PRO21:FECHA_BAJA, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:FECHA_BAJA)) , 'EXP_PROVEEDORES')
       DbChangeTrigger.AddItem(PRO21:OBSERVACION, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:OBSERVACION)) , 'EXP_PROVEEDORES')
       DbChangeTrigger.AddItem(PRO21:IDTIPO_PROVEEDOR, WHO(PRO21:RECORD,WHERE(PRO21:RECORD,PRO21:IDTIPO_PROVEEDOR)) , 'EXP_PROVEEDORES')
    END
    DbChangeTrigger.Update('EXP_PROVEEDORES')


Hide:Relate:EXP_PROVEEDORES.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('EXP_PROVEEDORES')
        DbChangeTrigger.CheckChanges('EXP_PROVEEDORES',EXP_PROVEEDORES) 
     END
  RETURN ReturnValue


Hide:Relate:PAGOS.Init PROCEDURE()
  CODE
  _Hide:Access:PAGOS.Init
  SELF.Init(Access:PAGOS,1)


Hide:Access:PAGOS.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('PAGOS')
      DbChangeTrigger.AddThread('PAGOS')
      DbChangeTrigger.AddItem(PAG:IDPAGOS, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDPAGOS)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:IDSOCIO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDSOCIO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:SUCURSAL, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:SUCURSAL)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:IDFACTURA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDFACTURA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:MONTO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:MONTO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:FECHA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:FECHA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:HORA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:HORA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:MES, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:MES)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:ANO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:ANO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:PERIODO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:PERIODO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:IDUSUARIO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDUSUARIO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:IDRECIBO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDRECIBO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:MONTO_FACTURA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:MONTO_FACTURA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:INTERES_FACTURA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:INTERES_FACTURA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:IDSUBCUENTA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDSUBCUENTA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:AFECTADA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:AFECTADA)) , 'PAGOS')
   END
   DbChangeTrigger.Update('PAGOS')
  RETURN ReturnValue


Hide:Access:PAGOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PAG:Record
  SELF.FileNameValue = 'PAGOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PAGOS
  PARENT.Init
  Access:PAGOS &= SELF


Hide:Access:PAGOS.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('PAGOS',PAGOS)
  RETURN ReturnValue


Hide:Access:PAGOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PAGOS &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PAGOS.PrimeFields PROCEDURE

  CODE
  PAG:IDSUBCUENTA = 1                                      ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:PAGOS.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('PAGOS')
      DbChangeTrigger.AddThread('PAGOS')
      DbChangeTrigger.AddItem(PAG:IDPAGOS, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDPAGOS)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:IDSOCIO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDSOCIO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:SUCURSAL, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:SUCURSAL)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:IDFACTURA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDFACTURA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:MONTO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:MONTO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:FECHA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:FECHA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:HORA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:HORA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:MES, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:MES)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:ANO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:ANO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:PERIODO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:PERIODO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:IDUSUARIO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDUSUARIO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:IDRECIBO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDRECIBO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:MONTO_FACTURA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:MONTO_FACTURA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:INTERES_FACTURA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:INTERES_FACTURA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:IDSUBCUENTA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDSUBCUENTA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:AFECTADA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:AFECTADA)) , 'PAGOS')
   END
   DbChangeTrigger.Update('PAGOS')
  RETURN ReturnValue


Hide:Access:PAGOS.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('PAGOS')
      DbChangeTrigger.AddThread('PAGOS')
      DbChangeTrigger.AddItem(PAG:IDPAGOS, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDPAGOS)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:IDSOCIO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDSOCIO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:SUCURSAL, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:SUCURSAL)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:IDFACTURA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDFACTURA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:MONTO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:MONTO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:FECHA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:FECHA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:HORA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:HORA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:MES, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:MES)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:ANO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:ANO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:PERIODO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:PERIODO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:IDUSUARIO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDUSUARIO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:IDRECIBO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDRECIBO)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:MONTO_FACTURA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:MONTO_FACTURA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:INTERES_FACTURA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:INTERES_FACTURA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:IDSUBCUENTA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDSUBCUENTA)) , 'PAGOS')
      DbChangeTrigger.AddItem(PAG:AFECTADA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:AFECTADA)) , 'PAGOS')
   END
   DbChangeTrigger.Update('PAGOS')
  RETURN ReturnValue


Hide:Access:PAGOS.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('PAGOS')
       DbChangeTrigger.CheckChanges('PAGOS',PAGOS) 
    END
  RETURN ReturnValue


Hide:Access:PAGOS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PAGOS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PAG:FK_PAGOS_FACTURA,'PAG:FK_PAGOS_FACTURA',0)
    SELF.AddKey(PAG:PK_PAGOS,'PAG:PK_PAGOS',0)
    SELF.AddKey(PAG:FK_PAGOS_SOCIOS,'PAG:FK_PAGOS_SOCIOS',0)
    SELF.AddKey(PAG:FK_PAGOS_USUARIO,'PAG:FK_PAGOS_USUARIO',0)
    SELF.AddKey(PAG:IDX_FECHA,'PAG:IDX_FECHA',0)
    SELF.AddKey(PAG:IDX_PERIODO,'PAG:IDX_PERIODO',0)
    SELF.AddKey(PAG:FK_PAGOS_SUBCUENTA,'PAG:FK_PAGOS_SUBCUENTA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:PAGOS.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS2       USHORT,AUTO
Save:FACTURA4      USHORT,AUTO
Save:USUARIO11     USHORT,AUTO
Save:SUBCUENTAS15  USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('PAG:IDSOCIO')
    Save:SOCIOS2 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = PAG:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS2)
  OF 4
    GlobalErrors.SetField('PAG:IDFACTURA')
    Save:FACTURA4 = Access:FACTURA.SaveFile()
    FAC:IDFACTURA = PAG:IDFACTURA
    ReturnValue = Access:FACTURA.TryFetch(FAC:PK_FACTURA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'FACTURA')
      END
    END
    Access:FACTURA.RestoreFile(Save:FACTURA4)
  OF 11
    GlobalErrors.SetField('PAG:IDUSUARIO')
    Save:USUARIO11 = Access:USUARIO.SaveFile()
    USU:IDUSUARIO = PAG:IDUSUARIO
    ReturnValue = Access:USUARIO.TryFetch(USU:PK_USUARIO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'USUARIO')
      END
    END
    Access:USUARIO.RestoreFile(Save:USUARIO11)
  OF 15
    GlobalErrors.SetField('PAG:IDSUBCUENTA')
    Save:SUBCUENTAS15 = Access:SUBCUENTAS.SaveFile()
    SUB:IDSUBCUENTA = PAG:IDSUBCUENTA
    ReturnValue = Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUBCUENTAS')
      END
    END
    Access:SUBCUENTAS.RestoreFile(Save:SUBCUENTAS15)
  END
  RETURN ReturnValue


Hide:Relate:PAGOS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:FACTURA)

  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:USUARIO)

  SELF.AddRelation(Relate:SUBCUENTAS)


Hide:Relate:PAGOS.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('PAGOS',PAGOS)
  RETURN ReturnValue


Hide:Relate:PAGOS.Kill PROCEDURE

  CODE
  _Hide:Access:PAGOS.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:PAGOS &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PAGOS)                              ! destroy the file manager


Hide:Relate:PAGOS.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('PAGOS')
       DbChangeTrigger.AddThread('PAGOS')
       DbChangeTrigger.AddItem(PAG:IDPAGOS, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDPAGOS)) , 'PAGOS')
       DbChangeTrigger.AddItem(PAG:IDSOCIO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDSOCIO)) , 'PAGOS')
       DbChangeTrigger.AddItem(PAG:SUCURSAL, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:SUCURSAL)) , 'PAGOS')
       DbChangeTrigger.AddItem(PAG:IDFACTURA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDFACTURA)) , 'PAGOS')
       DbChangeTrigger.AddItem(PAG:MONTO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:MONTO)) , 'PAGOS')
       DbChangeTrigger.AddItem(PAG:FECHA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:FECHA)) , 'PAGOS')
       DbChangeTrigger.AddItem(PAG:HORA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:HORA)) , 'PAGOS')
       DbChangeTrigger.AddItem(PAG:MES, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:MES)) , 'PAGOS')
       DbChangeTrigger.AddItem(PAG:ANO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:ANO)) , 'PAGOS')
       DbChangeTrigger.AddItem(PAG:PERIODO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:PERIODO)) , 'PAGOS')
       DbChangeTrigger.AddItem(PAG:IDUSUARIO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDUSUARIO)) , 'PAGOS')
       DbChangeTrigger.AddItem(PAG:IDRECIBO, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDRECIBO)) , 'PAGOS')
       DbChangeTrigger.AddItem(PAG:MONTO_FACTURA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:MONTO_FACTURA)) , 'PAGOS')
       DbChangeTrigger.AddItem(PAG:INTERES_FACTURA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:INTERES_FACTURA)) , 'PAGOS')
       DbChangeTrigger.AddItem(PAG:IDSUBCUENTA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:IDSUBCUENTA)) , 'PAGOS')
       DbChangeTrigger.AddItem(PAG:AFECTADA, WHO(PAG:RECORD,WHERE(PAG:RECORD,PAG:AFECTADA)) , 'PAGOS')
    END
    DbChangeTrigger.Update('PAGOS')


Hide:Relate:PAGOS.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('PAGOS')
        DbChangeTrigger.CheckChanges('PAGOS',PAGOS) 
     END
  RETURN ReturnValue

