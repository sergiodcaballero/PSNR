  MEMBER('Gestion.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
Gestion_BC4:DctInit    PROCEDURE()
Gestion_BC4:DctKill    PROCEDURE()
Gestion_BC4:FilesInit  PROCEDURE()
  END

Hide:Access:SOCIOSXOS CLASS(FileManager),TYPE              ! FileManager for SOCIOSXOS
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


Hide:Relate:SOCIOSXOS CLASS(RelationManager),TYPE          ! RelationManager for SOCIOSXOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:FORMA_PAGO CLASS(FileManager),TYPE             ! FileManager for FORMA_PAGO
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:FORMA_PAGO CLASS(RelationManager),TYPE         ! RelationManager for FORMA_PAGO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:LIQUIDACION CLASS(FileManager),TYPE            ! FileManager for LIQUIDACION
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


Hide:Relate:LIQUIDACION CLASS(RelationManager),TYPE        ! RelationManager for LIQUIDACION
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:SEGURO   CLASS(FileManager),TYPE               ! FileManager for SEGURO
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


Hide:Relate:SEGURO   CLASS(RelationManager),TYPE           ! RelationManager for SEGURO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:SEGURO_FACTURA CLASS(FileManager),TYPE         ! FileManager for SEGURO_FACTURA
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


Hide:Relate:SEGURO_FACTURA CLASS(RelationManager),TYPE     ! RelationManager for SEGURO_FACTURA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:TIPO_SEGURO CLASS(FileManager),TYPE            ! FileManager for TIPO_SEGURO
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_SEGURO CLASS(RelationManager),TYPE        ! RelationManager for TIPO_SEGURO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:NOMENCLADOR CLASS(FileManager),TYPE            ! FileManager for NOMENCLADOR
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:NOMENCLADOR CLASS(RelationManager),TYPE        ! RelationManager for NOMENCLADOR
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:NOMENCLADORXOS CLASS(FileManager),TYPE         ! FileManager for NOMENCLADORXOS
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


Hide:Relate:NOMENCLADORXOS CLASS(RelationManager),TYPE     ! RelationManager for NOMENCLADORXOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CURSO    CLASS(FileManager),TYPE               ! FileManager for CURSO
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


Hide:Relate:CURSO    CLASS(RelationManager),TYPE           ! RelationManager for CURSO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CURSO_INSCRIPCION CLASS(FileManager),TYPE      ! FileManager for CURSO_INSCRIPCION
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


Hide:Relate:CURSO_INSCRIPCION CLASS(RelationManager),TYPE  ! RelationManager for CURSO_INSCRIPCION
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CURSO_INSCRIPCION_DETALLE CLASS(FileManager),TYPE ! FileManager for CURSO_INSCRIPCION_DETALLE
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


Hide:Relate:CURSO_INSCRIPCION_DETALLE CLASS(RelationManager),TYPE ! RelationManager for CURSO_INSCRIPCION_DETALLE
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CURSO_MODULOS CLASS(FileManager),TYPE          ! FileManager for CURSO_MODULOS
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


Hide:Relate:CURSO_MODULOS CLASS(RelationManager),TYPE      ! RelationManager for CURSO_MODULOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:ME       CLASS(FileManager),TYPE               ! FileManager for ME
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


Hide:Relate:ME       CLASS(RelationManager),TYPE           ! RelationManager for ME
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:MEDPTO   CLASS(FileManager),TYPE               ! FileManager for MEDPTO
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:MEDPTO   CLASS(RelationManager),TYPE           ! RelationManager for MEDPTO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:MEESTADO CLASS(FileManager),TYPE               ! FileManager for MEESTADO
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:MEESTADO CLASS(RelationManager),TYPE           ! RelationManager for MEESTADO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:MEPASES  CLASS(FileManager),TYPE               ! FileManager for MEPASES
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:MEPASES  CLASS(RelationManager),TYPE           ! RelationManager for MEPASES
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:METIPO   CLASS(FileManager),TYPE               ! FileManager for METIPO
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:METIPO   CLASS(RelationManager),TYPE           ! RelationManager for METIPO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:MS       CLASS(FileManager),TYPE               ! FileManager for MS
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


Hide:Relate:MS       CLASS(RelationManager),TYPE           ! RelationManager for MS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:LIQUIDACION_INFORME CLASS(FileManager),TYPE    ! FileManager for LIQUIDACION_INFORME
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:LIQUIDACION_INFORME CLASS(RelationManager),TYPE ! RelationManager for LIQUIDACION_INFORME
Init                   PROCEDURE
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:INGRESOS_FACTURA CLASS(FileManager),TYPE       ! FileManager for INGRESOS_FACTURA
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


Hide:Relate:INGRESOS_FACTURA CLASS(RelationManager),TYPE   ! RelationManager for INGRESOS_FACTURA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END


_Hide:Access:SOCIOSXOS &Hide:Access:SOCIOSXOS,AUTO,THREAD
_Hide:Relate:SOCIOSXOS &Hide:Relate:SOCIOSXOS,AUTO,THREAD
_Hide:Access:FORMA_PAGO &Hide:Access:FORMA_PAGO,AUTO,THREAD
_Hide:Relate:FORMA_PAGO &Hide:Relate:FORMA_PAGO,AUTO,THREAD
_Hide:Access:LIQUIDACION &Hide:Access:LIQUIDACION,AUTO,THREAD
_Hide:Relate:LIQUIDACION &Hide:Relate:LIQUIDACION,AUTO,THREAD
_Hide:Access:SEGURO  &Hide:Access:SEGURO,AUTO,THREAD
_Hide:Relate:SEGURO  &Hide:Relate:SEGURO,AUTO,THREAD
_Hide:Access:SEGURO_FACTURA &Hide:Access:SEGURO_FACTURA,AUTO,THREAD
_Hide:Relate:SEGURO_FACTURA &Hide:Relate:SEGURO_FACTURA,AUTO,THREAD
_Hide:Access:TIPO_SEGURO &Hide:Access:TIPO_SEGURO,AUTO,THREAD
_Hide:Relate:TIPO_SEGURO &Hide:Relate:TIPO_SEGURO,AUTO,THREAD
_Hide:Access:NOMENCLADOR &Hide:Access:NOMENCLADOR,AUTO,THREAD
_Hide:Relate:NOMENCLADOR &Hide:Relate:NOMENCLADOR,AUTO,THREAD
_Hide:Access:NOMENCLADORXOS &Hide:Access:NOMENCLADORXOS,AUTO,THREAD
_Hide:Relate:NOMENCLADORXOS &Hide:Relate:NOMENCLADORXOS,AUTO,THREAD
_Hide:Access:CURSO   &Hide:Access:CURSO,AUTO,THREAD
_Hide:Relate:CURSO   &Hide:Relate:CURSO,AUTO,THREAD
_Hide:Access:CURSO_INSCRIPCION &Hide:Access:CURSO_INSCRIPCION,AUTO,THREAD
_Hide:Relate:CURSO_INSCRIPCION &Hide:Relate:CURSO_INSCRIPCION,AUTO,THREAD
_Hide:Access:CURSO_INSCRIPCION_DETALLE &Hide:Access:CURSO_INSCRIPCION_DETALLE,AUTO,THREAD
_Hide:Relate:CURSO_INSCRIPCION_DETALLE &Hide:Relate:CURSO_INSCRIPCION_DETALLE,AUTO,THREAD
_Hide:Access:CURSO_MODULOS &Hide:Access:CURSO_MODULOS,AUTO,THREAD
_Hide:Relate:CURSO_MODULOS &Hide:Relate:CURSO_MODULOS,AUTO,THREAD
_Hide:Access:ME      &Hide:Access:ME,AUTO,THREAD
_Hide:Relate:ME      &Hide:Relate:ME,AUTO,THREAD
_Hide:Access:MEDPTO  &Hide:Access:MEDPTO,AUTO,THREAD
_Hide:Relate:MEDPTO  &Hide:Relate:MEDPTO,AUTO,THREAD
_Hide:Access:MEESTADO &Hide:Access:MEESTADO,AUTO,THREAD
_Hide:Relate:MEESTADO &Hide:Relate:MEESTADO,AUTO,THREAD
_Hide:Access:MEPASES &Hide:Access:MEPASES,AUTO,THREAD
_Hide:Relate:MEPASES &Hide:Relate:MEPASES,AUTO,THREAD
_Hide:Access:METIPO  &Hide:Access:METIPO,AUTO,THREAD
_Hide:Relate:METIPO  &Hide:Relate:METIPO,AUTO,THREAD
_Hide:Access:MS      &Hide:Access:MS,AUTO,THREAD
_Hide:Relate:MS      &Hide:Relate:MS,AUTO,THREAD
_Hide:Access:LIQUIDACION_INFORME &Hide:Access:LIQUIDACION_INFORME,AUTO,THREAD
_Hide:Relate:LIQUIDACION_INFORME &Hide:Relate:LIQUIDACION_INFORME,AUTO,THREAD
_Hide:Access:INGRESOS_FACTURA &Hide:Access:INGRESOS_FACTURA,AUTO,THREAD
_Hide:Relate:INGRESOS_FACTURA &Hide:Relate:INGRESOS_FACTURA,AUTO,THREAD


Gestion_BC4:DctInit PROCEDURE()
  CODE
  _Hide:Access:SOCIOSXOS &= NEW(Hide:Access:SOCIOSXOS)
  _Hide:Relate:SOCIOSXOS &= NEW(Hide:Relate:SOCIOSXOS)
  _Hide:Access:FORMA_PAGO &= NEW(Hide:Access:FORMA_PAGO)
  _Hide:Relate:FORMA_PAGO &= NEW(Hide:Relate:FORMA_PAGO)
  _Hide:Access:LIQUIDACION &= NEW(Hide:Access:LIQUIDACION)
  _Hide:Relate:LIQUIDACION &= NEW(Hide:Relate:LIQUIDACION)
  _Hide:Access:SEGURO &= NEW(Hide:Access:SEGURO)
  _Hide:Relate:SEGURO &= NEW(Hide:Relate:SEGURO)
  _Hide:Access:SEGURO_FACTURA &= NEW(Hide:Access:SEGURO_FACTURA)
  _Hide:Relate:SEGURO_FACTURA &= NEW(Hide:Relate:SEGURO_FACTURA)
  _Hide:Access:TIPO_SEGURO &= NEW(Hide:Access:TIPO_SEGURO)
  _Hide:Relate:TIPO_SEGURO &= NEW(Hide:Relate:TIPO_SEGURO)
  _Hide:Access:NOMENCLADOR &= NEW(Hide:Access:NOMENCLADOR)
  _Hide:Relate:NOMENCLADOR &= NEW(Hide:Relate:NOMENCLADOR)
  _Hide:Access:NOMENCLADORXOS &= NEW(Hide:Access:NOMENCLADORXOS)
  _Hide:Relate:NOMENCLADORXOS &= NEW(Hide:Relate:NOMENCLADORXOS)
  _Hide:Access:CURSO &= NEW(Hide:Access:CURSO)
  _Hide:Relate:CURSO &= NEW(Hide:Relate:CURSO)
  _Hide:Access:CURSO_INSCRIPCION &= NEW(Hide:Access:CURSO_INSCRIPCION)
  _Hide:Relate:CURSO_INSCRIPCION &= NEW(Hide:Relate:CURSO_INSCRIPCION)
  _Hide:Access:CURSO_INSCRIPCION_DETALLE &= NEW(Hide:Access:CURSO_INSCRIPCION_DETALLE)
  _Hide:Relate:CURSO_INSCRIPCION_DETALLE &= NEW(Hide:Relate:CURSO_INSCRIPCION_DETALLE)
  _Hide:Access:CURSO_MODULOS &= NEW(Hide:Access:CURSO_MODULOS)
  _Hide:Relate:CURSO_MODULOS &= NEW(Hide:Relate:CURSO_MODULOS)
  _Hide:Access:ME &= NEW(Hide:Access:ME)
  _Hide:Relate:ME &= NEW(Hide:Relate:ME)
  _Hide:Access:MEDPTO &= NEW(Hide:Access:MEDPTO)
  _Hide:Relate:MEDPTO &= NEW(Hide:Relate:MEDPTO)
  _Hide:Access:MEESTADO &= NEW(Hide:Access:MEESTADO)
  _Hide:Relate:MEESTADO &= NEW(Hide:Relate:MEESTADO)
  _Hide:Access:MEPASES &= NEW(Hide:Access:MEPASES)
  _Hide:Relate:MEPASES &= NEW(Hide:Relate:MEPASES)
  _Hide:Access:METIPO &= NEW(Hide:Access:METIPO)
  _Hide:Relate:METIPO &= NEW(Hide:Relate:METIPO)
  _Hide:Access:MS &= NEW(Hide:Access:MS)
  _Hide:Relate:MS &= NEW(Hide:Relate:MS)
  _Hide:Access:LIQUIDACION_INFORME &= NEW(Hide:Access:LIQUIDACION_INFORME)
  _Hide:Relate:LIQUIDACION_INFORME &= NEW(Hide:Relate:LIQUIDACION_INFORME)
  _Hide:Access:INGRESOS_FACTURA &= NEW(Hide:Access:INGRESOS_FACTURA)
  _Hide:Relate:INGRESOS_FACTURA &= NEW(Hide:Relate:INGRESOS_FACTURA)
  Relate:SOCIOSXOS &= _Hide:Relate:SOCIOSXOS
  Relate:FORMA_PAGO &= _Hide:Relate:FORMA_PAGO
  Relate:LIQUIDACION &= _Hide:Relate:LIQUIDACION
  Relate:SEGURO &= _Hide:Relate:SEGURO
  Relate:SEGURO_FACTURA &= _Hide:Relate:SEGURO_FACTURA
  Relate:TIPO_SEGURO &= _Hide:Relate:TIPO_SEGURO
  Relate:NOMENCLADOR &= _Hide:Relate:NOMENCLADOR
  Relate:NOMENCLADORXOS &= _Hide:Relate:NOMENCLADORXOS
  Relate:CURSO &= _Hide:Relate:CURSO
  Relate:CURSO_INSCRIPCION &= _Hide:Relate:CURSO_INSCRIPCION
  Relate:CURSO_INSCRIPCION_DETALLE &= _Hide:Relate:CURSO_INSCRIPCION_DETALLE
  Relate:CURSO_MODULOS &= _Hide:Relate:CURSO_MODULOS
  Relate:ME &= _Hide:Relate:ME
  Relate:MEDPTO &= _Hide:Relate:MEDPTO
  Relate:MEESTADO &= _Hide:Relate:MEESTADO
  Relate:MEPASES &= _Hide:Relate:MEPASES
  Relate:METIPO &= _Hide:Relate:METIPO
  Relate:MS &= _Hide:Relate:MS
  Relate:LIQUIDACION_INFORME &= _Hide:Relate:LIQUIDACION_INFORME
  Relate:INGRESOS_FACTURA &= _Hide:Relate:INGRESOS_FACTURA


Gestion_BC4:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:SOCIOSXOS.Init
  _Hide:Relate:FORMA_PAGO.Init
  _Hide:Relate:LIQUIDACION.Init
  _Hide:Relate:SEGURO.Init
  _Hide:Relate:SEGURO_FACTURA.Init
  _Hide:Relate:TIPO_SEGURO.Init
  _Hide:Relate:NOMENCLADOR.Init
  _Hide:Relate:NOMENCLADORXOS.Init
  _Hide:Relate:CURSO.Init
  _Hide:Relate:CURSO_INSCRIPCION.Init
  _Hide:Relate:CURSO_INSCRIPCION_DETALLE.Init
  _Hide:Relate:CURSO_MODULOS.Init
  _Hide:Relate:ME.Init
  _Hide:Relate:MEDPTO.Init
  _Hide:Relate:MEESTADO.Init
  _Hide:Relate:MEPASES.Init
  _Hide:Relate:METIPO.Init
  _Hide:Relate:MS.Init
  _Hide:Relate:LIQUIDACION_INFORME.Init
  _Hide:Relate:INGRESOS_FACTURA.Init


Gestion_BC4:DctKill PROCEDURE()
  CODE
  _Hide:Relate:SOCIOSXOS.Kill
  DISPOSE(_Hide:Relate:SOCIOSXOS)
  _Hide:Relate:FORMA_PAGO.Kill
  DISPOSE(_Hide:Relate:FORMA_PAGO)
  _Hide:Relate:LIQUIDACION.Kill
  DISPOSE(_Hide:Relate:LIQUIDACION)
  _Hide:Relate:SEGURO.Kill
  DISPOSE(_Hide:Relate:SEGURO)
  _Hide:Relate:SEGURO_FACTURA.Kill
  DISPOSE(_Hide:Relate:SEGURO_FACTURA)
  _Hide:Relate:TIPO_SEGURO.Kill
  DISPOSE(_Hide:Relate:TIPO_SEGURO)
  _Hide:Relate:NOMENCLADOR.Kill
  DISPOSE(_Hide:Relate:NOMENCLADOR)
  _Hide:Relate:NOMENCLADORXOS.Kill
  DISPOSE(_Hide:Relate:NOMENCLADORXOS)
  _Hide:Relate:CURSO.Kill
  DISPOSE(_Hide:Relate:CURSO)
  _Hide:Relate:CURSO_INSCRIPCION.Kill
  DISPOSE(_Hide:Relate:CURSO_INSCRIPCION)
  _Hide:Relate:CURSO_INSCRIPCION_DETALLE.Kill
  DISPOSE(_Hide:Relate:CURSO_INSCRIPCION_DETALLE)
  _Hide:Relate:CURSO_MODULOS.Kill
  DISPOSE(_Hide:Relate:CURSO_MODULOS)
  _Hide:Relate:ME.Kill
  DISPOSE(_Hide:Relate:ME)
  _Hide:Relate:MEDPTO.Kill
  DISPOSE(_Hide:Relate:MEDPTO)
  _Hide:Relate:MEESTADO.Kill
  DISPOSE(_Hide:Relate:MEESTADO)
  _Hide:Relate:MEPASES.Kill
  DISPOSE(_Hide:Relate:MEPASES)
  _Hide:Relate:METIPO.Kill
  DISPOSE(_Hide:Relate:METIPO)
  _Hide:Relate:MS.Kill
  DISPOSE(_Hide:Relate:MS)
  _Hide:Relate:LIQUIDACION_INFORME.Kill
  DISPOSE(_Hide:Relate:LIQUIDACION_INFORME)
  _Hide:Relate:INGRESOS_FACTURA.Kill
  DISPOSE(_Hide:Relate:INGRESOS_FACTURA)


Hide:Relate:SOCIOSXOS.Init PROCEDURE()
  CODE
  _Hide:Access:SOCIOSXOS.Init
  SELF.Init(Access:SOCIOSXOS,1)


Hide:Access:SOCIOSXOS.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('SOCIOSXOS')
      DbChangeTrigger.AddThread('SOCIOSXOS')
      DbChangeTrigger.AddItem(SOC3:IDSOCIOS, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:IDSOCIOS)) , 'SOCIOSXOS')
      DbChangeTrigger.AddItem(SOC3:IDOS, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:IDOS)) , 'SOCIOSXOS')
      DbChangeTrigger.AddItem(SOC3:NUMERO, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:NUMERO)) , 'SOCIOSXOS')
      DbChangeTrigger.AddItem(SOC3:FECHA_ALTA, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:FECHA_ALTA)) , 'SOCIOSXOS')
      DbChangeTrigger.AddItem(SOC3:OBSERVACION, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:OBSERVACION)) , 'SOCIOSXOS')
   END
   DbChangeTrigger.Update('SOCIOSXOS')
  RETURN ReturnValue


Hide:Access:SOCIOSXOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SOC3:Record
  SELF.FileNameValue = 'SOCIOSXOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SOCIOSXOS
  PARENT.Init
  Access:SOCIOSXOS &= SELF


Hide:Access:SOCIOSXOS.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('SOCIOSXOS',SOCIOSXOS)
  RETURN ReturnValue


Hide:Access:SOCIOSXOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SOCIOSXOS &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SOCIOSXOS.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('SOCIOSXOS')
      DbChangeTrigger.AddThread('SOCIOSXOS')
      DbChangeTrigger.AddItem(SOC3:IDSOCIOS, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:IDSOCIOS)) , 'SOCIOSXOS')
      DbChangeTrigger.AddItem(SOC3:IDOS, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:IDOS)) , 'SOCIOSXOS')
      DbChangeTrigger.AddItem(SOC3:NUMERO, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:NUMERO)) , 'SOCIOSXOS')
      DbChangeTrigger.AddItem(SOC3:FECHA_ALTA, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:FECHA_ALTA)) , 'SOCIOSXOS')
      DbChangeTrigger.AddItem(SOC3:OBSERVACION, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:OBSERVACION)) , 'SOCIOSXOS')
   END
   DbChangeTrigger.Update('SOCIOSXOS')
  RETURN ReturnValue


Hide:Access:SOCIOSXOS.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('SOCIOSXOS')
      DbChangeTrigger.AddThread('SOCIOSXOS')
      DbChangeTrigger.AddItem(SOC3:IDSOCIOS, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:IDSOCIOS)) , 'SOCIOSXOS')
      DbChangeTrigger.AddItem(SOC3:IDOS, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:IDOS)) , 'SOCIOSXOS')
      DbChangeTrigger.AddItem(SOC3:NUMERO, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:NUMERO)) , 'SOCIOSXOS')
      DbChangeTrigger.AddItem(SOC3:FECHA_ALTA, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:FECHA_ALTA)) , 'SOCIOSXOS')
      DbChangeTrigger.AddItem(SOC3:OBSERVACION, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:OBSERVACION)) , 'SOCIOSXOS')
   END
   DbChangeTrigger.Update('SOCIOSXOS')
  RETURN ReturnValue


Hide:Access:SOCIOSXOS.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('SOCIOSXOS')
       DbChangeTrigger.CheckChanges('SOCIOSXOS',SOCIOSXOS) 
    END
  RETURN ReturnValue


Hide:Access:SOCIOSXOS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SOCIOSXOS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SOC3:FK_SOCIOSXOS_OS,'SOC3:FK_SOCIOSXOS_OS',0)
    SELF.AddKey(SOC3:FK_SOCIOSXOS_SOCIOS,'SOC3:FK_SOCIOSXOS_SOCIOS',0)
    SELF.AddKey(SOC3:PK_SOCIOSXOS,'SOC3:PK_SOCIOSXOS',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:SOCIOSXOS.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS1       USHORT,AUTO
Save:OBRA_SOCIAL2  USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('SOC3:IDSOCIOS')
    Save:SOCIOS1 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = SOC3:IDSOCIOS
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS1)
  OF 2
    GlobalErrors.SetField('SOC3:IDOS')
    Save:OBRA_SOCIAL2 = Access:OBRA_SOCIAL.SaveFile()
    OBR:IDOS = SOC3:IDOS
    ReturnValue = Access:OBRA_SOCIAL.TryFetch(OBR:PK_OBRA_SOCIAL)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'OBRA_SOCIAL')
      END
    END
    Access:OBRA_SOCIAL.RestoreFile(Save:OBRA_SOCIAL2)
  END
  RETURN ReturnValue


Hide:Relate:SOCIOSXOS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:OBRA_SOCIAL)


Hide:Relate:SOCIOSXOS.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('SOCIOSXOS',SOCIOSXOS)
  RETURN ReturnValue


Hide:Relate:SOCIOSXOS.Kill PROCEDURE

  CODE
  _Hide:Access:SOCIOSXOS.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:SOCIOSXOS &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SOCIOSXOS)                          ! destroy the file manager


Hide:Relate:SOCIOSXOS.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('SOCIOSXOS')
       DbChangeTrigger.AddThread('SOCIOSXOS')
       DbChangeTrigger.AddItem(SOC3:IDSOCIOS, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:IDSOCIOS)) , 'SOCIOSXOS')
       DbChangeTrigger.AddItem(SOC3:IDOS, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:IDOS)) , 'SOCIOSXOS')
       DbChangeTrigger.AddItem(SOC3:NUMERO, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:NUMERO)) , 'SOCIOSXOS')
       DbChangeTrigger.AddItem(SOC3:FECHA_ALTA, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:FECHA_ALTA)) , 'SOCIOSXOS')
       DbChangeTrigger.AddItem(SOC3:OBSERVACION, WHO(SOC3:RECORD,WHERE(SOC3:RECORD,SOC3:OBSERVACION)) , 'SOCIOSXOS')
    END
    DbChangeTrigger.Update('SOCIOSXOS')


Hide:Relate:SOCIOSXOS.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('SOCIOSXOS')
        DbChangeTrigger.CheckChanges('SOCIOSXOS',SOCIOSXOS) 
     END
  RETURN ReturnValue


Hide:Relate:FORMA_PAGO.Init PROCEDURE()
  CODE
  _Hide:Access:FORMA_PAGO.Init
  SELF.Init(Access:FORMA_PAGO,1)


Hide:Access:FORMA_PAGO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('FORMA_PAGO')
      DbChangeTrigger.AddThread('FORMA_PAGO')
      DbChangeTrigger.AddItem(FOR:IDFORMA_PAGO, WHO(FOR:RECORD,WHERE(FOR:RECORD,FOR:IDFORMA_PAGO)) , 'FORMA_PAGO')
      DbChangeTrigger.AddItem(FOR:DESCRIPCION, WHO(FOR:RECORD,WHERE(FOR:RECORD,FOR:DESCRIPCION)) , 'FORMA_PAGO')
      DbChangeTrigger.AddItem(FOR:OBSERVACION, WHO(FOR:RECORD,WHERE(FOR:RECORD,FOR:OBSERVACION)) , 'FORMA_PAGO')
   END
   DbChangeTrigger.Update('FORMA_PAGO')
  RETURN ReturnValue


Hide:Access:FORMA_PAGO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FOR:Record
  SELF.FileNameValue = 'FORMA_PAGO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= FORMA_PAGO
  PARENT.Init
  Access:FORMA_PAGO &= SELF


Hide:Access:FORMA_PAGO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('FORMA_PAGO',FORMA_PAGO)
  RETURN ReturnValue


Hide:Access:FORMA_PAGO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:FORMA_PAGO &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:FORMA_PAGO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('FORMA_PAGO')
      DbChangeTrigger.AddThread('FORMA_PAGO')
      DbChangeTrigger.AddItem(FOR:IDFORMA_PAGO, WHO(FOR:RECORD,WHERE(FOR:RECORD,FOR:IDFORMA_PAGO)) , 'FORMA_PAGO')
      DbChangeTrigger.AddItem(FOR:DESCRIPCION, WHO(FOR:RECORD,WHERE(FOR:RECORD,FOR:DESCRIPCION)) , 'FORMA_PAGO')
      DbChangeTrigger.AddItem(FOR:OBSERVACION, WHO(FOR:RECORD,WHERE(FOR:RECORD,FOR:OBSERVACION)) , 'FORMA_PAGO')
   END
   DbChangeTrigger.Update('FORMA_PAGO')
  RETURN ReturnValue


Hide:Access:FORMA_PAGO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('FORMA_PAGO')
      DbChangeTrigger.AddThread('FORMA_PAGO')
      DbChangeTrigger.AddItem(FOR:IDFORMA_PAGO, WHO(FOR:RECORD,WHERE(FOR:RECORD,FOR:IDFORMA_PAGO)) , 'FORMA_PAGO')
      DbChangeTrigger.AddItem(FOR:DESCRIPCION, WHO(FOR:RECORD,WHERE(FOR:RECORD,FOR:DESCRIPCION)) , 'FORMA_PAGO')
      DbChangeTrigger.AddItem(FOR:OBSERVACION, WHO(FOR:RECORD,WHERE(FOR:RECORD,FOR:OBSERVACION)) , 'FORMA_PAGO')
   END
   DbChangeTrigger.Update('FORMA_PAGO')
  RETURN ReturnValue


Hide:Access:FORMA_PAGO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('FORMA_PAGO')
       DbChangeTrigger.CheckChanges('FORMA_PAGO',FORMA_PAGO) 
    END
  RETURN ReturnValue


Hide:Access:FORMA_PAGO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(FORMA_PAGO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(FOR:IDX_FORMA_PAGO_DESCRIPCION,'FOR:IDX_FORMA_PAGO_DESCRIPCION',0)
    SELF.AddKey(FOR:PK_FORMA_PAGO,'FOR:PK_FORMA_PAGO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:FORMA_PAGO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SEGURO,RI:None,RI:None,SEG:FK_SEGURO_FORMA_PAGO)
  SELF.AddRelationLink(FOR:IDFORMA_PAGO,SEG:ID_FORMA_PAGO)

  SELF.AddRelation(Relate:LIQUIDACION,RI:None,RI:None,LIQ:FK_LIQUIDACION_FORMA_PAGO)
  SELF.AddRelationLink(FOR:IDFORMA_PAGO,LIQ:IDFORMA_PAGO)


Hide:Relate:FORMA_PAGO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('FORMA_PAGO',FORMA_PAGO)
  RETURN ReturnValue


Hide:Relate:FORMA_PAGO.Kill PROCEDURE

  CODE
  _Hide:Access:FORMA_PAGO.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:FORMA_PAGO &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:FORMA_PAGO)                         ! destroy the file manager


Hide:Relate:FORMA_PAGO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('FORMA_PAGO')
       DbChangeTrigger.AddThread('FORMA_PAGO')
       DbChangeTrigger.AddItem(FOR:IDFORMA_PAGO, WHO(FOR:RECORD,WHERE(FOR:RECORD,FOR:IDFORMA_PAGO)) , 'FORMA_PAGO')
       DbChangeTrigger.AddItem(FOR:DESCRIPCION, WHO(FOR:RECORD,WHERE(FOR:RECORD,FOR:DESCRIPCION)) , 'FORMA_PAGO')
       DbChangeTrigger.AddItem(FOR:OBSERVACION, WHO(FOR:RECORD,WHERE(FOR:RECORD,FOR:OBSERVACION)) , 'FORMA_PAGO')
    END
    DbChangeTrigger.Update('FORMA_PAGO')


Hide:Relate:FORMA_PAGO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('FORMA_PAGO')
        DbChangeTrigger.CheckChanges('FORMA_PAGO',FORMA_PAGO) 
     END
  RETURN ReturnValue


Hide:Relate:LIQUIDACION.Init PROCEDURE()
  CODE
  _Hide:Access:LIQUIDACION.Init
  SELF.Init(Access:LIQUIDACION,1)


Hide:Access:LIQUIDACION.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('LIQUIDACION')
      DbChangeTrigger.AddThread('LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDLIQUIDACION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDLIQUIDACION)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDSOCIO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDSOCIO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDOS, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDOS)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:MES, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:MES)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:ANO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:ANO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:PERIODO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:PERIODO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:TIPO_PERIODO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:TIPO_PERIODO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:MONTO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:MONTO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:FECHA_CARGA, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:FECHA_CARGA)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:FECHA_PRESENTACION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:FECHA_PRESENTACION)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:FECHA_COBRO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:FECHA_COBRO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:FECHA_PAGO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:FECHA_PAGO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:MONTO_PAGADO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:MONTO_PAGADO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDFORMA_PAGO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDFORMA_PAGO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:DEBITO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:DEBITO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:COMISION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:COMISION)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:CANTIDAD, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:CANTIDAD)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:DEBITO_COMISION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:DEBITO_COMISION)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:CANTIDAD_CUOTAS_PAGADAS, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:CANTIDAD_CUOTAS_PAGADAS)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:DEBITO_PAGO_CUOTAS, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:DEBITO_PAGO_CUOTAS)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:MONTO_TOTAL, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:MONTO_TOTAL)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:PRESENTADO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:PRESENTADO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:COBRADO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:COBRADO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:PAGADO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:PAGADO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDUSUARIO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDUSUARIO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:USUARIO_PAGO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:USUARIO_PAGO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDPAGO_LIQUIDACION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDPAGO_LIQUIDACION)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:SOCIOS_LIQUIDACION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:SOCIOS_LIQUIDACION)) , 'LIQUIDACION')
   END
   DbChangeTrigger.Update('LIQUIDACION')
  RETURN ReturnValue


Hide:Access:LIQUIDACION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LIQ:Record
  SELF.FileNameValue = 'LIQUIDACION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LIQUIDACION
  PARENT.Init
  Access:LIQUIDACION &= SELF


Hide:Access:LIQUIDACION.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('LIQUIDACION',LIQUIDACION)
  RETURN ReturnValue


Hide:Access:LIQUIDACION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LIQUIDACION &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LIQUIDACION.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('LIQUIDACION')
      DbChangeTrigger.AddThread('LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDLIQUIDACION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDLIQUIDACION)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDSOCIO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDSOCIO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDOS, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDOS)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:MES, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:MES)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:ANO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:ANO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:PERIODO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:PERIODO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:TIPO_PERIODO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:TIPO_PERIODO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:MONTO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:MONTO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:FECHA_CARGA, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:FECHA_CARGA)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:FECHA_PRESENTACION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:FECHA_PRESENTACION)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:FECHA_COBRO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:FECHA_COBRO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:FECHA_PAGO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:FECHA_PAGO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:MONTO_PAGADO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:MONTO_PAGADO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDFORMA_PAGO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDFORMA_PAGO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:DEBITO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:DEBITO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:COMISION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:COMISION)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:CANTIDAD, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:CANTIDAD)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:DEBITO_COMISION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:DEBITO_COMISION)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:CANTIDAD_CUOTAS_PAGADAS, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:CANTIDAD_CUOTAS_PAGADAS)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:DEBITO_PAGO_CUOTAS, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:DEBITO_PAGO_CUOTAS)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:MONTO_TOTAL, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:MONTO_TOTAL)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:PRESENTADO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:PRESENTADO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:COBRADO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:COBRADO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:PAGADO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:PAGADO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDUSUARIO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDUSUARIO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:USUARIO_PAGO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:USUARIO_PAGO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDPAGO_LIQUIDACION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDPAGO_LIQUIDACION)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:SOCIOS_LIQUIDACION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:SOCIOS_LIQUIDACION)) , 'LIQUIDACION')
   END
   DbChangeTrigger.Update('LIQUIDACION')
  RETURN ReturnValue


Hide:Access:LIQUIDACION.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('LIQUIDACION')
      DbChangeTrigger.AddThread('LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDLIQUIDACION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDLIQUIDACION)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDSOCIO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDSOCIO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDOS, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDOS)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:MES, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:MES)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:ANO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:ANO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:PERIODO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:PERIODO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:TIPO_PERIODO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:TIPO_PERIODO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:MONTO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:MONTO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:FECHA_CARGA, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:FECHA_CARGA)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:FECHA_PRESENTACION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:FECHA_PRESENTACION)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:FECHA_COBRO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:FECHA_COBRO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:FECHA_PAGO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:FECHA_PAGO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:MONTO_PAGADO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:MONTO_PAGADO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDFORMA_PAGO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDFORMA_PAGO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:DEBITO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:DEBITO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:COMISION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:COMISION)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:CANTIDAD, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:CANTIDAD)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:DEBITO_COMISION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:DEBITO_COMISION)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:CANTIDAD_CUOTAS_PAGADAS, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:CANTIDAD_CUOTAS_PAGADAS)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:DEBITO_PAGO_CUOTAS, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:DEBITO_PAGO_CUOTAS)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:MONTO_TOTAL, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:MONTO_TOTAL)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:PRESENTADO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:PRESENTADO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:COBRADO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:COBRADO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:PAGADO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:PAGADO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDUSUARIO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDUSUARIO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:USUARIO_PAGO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:USUARIO_PAGO)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:IDPAGO_LIQUIDACION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDPAGO_LIQUIDACION)) , 'LIQUIDACION')
      DbChangeTrigger.AddItem(LIQ:SOCIOS_LIQUIDACION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:SOCIOS_LIQUIDACION)) , 'LIQUIDACION')
   END
   DbChangeTrigger.Update('LIQUIDACION')
  RETURN ReturnValue


Hide:Access:LIQUIDACION.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('LIQUIDACION')
       DbChangeTrigger.CheckChanges('LIQUIDACION',LIQUIDACION) 
    END
  RETURN ReturnValue


Hide:Access:LIQUIDACION.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LIQUIDACION,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(LIQ:PK_LIQUIDACION,'LIQ:PK_LIQUIDACION',1)
    SELF.AddKey(LIQ:IDX_LIQUIDACION_ANO,'LIQ:IDX_LIQUIDACION_ANO',0)
    SELF.AddKey(LIQ:IDX_LIQUIDACION_FECHA_CARGA,'LIQ:IDX_LIQUIDACION_FECHA_CARGA',0)
    SELF.AddKey(LIQ:IDX_LIQUIDACION_FECHA_PAGO,'LIQ:IDX_LIQUIDACION_FECHA_PAGO',0)
    SELF.AddKey(LIQ:IDX_LIQUIDACION_FECHA_PRESENTAC,'LIQ:IDX_LIQUIDACION_FECHA_PRESENTAC',0)
    SELF.AddKey(LIQ:IDX_LIQUIDACION_MES,'LIQ:IDX_LIQUIDACION_MES',0)
    SELF.AddKey(LIQ:IDX_LIQUIDACION_PERIODO,'LIQ:IDX_LIQUIDACION_PERIODO',0)
    SELF.AddKey(LIQ:FK_LIQUIDACION_FORMA_PAGO,'LIQ:FK_LIQUIDACION_FORMA_PAGO',0)
    SELF.AddKey(LIQ:FK_LIQUIDACION_OS,'LIQ:FK_LIQUIDACION_OS',0)
    SELF.AddKey(LIQ:FK_LIQUIDACION_SOCIO,'LIQ:FK_LIQUIDACION_SOCIO',0)
    SELF.AddKey(LIQ:IDX_LIQUIDACION_UNIQUE,'LIQ:IDX_LIQUIDACION_UNIQUE',0)
    SELF.AddKey(LIQ:IDX_LIQUIDACION_PRESENTADO,'LIQ:IDX_LIQUIDACION_PRESENTADO',0)
    SELF.AddKey(LIQ:IDX_LIQUIDACION_COBRADO,'LIQ:IDX_LIQUIDACION_COBRADO',0)
    SELF.AddKey(LIQ:IDX_LIQUIDACION_PAGADO,'LIQ:IDX_LIQUIDACION_PAGADO',0)
    SELF.AddKey(LIQ:FK_USUARIO,'LIQ:FK_USUARIO',0)
    SELF.AddKey(LIQ:IDX_LIQUIDACION_PAGO,'LIQ:IDX_LIQUIDACION_PAGO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:LIQUIDACION.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS2       USHORT,AUTO
Save:OBRA_SOCIAL3  USHORT,AUTO
Save:FORMA_PAGO14  USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('LIQ:IDSOCIO')
    Save:SOCIOS2 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = LIQ:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS2)
  OF 3
    GlobalErrors.SetField('LIQ:IDOS')
    Save:OBRA_SOCIAL3 = Access:OBRA_SOCIAL.SaveFile()
    OBR:IDOS = LIQ:IDOS
    ReturnValue = Access:OBRA_SOCIAL.TryFetch(OBR:PK_OBRA_SOCIAL)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'OBRA_SOCIAL')
      END
    END
    Access:OBRA_SOCIAL.RestoreFile(Save:OBRA_SOCIAL3)
  OF 4
    GlobalErrors.SetField('LIQ:MES')
    IF NOT INRANGE(LIQ:MES,1,12)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'1 .. 12')
      END
    END
  OF 5
    GlobalErrors.SetField('LIQ:ANO')
    IF NOT INRANGE(LIQ:ANO,2009,2999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'2009 .. 2999')
      END
    END
  OF 14
    GlobalErrors.SetField('LIQ:IDFORMA_PAGO')
    Save:FORMA_PAGO14 = Access:FORMA_PAGO.SaveFile()
    FOR:IDFORMA_PAGO = LIQ:IDFORMA_PAGO
    ReturnValue = Access:FORMA_PAGO.TryFetch(FOR:PK_FORMA_PAGO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'FORMA_PAGO')
      END
    END
    Access:FORMA_PAGO.RestoreFile(Save:FORMA_PAGO14)
  END
  RETURN ReturnValue


Hide:Relate:LIQUIDACION.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:PAGOS_LIQUIDACION)

  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:USUARIO)

  SELF.AddRelation(Relate:OBRA_SOCIAL)

  SELF.AddRelation(Relate:FORMA_PAGO)

  SELF.AddRelation(Relate:LIQUIDACION_CODIGO,RI:CASCADE,RI:CASCADE,LIQC:FK_LIQUIDACION_CODIGO_LIQ)
  SELF.AddRelationLink(LIQ:IDLIQUIDACION,LIQC:IDLIQUIDACION)


Hide:Relate:LIQUIDACION.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('LIQUIDACION',LIQUIDACION)
  RETURN ReturnValue


Hide:Relate:LIQUIDACION.Kill PROCEDURE

  CODE
  _Hide:Access:LIQUIDACION.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:LIQUIDACION &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LIQUIDACION)                        ! destroy the file manager


Hide:Relate:LIQUIDACION.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('LIQUIDACION')
       DbChangeTrigger.AddThread('LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:IDLIQUIDACION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDLIQUIDACION)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:IDSOCIO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDSOCIO)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:IDOS, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDOS)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:MES, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:MES)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:ANO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:ANO)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:PERIODO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:PERIODO)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:TIPO_PERIODO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:TIPO_PERIODO)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:MONTO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:MONTO)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:FECHA_CARGA, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:FECHA_CARGA)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:FECHA_PRESENTACION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:FECHA_PRESENTACION)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:FECHA_COBRO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:FECHA_COBRO)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:FECHA_PAGO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:FECHA_PAGO)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:MONTO_PAGADO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:MONTO_PAGADO)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:IDFORMA_PAGO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDFORMA_PAGO)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:DEBITO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:DEBITO)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:COMISION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:COMISION)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:CANTIDAD, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:CANTIDAD)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:DEBITO_COMISION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:DEBITO_COMISION)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:CANTIDAD_CUOTAS_PAGADAS, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:CANTIDAD_CUOTAS_PAGADAS)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:DEBITO_PAGO_CUOTAS, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:DEBITO_PAGO_CUOTAS)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:MONTO_TOTAL, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:MONTO_TOTAL)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:PRESENTADO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:PRESENTADO)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:COBRADO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:COBRADO)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:PAGADO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:PAGADO)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:IDUSUARIO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDUSUARIO)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:USUARIO_PAGO, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:USUARIO_PAGO)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:IDPAGO_LIQUIDACION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:IDPAGO_LIQUIDACION)) , 'LIQUIDACION')
       DbChangeTrigger.AddItem(LIQ:SOCIOS_LIQUIDACION, WHO(LIQ:RECORD,WHERE(LIQ:RECORD,LIQ:SOCIOS_LIQUIDACION)) , 'LIQUIDACION')
    END
    DbChangeTrigger.Update('LIQUIDACION')


Hide:Relate:LIQUIDACION.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('LIQUIDACION')
        DbChangeTrigger.CheckChanges('LIQUIDACION',LIQUIDACION) 
     END
  RETURN ReturnValue


Hide:Relate:SEGURO.Init PROCEDURE()
  CODE
  _Hide:Access:SEGURO.Init
  SELF.Init(Access:SEGURO,1)


Hide:Access:SEGURO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('SEGURO')
      DbChangeTrigger.AddThread('SEGURO')
      DbChangeTrigger.AddItem(SEG:IDSEGURO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:IDSEGURO)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:IDSOCIO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:IDSOCIO)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:NOMBRE, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:NOMBRE)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:IDMATRICULA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:IDMATRICULA)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:ID_TIPO_SEGURO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:ID_TIPO_SEGURO)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:ID_FORMA_PAGO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:ID_FORMA_PAGO)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:FECHA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:FECHA)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:HORA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:HORA)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:IDUSUARIO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:IDUSUARIO)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:BAJA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:BAJA)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:FECHA_BAJA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:FECHA_BAJA)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:OBSERVACION, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:OBSERVACION)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:CANTIDAD, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:CANTIDAD)) , 'SEGURO')
   END
   DbChangeTrigger.Update('SEGURO')
  RETURN ReturnValue


Hide:Access:SEGURO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SEG:Record
  SELF.FileNameValue = 'SEGURO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SEGURO
  PARENT.Init
  Access:SEGURO &= SELF


Hide:Access:SEGURO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('SEGURO',SEGURO)
  RETURN ReturnValue


Hide:Access:SEGURO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SEGURO &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SEGURO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('SEGURO')
      DbChangeTrigger.AddThread('SEGURO')
      DbChangeTrigger.AddItem(SEG:IDSEGURO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:IDSEGURO)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:IDSOCIO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:IDSOCIO)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:NOMBRE, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:NOMBRE)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:IDMATRICULA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:IDMATRICULA)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:ID_TIPO_SEGURO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:ID_TIPO_SEGURO)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:ID_FORMA_PAGO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:ID_FORMA_PAGO)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:FECHA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:FECHA)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:HORA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:HORA)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:IDUSUARIO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:IDUSUARIO)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:BAJA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:BAJA)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:FECHA_BAJA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:FECHA_BAJA)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:OBSERVACION, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:OBSERVACION)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:CANTIDAD, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:CANTIDAD)) , 'SEGURO')
   END
   DbChangeTrigger.Update('SEGURO')
  RETURN ReturnValue


Hide:Access:SEGURO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('SEGURO')
      DbChangeTrigger.AddThread('SEGURO')
      DbChangeTrigger.AddItem(SEG:IDSEGURO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:IDSEGURO)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:IDSOCIO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:IDSOCIO)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:NOMBRE, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:NOMBRE)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:IDMATRICULA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:IDMATRICULA)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:ID_TIPO_SEGURO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:ID_TIPO_SEGURO)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:ID_FORMA_PAGO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:ID_FORMA_PAGO)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:FECHA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:FECHA)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:HORA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:HORA)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:IDUSUARIO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:IDUSUARIO)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:BAJA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:BAJA)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:FECHA_BAJA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:FECHA_BAJA)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:OBSERVACION, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:OBSERVACION)) , 'SEGURO')
      DbChangeTrigger.AddItem(SEG:CANTIDAD, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:CANTIDAD)) , 'SEGURO')
   END
   DbChangeTrigger.Update('SEGURO')
  RETURN ReturnValue


Hide:Access:SEGURO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('SEGURO')
       DbChangeTrigger.CheckChanges('SEGURO',SEGURO) 
    END
  RETURN ReturnValue


Hide:Access:SEGURO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SEGURO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SEG:IDX_SEGURO_MATRICULA,'SEG:IDX_SEGURO_MATRICULA',0)
    SELF.AddKey(SEG:IDX_SEGURO_NOMBRE,'SEG:IDX_SEGURO_NOMBRE',0)
    SELF.AddKey(SEG:FK_SEGURO_FORMA_PAGO,'SEG:FK_SEGURO_FORMA_PAGO',0)
    SELF.AddKey(SEG:FK_SEGURO_SOCIOS,'SEG:FK_SEGURO_SOCIOS',0)
    SELF.AddKey(SEG:FK_SEGURO_TIPO_SEGURO,'SEG:FK_SEGURO_TIPO_SEGURO',0)
    SELF.AddKey(SEG:FK_SEGURO_USUARIO,'SEG:FK_SEGURO_USUARIO',0)
    SELF.AddKey(SEG:PK,'SEG:PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:SEGURO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS2       USHORT,AUTO
Save:TIPO_SEGURO5  USHORT,AUTO
Save:FORMA_PAGO6   USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('SEG:IDSOCIO')
    Save:SOCIOS2 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = SEG:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS2)
  OF 5
    GlobalErrors.SetField('SEG:ID_TIPO_SEGURO')
    Save:TIPO_SEGURO5 = Access:TIPO_SEGURO.SaveFile()
    TIP8:ID_TIPO_SEGURO = SEG:ID_TIPO_SEGURO
    ReturnValue = Access:TIPO_SEGURO.TryFetch(TIP8:PK_TIPO_SEGURO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_SEGURO')
      END
    END
    Access:TIPO_SEGURO.RestoreFile(Save:TIPO_SEGURO5)
  OF 6
    GlobalErrors.SetField('SEG:ID_FORMA_PAGO')
    Save:FORMA_PAGO6 = Access:FORMA_PAGO.SaveFile()
    FOR:IDFORMA_PAGO = SEG:ID_FORMA_PAGO
    ReturnValue = Access:FORMA_PAGO.TryFetch(FOR:PK_FORMA_PAGO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'FORMA_PAGO')
      END
    END
    Access:FORMA_PAGO.RestoreFile(Save:FORMA_PAGO6)
  END
  RETURN ReturnValue


Hide:Relate:SEGURO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:USUARIO)

  SELF.AddRelation(Relate:FORMA_PAGO)

  SELF.AddRelation(Relate:TIPO_SEGURO)


Hide:Relate:SEGURO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('SEGURO',SEGURO)
  RETURN ReturnValue


Hide:Relate:SEGURO.Kill PROCEDURE

  CODE
  _Hide:Access:SEGURO.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:SEGURO &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SEGURO)                             ! destroy the file manager


Hide:Relate:SEGURO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('SEGURO')
       DbChangeTrigger.AddThread('SEGURO')
       DbChangeTrigger.AddItem(SEG:IDSEGURO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:IDSEGURO)) , 'SEGURO')
       DbChangeTrigger.AddItem(SEG:IDSOCIO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:IDSOCIO)) , 'SEGURO')
       DbChangeTrigger.AddItem(SEG:NOMBRE, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:NOMBRE)) , 'SEGURO')
       DbChangeTrigger.AddItem(SEG:IDMATRICULA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:IDMATRICULA)) , 'SEGURO')
       DbChangeTrigger.AddItem(SEG:ID_TIPO_SEGURO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:ID_TIPO_SEGURO)) , 'SEGURO')
       DbChangeTrigger.AddItem(SEG:ID_FORMA_PAGO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:ID_FORMA_PAGO)) , 'SEGURO')
       DbChangeTrigger.AddItem(SEG:FECHA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:FECHA)) , 'SEGURO')
       DbChangeTrigger.AddItem(SEG:HORA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:HORA)) , 'SEGURO')
       DbChangeTrigger.AddItem(SEG:IDUSUARIO, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:IDUSUARIO)) , 'SEGURO')
       DbChangeTrigger.AddItem(SEG:BAJA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:BAJA)) , 'SEGURO')
       DbChangeTrigger.AddItem(SEG:FECHA_BAJA, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:FECHA_BAJA)) , 'SEGURO')
       DbChangeTrigger.AddItem(SEG:OBSERVACION, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:OBSERVACION)) , 'SEGURO')
       DbChangeTrigger.AddItem(SEG:CANTIDAD, WHO(SEG:RECORD,WHERE(SEG:RECORD,SEG:CANTIDAD)) , 'SEGURO')
    END
    DbChangeTrigger.Update('SEGURO')


Hide:Relate:SEGURO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('SEGURO')
        DbChangeTrigger.CheckChanges('SEGURO',SEGURO) 
     END
  RETURN ReturnValue


Hide:Relate:SEGURO_FACTURA.Init PROCEDURE()
  CODE
  _Hide:Access:SEGURO_FACTURA.Init
  SELF.Init(Access:SEGURO_FACTURA,1)


Hide:Access:SEGURO_FACTURA.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('SEGURO_FACTURA')
      DbChangeTrigger.AddThread('SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDFACTURA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDFACTURA)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDSOCIO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDSOCIO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDUSUARIO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDUSUARIO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:MONTOCOBERTURA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:MONTOCOBERTURA)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:INTERES, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:INTERES)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:TOTAL, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:TOTAL)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:MES, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:MES)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:ANO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:ANO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:PERIODO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:PERIODO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:FECHA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:FECHA)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:HORA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:HORA)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:ESTADO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:ESTADO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:DESCUENTOCOBERTURA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:DESCUENTOCOBERTURA)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:DESCUENTOESPECIAL, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:DESCUENTOESPECIAL)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDTIPO_SEGURO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDTIPO_SEGURO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDPAGO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDPAGO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDPAGO_LIQ, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDPAGO_LIQ)) , 'SEGURO_FACTURA')
   END
   DbChangeTrigger.Update('SEGURO_FACTURA')
  RETURN ReturnValue


Hide:Access:SEGURO_FACTURA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SEG5:Record
  SELF.FileNameValue = 'SEGURO_FACTURA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SEGURO_FACTURA
  PARENT.Init
  Access:SEGURO_FACTURA &= SELF


Hide:Access:SEGURO_FACTURA.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('SEGURO_FACTURA',SEGURO_FACTURA)
  RETURN ReturnValue


Hide:Access:SEGURO_FACTURA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SEGURO_FACTURA &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SEGURO_FACTURA.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('SEGURO_FACTURA')
      DbChangeTrigger.AddThread('SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDFACTURA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDFACTURA)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDSOCIO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDSOCIO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDUSUARIO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDUSUARIO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:MONTOCOBERTURA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:MONTOCOBERTURA)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:INTERES, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:INTERES)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:TOTAL, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:TOTAL)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:MES, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:MES)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:ANO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:ANO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:PERIODO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:PERIODO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:FECHA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:FECHA)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:HORA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:HORA)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:ESTADO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:ESTADO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:DESCUENTOCOBERTURA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:DESCUENTOCOBERTURA)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:DESCUENTOESPECIAL, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:DESCUENTOESPECIAL)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDTIPO_SEGURO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDTIPO_SEGURO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDPAGO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDPAGO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDPAGO_LIQ, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDPAGO_LIQ)) , 'SEGURO_FACTURA')
   END
   DbChangeTrigger.Update('SEGURO_FACTURA')
  RETURN ReturnValue


Hide:Access:SEGURO_FACTURA.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('SEGURO_FACTURA')
      DbChangeTrigger.AddThread('SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDFACTURA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDFACTURA)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDSOCIO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDSOCIO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDUSUARIO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDUSUARIO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:MONTOCOBERTURA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:MONTOCOBERTURA)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:INTERES, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:INTERES)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:TOTAL, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:TOTAL)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:MES, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:MES)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:ANO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:ANO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:PERIODO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:PERIODO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:FECHA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:FECHA)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:HORA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:HORA)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:ESTADO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:ESTADO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:DESCUENTOCOBERTURA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:DESCUENTOCOBERTURA)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:DESCUENTOESPECIAL, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:DESCUENTOESPECIAL)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDTIPO_SEGURO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDTIPO_SEGURO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDPAGO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDPAGO)) , 'SEGURO_FACTURA')
      DbChangeTrigger.AddItem(SEG5:IDPAGO_LIQ, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDPAGO_LIQ)) , 'SEGURO_FACTURA')
   END
   DbChangeTrigger.Update('SEGURO_FACTURA')
  RETURN ReturnValue


Hide:Access:SEGURO_FACTURA.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('SEGURO_FACTURA')
       DbChangeTrigger.CheckChanges('SEGURO_FACTURA',SEGURO_FACTURA) 
    END
  RETURN ReturnValue


Hide:Access:SEGURO_FACTURA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SEGURO_FACTURA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SEG5:IDX_SEGURO_FACTURA_ESTADO,'SEG5:IDX_SEGURO_FACTURA_ESTADO',0)
    SELF.AddKey(SEG5:IDX_SEGURO_FACTURA_FECHA,'SEG5:IDX_SEGURO_FACTURA_FECHA',0)
    SELF.AddKey(SEG5:IDX_SEGURO_FACTURA_MES,'SEG5:IDX_SEGURO_FACTURA_MES',0)
    SELF.AddKey(SEG5:IDX_SEGURO_FACTURA_PERIODO,'SEG5:IDX_SEGURO_FACTURA_PERIODO',0)
    SELF.AddKey(SEG5:IDX_SEGURO_FACTURA_TOTAL,'SEG5:IDX_SEGURO_FACTURA_TOTAL',0)
    SELF.AddKey(SEG5:FK_SEGURO_FACTURA_SOCIO,'SEG5:FK_SEGURO_FACTURA_SOCIO',0)
    SELF.AddKey(SEG5:FK_SEGURO_FACTURA_TIPO_SEGURO,'SEG5:FK_SEGURO_FACTURA_TIPO_SEGURO',0)
    SELF.AddKey(SEG5:FK_SEGURO_FACTURA_USUARIO,'SEG5:FK_SEGURO_FACTURA_USUARIO',0)
    SELF.AddKey(SEG5:IDX_SEGURO_FACTURA_UNIQUE,'SEG5:IDX_SEGURO_FACTURA_UNIQUE',0)
    SELF.AddKey(SEG5:PK_SEGURO_FACTURA,'SEG5:PK_SEGURO_FACTURA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:SEGURO_FACTURA.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS2       USHORT,AUTO
Save:TIPO_SEGURO15 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('SEG5:IDSOCIO')
    Save:SOCIOS2 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = SEG5:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS2)
  OF 15
    GlobalErrors.SetField('SEG5:IDTIPO_SEGURO')
    Save:TIPO_SEGURO15 = Access:TIPO_SEGURO.SaveFile()
    TIP8:ID_TIPO_SEGURO = SEG5:IDTIPO_SEGURO
    ReturnValue = Access:TIPO_SEGURO.TryFetch(TIP8:PK_TIPO_SEGURO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_SEGURO')
      END
    END
    Access:TIPO_SEGURO.RestoreFile(Save:TIPO_SEGURO15)
  END
  RETURN ReturnValue


Hide:Relate:SEGURO_FACTURA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:TIPO_SEGURO)


Hide:Relate:SEGURO_FACTURA.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('SEGURO_FACTURA',SEGURO_FACTURA)
  RETURN ReturnValue


Hide:Relate:SEGURO_FACTURA.Kill PROCEDURE

  CODE
  _Hide:Access:SEGURO_FACTURA.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:SEGURO_FACTURA &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SEGURO_FACTURA)                     ! destroy the file manager


Hide:Relate:SEGURO_FACTURA.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('SEGURO_FACTURA')
       DbChangeTrigger.AddThread('SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:IDFACTURA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDFACTURA)) , 'SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:IDSOCIO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDSOCIO)) , 'SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:IDUSUARIO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDUSUARIO)) , 'SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:MONTOCOBERTURA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:MONTOCOBERTURA)) , 'SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:INTERES, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:INTERES)) , 'SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:TOTAL, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:TOTAL)) , 'SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:MES, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:MES)) , 'SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:ANO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:ANO)) , 'SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:PERIODO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:PERIODO)) , 'SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:FECHA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:FECHA)) , 'SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:HORA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:HORA)) , 'SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:ESTADO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:ESTADO)) , 'SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:DESCUENTOCOBERTURA, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:DESCUENTOCOBERTURA)) , 'SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:DESCUENTOESPECIAL, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:DESCUENTOESPECIAL)) , 'SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:IDTIPO_SEGURO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDTIPO_SEGURO)) , 'SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:IDPAGO, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDPAGO)) , 'SEGURO_FACTURA')
       DbChangeTrigger.AddItem(SEG5:IDPAGO_LIQ, WHO(SEG5:RECORD,WHERE(SEG5:RECORD,SEG5:IDPAGO_LIQ)) , 'SEGURO_FACTURA')
    END
    DbChangeTrigger.Update('SEGURO_FACTURA')


Hide:Relate:SEGURO_FACTURA.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('SEGURO_FACTURA')
        DbChangeTrigger.CheckChanges('SEGURO_FACTURA',SEGURO_FACTURA) 
     END
  RETURN ReturnValue


Hide:Relate:TIPO_SEGURO.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_SEGURO.Init
  SELF.Init(Access:TIPO_SEGURO,1)


Hide:Access:TIPO_SEGURO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_SEGURO')
      DbChangeTrigger.AddThread('TIPO_SEGURO')
      DbChangeTrigger.AddItem(TIP8:ID_TIPO_SEGURO, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:ID_TIPO_SEGURO)) , 'TIPO_SEGURO')
      DbChangeTrigger.AddItem(TIP8:DESCRIPCION, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:DESCRIPCION)) , 'TIPO_SEGURO')
      DbChangeTrigger.AddItem(TIP8:COBERTURA, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:COBERTURA)) , 'TIPO_SEGURO')
      DbChangeTrigger.AddItem(TIP8:MOTO, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:MOTO)) , 'TIPO_SEGURO')
      DbChangeTrigger.AddItem(TIP8:PORCENT_COL, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:PORCENT_COL)) , 'TIPO_SEGURO')
   END
   DbChangeTrigger.Update('TIPO_SEGURO')
  RETURN ReturnValue


Hide:Access:TIPO_SEGURO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIP8:Record
  SELF.FileNameValue = 'TIPO_SEGURO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_SEGURO
  PARENT.Init
  Access:TIPO_SEGURO &= SELF


Hide:Access:TIPO_SEGURO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('TIPO_SEGURO',TIPO_SEGURO)
  RETURN ReturnValue


Hide:Access:TIPO_SEGURO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_SEGURO &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TIPO_SEGURO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('TIPO_SEGURO')
      DbChangeTrigger.AddThread('TIPO_SEGURO')
      DbChangeTrigger.AddItem(TIP8:ID_TIPO_SEGURO, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:ID_TIPO_SEGURO)) , 'TIPO_SEGURO')
      DbChangeTrigger.AddItem(TIP8:DESCRIPCION, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:DESCRIPCION)) , 'TIPO_SEGURO')
      DbChangeTrigger.AddItem(TIP8:COBERTURA, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:COBERTURA)) , 'TIPO_SEGURO')
      DbChangeTrigger.AddItem(TIP8:MOTO, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:MOTO)) , 'TIPO_SEGURO')
      DbChangeTrigger.AddItem(TIP8:PORCENT_COL, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:PORCENT_COL)) , 'TIPO_SEGURO')
   END
   DbChangeTrigger.Update('TIPO_SEGURO')
  RETURN ReturnValue


Hide:Access:TIPO_SEGURO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_SEGURO')
      DbChangeTrigger.AddThread('TIPO_SEGURO')
      DbChangeTrigger.AddItem(TIP8:ID_TIPO_SEGURO, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:ID_TIPO_SEGURO)) , 'TIPO_SEGURO')
      DbChangeTrigger.AddItem(TIP8:DESCRIPCION, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:DESCRIPCION)) , 'TIPO_SEGURO')
      DbChangeTrigger.AddItem(TIP8:COBERTURA, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:COBERTURA)) , 'TIPO_SEGURO')
      DbChangeTrigger.AddItem(TIP8:MOTO, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:MOTO)) , 'TIPO_SEGURO')
      DbChangeTrigger.AddItem(TIP8:PORCENT_COL, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:PORCENT_COL)) , 'TIPO_SEGURO')
   END
   DbChangeTrigger.Update('TIPO_SEGURO')
  RETURN ReturnValue


Hide:Access:TIPO_SEGURO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('TIPO_SEGURO')
       DbChangeTrigger.CheckChanges('TIPO_SEGURO',TIPO_SEGURO) 
    END
  RETURN ReturnValue


Hide:Access:TIPO_SEGURO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TIPO_SEGURO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TIP8:PK_TIPO_SEGURO,'TIP8:PK_TIPO_SEGURO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TIPO_SEGURO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SEGURO,RI:None,RI:None,SEG:FK_SEGURO_TIPO_SEGURO)
  SELF.AddRelationLink(TIP8:ID_TIPO_SEGURO,SEG:ID_TIPO_SEGURO)

  SELF.AddRelation(Relate:SEGURO_FACTURA,RI:None,RI:None,SEG5:FK_SEGURO_FACTURA_TIPO_SEGURO)
  SELF.AddRelationLink(TIP8:ID_TIPO_SEGURO,SEG5:IDTIPO_SEGURO)


Hide:Relate:TIPO_SEGURO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('TIPO_SEGURO',TIPO_SEGURO)
  RETURN ReturnValue


Hide:Relate:TIPO_SEGURO.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_SEGURO.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_SEGURO &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_SEGURO)                        ! destroy the file manager


Hide:Relate:TIPO_SEGURO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('TIPO_SEGURO')
       DbChangeTrigger.AddThread('TIPO_SEGURO')
       DbChangeTrigger.AddItem(TIP8:ID_TIPO_SEGURO, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:ID_TIPO_SEGURO)) , 'TIPO_SEGURO')
       DbChangeTrigger.AddItem(TIP8:DESCRIPCION, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:DESCRIPCION)) , 'TIPO_SEGURO')
       DbChangeTrigger.AddItem(TIP8:COBERTURA, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:COBERTURA)) , 'TIPO_SEGURO')
       DbChangeTrigger.AddItem(TIP8:MOTO, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:MOTO)) , 'TIPO_SEGURO')
       DbChangeTrigger.AddItem(TIP8:PORCENT_COL, WHO(TIP8:RECORD,WHERE(TIP8:RECORD,TIP8:PORCENT_COL)) , 'TIPO_SEGURO')
    END
    DbChangeTrigger.Update('TIPO_SEGURO')


Hide:Relate:TIPO_SEGURO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('TIPO_SEGURO')
        DbChangeTrigger.CheckChanges('TIPO_SEGURO',TIPO_SEGURO) 
     END
  RETURN ReturnValue


Hide:Relate:NOMENCLADOR.Init PROCEDURE()
  CODE
  _Hide:Access:NOMENCLADOR.Init
  SELF.Init(Access:NOMENCLADOR,1)


Hide:Access:NOMENCLADOR.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('NOMENCLADOR')
      DbChangeTrigger.AddThread('NOMENCLADOR')
      DbChangeTrigger.AddItem(NOM:IDNOMENCLADOR, WHO(NOM:RECORD,WHERE(NOM:RECORD,NOM:IDNOMENCLADOR)) , 'NOMENCLADOR')
      DbChangeTrigger.AddItem(NOM:CODIGO, WHO(NOM:RECORD,WHERE(NOM:RECORD,NOM:CODIGO)) , 'NOMENCLADOR')
      DbChangeTrigger.AddItem(NOM:DESCRIPCION, WHO(NOM:RECORD,WHERE(NOM:RECORD,NOM:DESCRIPCION)) , 'NOMENCLADOR')
   END
   DbChangeTrigger.Update('NOMENCLADOR')
  RETURN ReturnValue


Hide:Access:NOMENCLADOR.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= NOM:Record
  SELF.FileNameValue = 'NOMENCLADOR'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= NOMENCLADOR
  PARENT.Init
  Access:NOMENCLADOR &= SELF


Hide:Access:NOMENCLADOR.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('NOMENCLADOR',NOMENCLADOR)
  RETURN ReturnValue


Hide:Access:NOMENCLADOR.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:NOMENCLADOR &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:NOMENCLADOR.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('NOMENCLADOR')
      DbChangeTrigger.AddThread('NOMENCLADOR')
      DbChangeTrigger.AddItem(NOM:IDNOMENCLADOR, WHO(NOM:RECORD,WHERE(NOM:RECORD,NOM:IDNOMENCLADOR)) , 'NOMENCLADOR')
      DbChangeTrigger.AddItem(NOM:CODIGO, WHO(NOM:RECORD,WHERE(NOM:RECORD,NOM:CODIGO)) , 'NOMENCLADOR')
      DbChangeTrigger.AddItem(NOM:DESCRIPCION, WHO(NOM:RECORD,WHERE(NOM:RECORD,NOM:DESCRIPCION)) , 'NOMENCLADOR')
   END
   DbChangeTrigger.Update('NOMENCLADOR')
  RETURN ReturnValue


Hide:Access:NOMENCLADOR.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('NOMENCLADOR')
      DbChangeTrigger.AddThread('NOMENCLADOR')
      DbChangeTrigger.AddItem(NOM:IDNOMENCLADOR, WHO(NOM:RECORD,WHERE(NOM:RECORD,NOM:IDNOMENCLADOR)) , 'NOMENCLADOR')
      DbChangeTrigger.AddItem(NOM:CODIGO, WHO(NOM:RECORD,WHERE(NOM:RECORD,NOM:CODIGO)) , 'NOMENCLADOR')
      DbChangeTrigger.AddItem(NOM:DESCRIPCION, WHO(NOM:RECORD,WHERE(NOM:RECORD,NOM:DESCRIPCION)) , 'NOMENCLADOR')
   END
   DbChangeTrigger.Update('NOMENCLADOR')
  RETURN ReturnValue


Hide:Access:NOMENCLADOR.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('NOMENCLADOR')
       DbChangeTrigger.CheckChanges('NOMENCLADOR',NOMENCLADOR) 
    END
  RETURN ReturnValue


Hide:Access:NOMENCLADOR.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(NOMENCLADOR,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(NOM:IDX_NOMENCLADOR_CODIGO,'NOM:IDX_NOMENCLADOR_CODIGO',0)
    SELF.AddKey(NOM:IDX_NOMENCLADOR_DESCRIPCION,'NOM:IDX_NOMENCLADOR_DESCRIPCION',0)
    SELF.AddKey(NOM:IDX_NOMENCLADOR_CONTROL,'NOM:IDX_NOMENCLADOR_CONTROL',0)
    SELF.AddKey(NOM:PK_NOMENCLADOR,'NOM:PK_NOMENCLADOR',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:NOMENCLADOR.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:NOMENCLADORXOS,RI:None,RI:None,NOM2:FK_NOMENCLADORXOS_NOMENCLADOR)
  SELF.AddRelationLink(NOM:IDNOMENCLADOR,NOM2:IDNOMENCLADOR)


Hide:Relate:NOMENCLADOR.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('NOMENCLADOR',NOMENCLADOR)
  RETURN ReturnValue


Hide:Relate:NOMENCLADOR.Kill PROCEDURE

  CODE
  _Hide:Access:NOMENCLADOR.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:NOMENCLADOR &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:NOMENCLADOR)                        ! destroy the file manager


Hide:Relate:NOMENCLADOR.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('NOMENCLADOR')
       DbChangeTrigger.AddThread('NOMENCLADOR')
       DbChangeTrigger.AddItem(NOM:IDNOMENCLADOR, WHO(NOM:RECORD,WHERE(NOM:RECORD,NOM:IDNOMENCLADOR)) , 'NOMENCLADOR')
       DbChangeTrigger.AddItem(NOM:CODIGO, WHO(NOM:RECORD,WHERE(NOM:RECORD,NOM:CODIGO)) , 'NOMENCLADOR')
       DbChangeTrigger.AddItem(NOM:DESCRIPCION, WHO(NOM:RECORD,WHERE(NOM:RECORD,NOM:DESCRIPCION)) , 'NOMENCLADOR')
    END
    DbChangeTrigger.Update('NOMENCLADOR')


Hide:Relate:NOMENCLADOR.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('NOMENCLADOR')
        DbChangeTrigger.CheckChanges('NOMENCLADOR',NOMENCLADOR) 
     END
  RETURN ReturnValue


Hide:Relate:NOMENCLADORXOS.Init PROCEDURE()
  CODE
  _Hide:Access:NOMENCLADORXOS.Init
  SELF.Init(Access:NOMENCLADORXOS,1)


Hide:Access:NOMENCLADORXOS.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('NOMENCLADORXOS')
      DbChangeTrigger.AddThread('NOMENCLADORXOS')
      DbChangeTrigger.AddItem(NOM2:IDOS, WHO(NOM2:RECORD,WHERE(NOM2:RECORD,NOM2:IDOS)) , 'NOMENCLADORXOS')
      DbChangeTrigger.AddItem(NOM2:IDNOMENCLADOR, WHO(NOM2:RECORD,WHERE(NOM2:RECORD,NOM2:IDNOMENCLADOR)) , 'NOMENCLADORXOS')
      DbChangeTrigger.AddItem(NOM2:VALOR, WHO(NOM2:RECORD,WHERE(NOM2:RECORD,NOM2:VALOR)) , 'NOMENCLADORXOS')
      DbChangeTrigger.AddItem(NOM2:VALOR_ANTERIOR, WHO(NOM2:RECORD,WHERE(NOM2:RECORD,NOM2:VALOR_ANTERIOR)) , 'NOMENCLADORXOS')
   END
   DbChangeTrigger.Update('NOMENCLADORXOS')
  RETURN ReturnValue


Hide:Access:NOMENCLADORXOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= NOM2:Record
  SELF.FileNameValue = 'NOMENCLADORXOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= NOMENCLADORXOS
  PARENT.Init
  Access:NOMENCLADORXOS &= SELF


Hide:Access:NOMENCLADORXOS.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('NOMENCLADORXOS',NOMENCLADORXOS)
  RETURN ReturnValue


Hide:Access:NOMENCLADORXOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:NOMENCLADORXOS &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:NOMENCLADORXOS.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('NOMENCLADORXOS')
      DbChangeTrigger.AddThread('NOMENCLADORXOS')
      DbChangeTrigger.AddItem(NOM2:IDOS, WHO(NOM2:RECORD,WHERE(NOM2:RECORD,NOM2:IDOS)) , 'NOMENCLADORXOS')
      DbChangeTrigger.AddItem(NOM2:IDNOMENCLADOR, WHO(NOM2:RECORD,WHERE(NOM2:RECORD,NOM2:IDNOMENCLADOR)) , 'NOMENCLADORXOS')
      DbChangeTrigger.AddItem(NOM2:VALOR, WHO(NOM2:RECORD,WHERE(NOM2:RECORD,NOM2:VALOR)) , 'NOMENCLADORXOS')
      DbChangeTrigger.AddItem(NOM2:VALOR_ANTERIOR, WHO(NOM2:RECORD,WHERE(NOM2:RECORD,NOM2:VALOR_ANTERIOR)) , 'NOMENCLADORXOS')
   END
   DbChangeTrigger.Update('NOMENCLADORXOS')
  RETURN ReturnValue


Hide:Access:NOMENCLADORXOS.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('NOMENCLADORXOS')
      DbChangeTrigger.AddThread('NOMENCLADORXOS')
      DbChangeTrigger.AddItem(NOM2:IDOS, WHO(NOM2:RECORD,WHERE(NOM2:RECORD,NOM2:IDOS)) , 'NOMENCLADORXOS')
      DbChangeTrigger.AddItem(NOM2:IDNOMENCLADOR, WHO(NOM2:RECORD,WHERE(NOM2:RECORD,NOM2:IDNOMENCLADOR)) , 'NOMENCLADORXOS')
      DbChangeTrigger.AddItem(NOM2:VALOR, WHO(NOM2:RECORD,WHERE(NOM2:RECORD,NOM2:VALOR)) , 'NOMENCLADORXOS')
      DbChangeTrigger.AddItem(NOM2:VALOR_ANTERIOR, WHO(NOM2:RECORD,WHERE(NOM2:RECORD,NOM2:VALOR_ANTERIOR)) , 'NOMENCLADORXOS')
   END
   DbChangeTrigger.Update('NOMENCLADORXOS')
  RETURN ReturnValue


Hide:Access:NOMENCLADORXOS.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('NOMENCLADORXOS')
       DbChangeTrigger.CheckChanges('NOMENCLADORXOS',NOMENCLADORXOS) 
    END
  RETURN ReturnValue


Hide:Access:NOMENCLADORXOS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(NOMENCLADORXOS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(NOM2:FK_NOMENCLADORXOS_NOMENCLADOR,'NOM2:FK_NOMENCLADORXOS_NOMENCLADOR',0)
    SELF.AddKey(NOM2:FK_NOMENCLADORXOS_OS,'NOM2:FK_NOMENCLADORXOS_OS',0)
    SELF.AddKey(NOM2:PK_NOMENCLADORXOS,'NOM2:PK_NOMENCLADORXOS',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:NOMENCLADORXOS.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:OBRA_SOCIAL1  USHORT,AUTO
Save:NOMENCLADOR2  USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('NOM2:IDOS')
    Save:OBRA_SOCIAL1 = Access:OBRA_SOCIAL.SaveFile()
    OBR:IDOS = NOM2:IDOS
    ReturnValue = Access:OBRA_SOCIAL.TryFetch(OBR:PK_OBRA_SOCIAL)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'OBRA_SOCIAL')
      END
    END
    Access:OBRA_SOCIAL.RestoreFile(Save:OBRA_SOCIAL1)
  OF 2
    GlobalErrors.SetField('NOM2:IDNOMENCLADOR')
    Save:NOMENCLADOR2 = Access:NOMENCLADOR.SaveFile()
    NOM:IDNOMENCLADOR = NOM2:IDNOMENCLADOR
    ReturnValue = Access:NOMENCLADOR.TryFetch(NOM:PK_NOMENCLADOR)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'NOMENCLADOR')
      END
    END
    Access:NOMENCLADOR.RestoreFile(Save:NOMENCLADOR2)
  END
  RETURN ReturnValue


Hide:Relate:NOMENCLADORXOS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OBRA_SOCIAL)

  SELF.AddRelation(Relate:NOMENCLADOR)

  SELF.AddRelation(Relate:LIQUIDACION_CODIGO,RI:None,RI:None,LIQC:FK_LIQUIDACION_CODIGO_OS)
  SELF.AddRelationLink(NOM2:IDOS,LIQC:IDOS)
  SELF.AddRelationLink(NOM2:IDNOMENCLADOR,LIQC:IDNOMENCLADOR)


Hide:Relate:NOMENCLADORXOS.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('NOMENCLADORXOS',NOMENCLADORXOS)
  RETURN ReturnValue


Hide:Relate:NOMENCLADORXOS.Kill PROCEDURE

  CODE
  _Hide:Access:NOMENCLADORXOS.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:NOMENCLADORXOS &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:NOMENCLADORXOS)                     ! destroy the file manager


Hide:Relate:NOMENCLADORXOS.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('NOMENCLADORXOS')
       DbChangeTrigger.AddThread('NOMENCLADORXOS')
       DbChangeTrigger.AddItem(NOM2:IDOS, WHO(NOM2:RECORD,WHERE(NOM2:RECORD,NOM2:IDOS)) , 'NOMENCLADORXOS')
       DbChangeTrigger.AddItem(NOM2:IDNOMENCLADOR, WHO(NOM2:RECORD,WHERE(NOM2:RECORD,NOM2:IDNOMENCLADOR)) , 'NOMENCLADORXOS')
       DbChangeTrigger.AddItem(NOM2:VALOR, WHO(NOM2:RECORD,WHERE(NOM2:RECORD,NOM2:VALOR)) , 'NOMENCLADORXOS')
       DbChangeTrigger.AddItem(NOM2:VALOR_ANTERIOR, WHO(NOM2:RECORD,WHERE(NOM2:RECORD,NOM2:VALOR_ANTERIOR)) , 'NOMENCLADORXOS')
    END
    DbChangeTrigger.Update('NOMENCLADORXOS')


Hide:Relate:NOMENCLADORXOS.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('NOMENCLADORXOS')
        DbChangeTrigger.CheckChanges('NOMENCLADORXOS',NOMENCLADORXOS) 
     END
  RETURN ReturnValue


Hide:Relate:CURSO.Init PROCEDURE()
  CODE
  _Hide:Access:CURSO.Init
  SELF.Init(Access:CURSO,1)


Hide:Access:CURSO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CURSO')
      DbChangeTrigger.AddThread('CURSO')
      DbChangeTrigger.AddItem(CUR:IDCURSO, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:IDCURSO)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:DESCRIPCION, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:DESCRIPCION)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:PRESENCIAL, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:PRESENCIAL)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:CANTIDAD_HORAS, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:CANTIDAD_HORAS)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:MONTO_TOTAL, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:MONTO_TOTAL)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:OBSERVACION, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:OBSERVACION)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:ID_TIPO_CURSO, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:ID_TIPO_CURSO)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:CANTIDAD, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:CANTIDAD)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:FECHA_INICIO, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:FECHA_INICIO)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:FECHA_FIN, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:FECHA_FIN)) , 'CURSO')
   END
   DbChangeTrigger.Update('CURSO')
  RETURN ReturnValue


Hide:Access:CURSO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CUR:Record
  SELF.FileNameValue = 'CURSO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CURSO
  PARENT.Init
  Access:CURSO &= SELF


Hide:Access:CURSO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CURSO',CURSO)
  RETURN ReturnValue


Hide:Access:CURSO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CURSO &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CURSO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CURSO')
      DbChangeTrigger.AddThread('CURSO')
      DbChangeTrigger.AddItem(CUR:IDCURSO, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:IDCURSO)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:DESCRIPCION, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:DESCRIPCION)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:PRESENCIAL, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:PRESENCIAL)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:CANTIDAD_HORAS, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:CANTIDAD_HORAS)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:MONTO_TOTAL, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:MONTO_TOTAL)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:OBSERVACION, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:OBSERVACION)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:ID_TIPO_CURSO, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:ID_TIPO_CURSO)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:CANTIDAD, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:CANTIDAD)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:FECHA_INICIO, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:FECHA_INICIO)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:FECHA_FIN, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:FECHA_FIN)) , 'CURSO')
   END
   DbChangeTrigger.Update('CURSO')
  RETURN ReturnValue


Hide:Access:CURSO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CURSO')
      DbChangeTrigger.AddThread('CURSO')
      DbChangeTrigger.AddItem(CUR:IDCURSO, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:IDCURSO)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:DESCRIPCION, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:DESCRIPCION)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:PRESENCIAL, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:PRESENCIAL)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:CANTIDAD_HORAS, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:CANTIDAD_HORAS)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:MONTO_TOTAL, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:MONTO_TOTAL)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:OBSERVACION, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:OBSERVACION)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:ID_TIPO_CURSO, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:ID_TIPO_CURSO)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:CANTIDAD, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:CANTIDAD)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:FECHA_INICIO, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:FECHA_INICIO)) , 'CURSO')
      DbChangeTrigger.AddItem(CUR:FECHA_FIN, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:FECHA_FIN)) , 'CURSO')
   END
   DbChangeTrigger.Update('CURSO')
  RETURN ReturnValue


Hide:Access:CURSO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CURSO')
       DbChangeTrigger.CheckChanges('CURSO',CURSO) 
    END
  RETURN ReturnValue


Hide:Access:CURSO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CURSO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CUR:IDX_CURSO_DESCRIPCION,'CUR:IDX_CURSO_DESCRIPCION',0)
    SELF.AddKey(CUR:FK_CURSO_TIPO_CURSO,'CUR:FK_CURSO_TIPO_CURSO',0)
    SELF.AddKey(CUR:PK_CURSO,'CUR:PK_CURSO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CURSO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:TIPO_CURSO7   USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 7
    GlobalErrors.SetField('CUR:ID_TIPO_CURSO')
    Save:TIPO_CURSO7 = Access:TIPO_CURSO.SaveFile()
    TIP2:ID_TIPO_CURSO = CUR:ID_TIPO_CURSO
    ReturnValue = Access:TIPO_CURSO.TryFetch(TIP2:PK_T_CURSO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_CURSO')
      END
    END
    Access:TIPO_CURSO.RestoreFile(Save:TIPO_CURSO7)
  END
  RETURN ReturnValue


Hide:Relate:CURSO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TIPO_CURSO)

  SELF.AddRelation(Relate:CURSO_INSCRIPCION,RI:None,RI:None,CURI:FK_CURSO_INSCRIPCION_CURSO)
  SELF.AddRelationLink(CUR:IDCURSO,CURI:IDCURSO)

  SELF.AddRelation(Relate:CURSO_MODULOS,RI:None,RI:None,CUR2:FK_CURSO_MODULOS_CURSO)
  SELF.AddRelationLink(CUR:IDCURSO,CUR2:IDCURSO)


Hide:Relate:CURSO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CURSO',CURSO)
  RETURN ReturnValue


Hide:Relate:CURSO.Kill PROCEDURE

  CODE
  _Hide:Access:CURSO.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:CURSO &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CURSO)                              ! destroy the file manager


Hide:Relate:CURSO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CURSO')
       DbChangeTrigger.AddThread('CURSO')
       DbChangeTrigger.AddItem(CUR:IDCURSO, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:IDCURSO)) , 'CURSO')
       DbChangeTrigger.AddItem(CUR:DESCRIPCION, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:DESCRIPCION)) , 'CURSO')
       DbChangeTrigger.AddItem(CUR:PRESENCIAL, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:PRESENCIAL)) , 'CURSO')
       DbChangeTrigger.AddItem(CUR:CANTIDAD_HORAS, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:CANTIDAD_HORAS)) , 'CURSO')
       DbChangeTrigger.AddItem(CUR:MONTO_TOTAL, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:MONTO_TOTAL)) , 'CURSO')
       DbChangeTrigger.AddItem(CUR:OBSERVACION, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:OBSERVACION)) , 'CURSO')
       DbChangeTrigger.AddItem(CUR:ID_TIPO_CURSO, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:ID_TIPO_CURSO)) , 'CURSO')
       DbChangeTrigger.AddItem(CUR:CANTIDAD, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:CANTIDAD)) , 'CURSO')
       DbChangeTrigger.AddItem(CUR:FECHA_INICIO, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:FECHA_INICIO)) , 'CURSO')
       DbChangeTrigger.AddItem(CUR:FECHA_FIN, WHO(CUR:RECORD,WHERE(CUR:RECORD,CUR:FECHA_FIN)) , 'CURSO')
    END
    DbChangeTrigger.Update('CURSO')


Hide:Relate:CURSO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CURSO')
        DbChangeTrigger.CheckChanges('CURSO',CURSO) 
     END
  RETURN ReturnValue


Hide:Relate:CURSO_INSCRIPCION.Init PROCEDURE()
  CODE
  _Hide:Access:CURSO_INSCRIPCION.Init
  SELF.Init(Access:CURSO_INSCRIPCION,1)


Hide:Access:CURSO_INSCRIPCION.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CURSO_INSCRIPCION')
      DbChangeTrigger.AddThread('CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:IDINSCRIPCION, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:IDINSCRIPCION)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:ID_PROVEEDOR, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:ID_PROVEEDOR)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:IDCURSO, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:IDCURSO)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:FECHA, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:FECHA)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:HORA, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:HORA)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:IDUSUARIO, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:IDUSUARIO)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:MONTO_TOTAL, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:MONTO_TOTAL)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:TERMINADO, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:TERMINADO)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:DESCUENTO, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:DESCUENTO)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:PAGADO_TOTAL, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:PAGADO_TOTAL)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:CUOTAS, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:CUOTAS)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:MONTO_CUOTA, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:MONTO_CUOTA)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:OBSERVACION, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:OBSERVACION)) , 'CURSO_INSCRIPCION')
   END
   DbChangeTrigger.Update('CURSO_INSCRIPCION')
  RETURN ReturnValue


Hide:Access:CURSO_INSCRIPCION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CURI:Record
  SELF.FileNameValue = 'CURSO_INSCRIPCION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CURSO_INSCRIPCION
  PARENT.Init
  Access:CURSO_INSCRIPCION &= SELF


Hide:Access:CURSO_INSCRIPCION.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CURSO_INSCRIPCION',CURSO_INSCRIPCION)
  RETURN ReturnValue


Hide:Access:CURSO_INSCRIPCION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CURSO_INSCRIPCION &= NULL                         ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CURSO_INSCRIPCION.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CURSO_INSCRIPCION')
      DbChangeTrigger.AddThread('CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:IDINSCRIPCION, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:IDINSCRIPCION)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:ID_PROVEEDOR, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:ID_PROVEEDOR)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:IDCURSO, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:IDCURSO)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:FECHA, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:FECHA)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:HORA, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:HORA)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:IDUSUARIO, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:IDUSUARIO)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:MONTO_TOTAL, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:MONTO_TOTAL)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:TERMINADO, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:TERMINADO)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:DESCUENTO, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:DESCUENTO)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:PAGADO_TOTAL, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:PAGADO_TOTAL)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:CUOTAS, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:CUOTAS)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:MONTO_CUOTA, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:MONTO_CUOTA)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:OBSERVACION, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:OBSERVACION)) , 'CURSO_INSCRIPCION')
   END
   DbChangeTrigger.Update('CURSO_INSCRIPCION')
  RETURN ReturnValue


Hide:Access:CURSO_INSCRIPCION.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CURSO_INSCRIPCION')
      DbChangeTrigger.AddThread('CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:IDINSCRIPCION, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:IDINSCRIPCION)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:ID_PROVEEDOR, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:ID_PROVEEDOR)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:IDCURSO, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:IDCURSO)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:FECHA, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:FECHA)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:HORA, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:HORA)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:IDUSUARIO, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:IDUSUARIO)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:MONTO_TOTAL, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:MONTO_TOTAL)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:TERMINADO, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:TERMINADO)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:DESCUENTO, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:DESCUENTO)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:PAGADO_TOTAL, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:PAGADO_TOTAL)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:CUOTAS, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:CUOTAS)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:MONTO_CUOTA, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:MONTO_CUOTA)) , 'CURSO_INSCRIPCION')
      DbChangeTrigger.AddItem(CURI:OBSERVACION, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:OBSERVACION)) , 'CURSO_INSCRIPCION')
   END
   DbChangeTrigger.Update('CURSO_INSCRIPCION')
  RETURN ReturnValue


Hide:Access:CURSO_INSCRIPCION.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CURSO_INSCRIPCION')
       DbChangeTrigger.CheckChanges('CURSO_INSCRIPCION',CURSO_INSCRIPCION) 
    END
  RETURN ReturnValue


Hide:Access:CURSO_INSCRIPCION.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CURSO_INSCRIPCION,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CURI:IDX_CURSO_INSCRIPCION_FECHA,'CURI:IDX_CURSO_INSCRIPCION_FECHA',0)
    SELF.AddKey(CURI:IDX_CONTROL,'CURI:IDX_CONTROL',0)
    SELF.AddKey(CURI:FK_CURSO_INSCRIPCION_CURSO,'CURI:FK_CURSO_INSCRIPCION_CURSO',0)
    SELF.AddKey(CURI:FK_CURSO_INSCRIPCION_PROVEEDOR,'CURI:FK_CURSO_INSCRIPCION_PROVEEDOR',0)
    SELF.AddKey(CURI:FK_CURSO_INSCRIPCION_USUARIO,'CURI:FK_CURSO_INSCRIPCION_USUARIO',0)
    SELF.AddKey(CURI:IDX_CURSO_INSCRIPCION_UNIQUE,'CURI:IDX_CURSO_INSCRIPCION_UNIQUE',0)
    SELF.AddKey(CURI:PK_CURSO_INSCRIPCION,'CURI:PK_CURSO_INSCRIPCION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CURSO_INSCRIPCION.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:PROVEEDORES2  USHORT,AUTO
Save:CURSO3        USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('CURI:ID_PROVEEDOR')
    Save:PROVEEDORES2 = Access:PROVEEDORES.SaveFile()
    PRO2:IDPROVEEDOR = CURI:ID_PROVEEDOR
    ReturnValue = Access:PROVEEDORES.TryFetch(PRO2:PK_PROVEEDOR)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'PROVEEDORES')
      END
    END
    Access:PROVEEDORES.RestoreFile(Save:PROVEEDORES2)
  OF 3
    GlobalErrors.SetField('CURI:IDCURSO')
    Save:CURSO3 = Access:CURSO.SaveFile()
    CUR:IDCURSO = CURI:IDCURSO
    ReturnValue = Access:CURSO.TryFetch(CUR:PK_CURSO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CURSO')
      END
    END
    Access:CURSO.RestoreFile(Save:CURSO3)
  END
  RETURN ReturnValue


Hide:Relate:CURSO_INSCRIPCION.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:USUARIO)

  SELF.AddRelation(Relate:PROVEEDORES)

  SELF.AddRelation(Relate:CURSO)

  SELF.AddRelation(Relate:CURSO_INSCRIPCION_DETALLE,RI:None,RI:None,CURD:FK_CURSO_INSCRIPCION_DETALLE_IN)
  SELF.AddRelationLink(CURI:IDINSCRIPCION,CURD:IDINSCRIPCION)


Hide:Relate:CURSO_INSCRIPCION.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CURSO_INSCRIPCION',CURSO_INSCRIPCION)
  RETURN ReturnValue


Hide:Relate:CURSO_INSCRIPCION.Kill PROCEDURE

  CODE
  _Hide:Access:CURSO_INSCRIPCION.Kill                      ! Kill the file manager
  PARENT.Kill
  Relate:CURSO_INSCRIPCION &= NULL                         ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CURSO_INSCRIPCION)                  ! destroy the file manager


Hide:Relate:CURSO_INSCRIPCION.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CURSO_INSCRIPCION')
       DbChangeTrigger.AddThread('CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI:IDINSCRIPCION, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:IDINSCRIPCION)) , 'CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI:ID_PROVEEDOR, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:ID_PROVEEDOR)) , 'CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI:IDCURSO, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:IDCURSO)) , 'CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI:FECHA, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:FECHA)) , 'CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI:HORA, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:HORA)) , 'CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI:IDUSUARIO, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:IDUSUARIO)) , 'CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI:MONTO_TOTAL, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:MONTO_TOTAL)) , 'CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI:TERMINADO, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:TERMINADO)) , 'CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI:DESCUENTO, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:DESCUENTO)) , 'CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI:PAGADO_TOTAL, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:PAGADO_TOTAL)) , 'CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI:CUOTAS, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:CUOTAS)) , 'CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI:MONTO_CUOTA, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:MONTO_CUOTA)) , 'CURSO_INSCRIPCION')
       DbChangeTrigger.AddItem(CURI:OBSERVACION, WHO(CURI:RECORD,WHERE(CURI:RECORD,CURI:OBSERVACION)) , 'CURSO_INSCRIPCION')
    END
    DbChangeTrigger.Update('CURSO_INSCRIPCION')


Hide:Relate:CURSO_INSCRIPCION.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CURSO_INSCRIPCION')
        DbChangeTrigger.CheckChanges('CURSO_INSCRIPCION',CURSO_INSCRIPCION) 
     END
  RETURN ReturnValue


Hide:Relate:CURSO_INSCRIPCION_DETALLE.Init PROCEDURE()
  CODE
  _Hide:Access:CURSO_INSCRIPCION_DETALLE.Init
  SELF.Init(Access:CURSO_INSCRIPCION_DETALLE,1)


Hide:Access:CURSO_INSCRIPCION_DETALLE.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddThread('CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:IDINSCRIPCION, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:IDINSCRIPCION)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:IDCURSO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:IDCURSO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:ID_MODULO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:ID_MODULO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:FECHA_INSCRIPCION, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:FECHA_INSCRIPCION)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:PRESENTE, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:PRESENTE)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:NOTA, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:NOTA)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:MONTO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:MONTO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:PAGADO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:PAGADO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:FECHA_PAGO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:FECHA_PAGO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:HORA_PAGO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:HORA_PAGO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:USUARIO_PAGO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:USUARIO_PAGO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:IDSUBCUENTA, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:IDSUBCUENTA)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:DESCUENTO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:DESCUENTO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:SUCURSAL, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:SUCURSAL)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:IDRECIBO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:IDRECIBO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:CANTIDAD_CUOTAS, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:CANTIDAD_CUOTAS)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:SALDO_CUOTAS, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:SALDO_CUOTAS)) , 'CURSO_INSCRIPCION_DETALLE')
   END
   DbChangeTrigger.Update('CURSO_INSCRIPCION_DETALLE')
  RETURN ReturnValue


Hide:Access:CURSO_INSCRIPCION_DETALLE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CURD:Record
  SELF.FileNameValue = 'CURSO_INSCRIPCION_DETALLE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CURSO_INSCRIPCION_DETALLE
  PARENT.Init
  Access:CURSO_INSCRIPCION_DETALLE &= SELF


Hide:Access:CURSO_INSCRIPCION_DETALLE.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CURSO_INSCRIPCION_DETALLE',CURSO_INSCRIPCION_DETALLE)
  RETURN ReturnValue


Hide:Access:CURSO_INSCRIPCION_DETALLE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CURSO_INSCRIPCION_DETALLE &= NULL                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CURSO_INSCRIPCION_DETALLE.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddThread('CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:IDINSCRIPCION, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:IDINSCRIPCION)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:IDCURSO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:IDCURSO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:ID_MODULO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:ID_MODULO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:FECHA_INSCRIPCION, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:FECHA_INSCRIPCION)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:PRESENTE, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:PRESENTE)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:NOTA, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:NOTA)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:MONTO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:MONTO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:PAGADO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:PAGADO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:FECHA_PAGO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:FECHA_PAGO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:HORA_PAGO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:HORA_PAGO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:USUARIO_PAGO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:USUARIO_PAGO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:IDSUBCUENTA, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:IDSUBCUENTA)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:DESCUENTO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:DESCUENTO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:SUCURSAL, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:SUCURSAL)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:IDRECIBO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:IDRECIBO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:CANTIDAD_CUOTAS, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:CANTIDAD_CUOTAS)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:SALDO_CUOTAS, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:SALDO_CUOTAS)) , 'CURSO_INSCRIPCION_DETALLE')
   END
   DbChangeTrigger.Update('CURSO_INSCRIPCION_DETALLE')
  RETURN ReturnValue


Hide:Access:CURSO_INSCRIPCION_DETALLE.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddThread('CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:IDINSCRIPCION, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:IDINSCRIPCION)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:IDCURSO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:IDCURSO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:ID_MODULO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:ID_MODULO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:FECHA_INSCRIPCION, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:FECHA_INSCRIPCION)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:PRESENTE, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:PRESENTE)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:NOTA, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:NOTA)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:MONTO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:MONTO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:PAGADO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:PAGADO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:FECHA_PAGO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:FECHA_PAGO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:HORA_PAGO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:HORA_PAGO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:USUARIO_PAGO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:USUARIO_PAGO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:IDSUBCUENTA, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:IDSUBCUENTA)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:DESCUENTO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:DESCUENTO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:SUCURSAL, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:SUCURSAL)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:IDRECIBO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:IDRECIBO)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:CANTIDAD_CUOTAS, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:CANTIDAD_CUOTAS)) , 'CURSO_INSCRIPCION_DETALLE')
      DbChangeTrigger.AddItem(CURD:SALDO_CUOTAS, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:SALDO_CUOTAS)) , 'CURSO_INSCRIPCION_DETALLE')
   END
   DbChangeTrigger.Update('CURSO_INSCRIPCION_DETALLE')
  RETURN ReturnValue


Hide:Access:CURSO_INSCRIPCION_DETALLE.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.CheckChanges('CURSO_INSCRIPCION_DETALLE',CURSO_INSCRIPCION_DETALLE) 
    END
  RETURN ReturnValue


Hide:Access:CURSO_INSCRIPCION_DETALLE.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CURSO_INSCRIPCION_DETALLE,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CURD:IDX_CURSO_DETALLE_CURSO,'CURD:IDX_CURSO_DETALLE_CURSO',0)
    SELF.AddKey(CURD:IDX_CURSO_DETALLE_MODULO,'CURD:IDX_CURSO_DETALLE_MODULO',0)
    SELF.AddKey(CURD:IDX_CURSO_DETALLE_PAGADO,'CURD:IDX_CURSO_DETALLE_PAGADO',0)
    SELF.AddKey(CURD:IDX_CURSO_DETALLE_SUBCTA,'CURD:IDX_CURSO_DETALLE_SUBCTA',0)
    SELF.AddKey(CURD:FK_CURSO_INSCRIPCION_DETALLE_IN,'CURD:FK_CURSO_INSCRIPCION_DETALLE_IN',0)
    SELF.AddKey(CURD:PK_CURSO_INSCRIPCION_DETALLE,'CURD:PK_CURSO_INSCRIPCION_DETALLE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CURSO_INSCRIPCION_DETALLE.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:CURSO_INSCRIPCION1 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('CURD:IDINSCRIPCION')
    Save:CURSO_INSCRIPCION1 = Access:CURSO_INSCRIPCION.SaveFile()
    CURI:IDINSCRIPCION = CURD:IDINSCRIPCION
    ReturnValue = Access:CURSO_INSCRIPCION.TryFetch(CURI:PK_CURSO_INSCRIPCION)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CURSO_INSCRIPCION')
      END
    END
    Access:CURSO_INSCRIPCION.RestoreFile(Save:CURSO_INSCRIPCION1)
  END
  RETURN ReturnValue


Hide:Relate:CURSO_INSCRIPCION_DETALLE.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CURSO_INSCRIPCION)

  SELF.AddRelation(Relate:CURSO_CUOTA,RI:None,RI:CASCADE,CUR1:FK_CURSO_CUOTA_DETALLE)
  SELF.AddRelationLink(CURD:IDINSCRIPCION,CUR1:IDINSCRIPCION)
  SELF.AddRelationLink(CURD:IDCURSO,CUR1:IDCURSO)
  SELF.AddRelationLink(CURD:ID_MODULO,CUR1:IDMODULO)

  SELF.AddRelation(Relate:CURSO_MODULOS)


Hide:Relate:CURSO_INSCRIPCION_DETALLE.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CURSO_INSCRIPCION_DETALLE',CURSO_INSCRIPCION_DETALLE)
  RETURN ReturnValue


Hide:Relate:CURSO_INSCRIPCION_DETALLE.Kill PROCEDURE

  CODE
  _Hide:Access:CURSO_INSCRIPCION_DETALLE.Kill              ! Kill the file manager
  PARENT.Kill
  Relate:CURSO_INSCRIPCION_DETALLE &= NULL                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CURSO_INSCRIPCION_DETALLE)          ! destroy the file manager


Hide:Relate:CURSO_INSCRIPCION_DETALLE.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddThread('CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:IDINSCRIPCION, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:IDINSCRIPCION)) , 'CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:IDCURSO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:IDCURSO)) , 'CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:ID_MODULO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:ID_MODULO)) , 'CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:FECHA_INSCRIPCION, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:FECHA_INSCRIPCION)) , 'CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:PRESENTE, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:PRESENTE)) , 'CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:NOTA, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:NOTA)) , 'CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:MONTO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:MONTO)) , 'CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:PAGADO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:PAGADO)) , 'CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:FECHA_PAGO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:FECHA_PAGO)) , 'CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:HORA_PAGO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:HORA_PAGO)) , 'CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:USUARIO_PAGO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:USUARIO_PAGO)) , 'CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:IDSUBCUENTA, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:IDSUBCUENTA)) , 'CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:DESCUENTO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:DESCUENTO)) , 'CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:SUCURSAL, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:SUCURSAL)) , 'CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:IDRECIBO, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:IDRECIBO)) , 'CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:CANTIDAD_CUOTAS, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:CANTIDAD_CUOTAS)) , 'CURSO_INSCRIPCION_DETALLE')
       DbChangeTrigger.AddItem(CURD:SALDO_CUOTAS, WHO(CURD:RECORD,WHERE(CURD:RECORD,CURD:SALDO_CUOTAS)) , 'CURSO_INSCRIPCION_DETALLE')
    END
    DbChangeTrigger.Update('CURSO_INSCRIPCION_DETALLE')


Hide:Relate:CURSO_INSCRIPCION_DETALLE.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CURSO_INSCRIPCION_DETALLE')
        DbChangeTrigger.CheckChanges('CURSO_INSCRIPCION_DETALLE',CURSO_INSCRIPCION_DETALLE) 
     END
  RETURN ReturnValue


Hide:Relate:CURSO_MODULOS.Init PROCEDURE()
  CODE
  _Hide:Access:CURSO_MODULOS.Init
  SELF.Init(Access:CURSO_MODULOS,1)


Hide:Access:CURSO_MODULOS.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CURSO_MODULOS')
      DbChangeTrigger.AddThread('CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:ID_MODULO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:ID_MODULO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:IDCURSO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:IDCURSO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:DESCRIPCION, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:DESCRIPCION)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:NUMERO_MODULO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:NUMERO_MODULO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:CANTIDAD_HORAS, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:CANTIDAD_HORAS)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:EXAMEN, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:EXAMEN)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:MONTO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:MONTO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:FECHA_INICIO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:FECHA_INICIO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:FECHA_FIN, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:FECHA_FIN)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:HORA_INICIO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:HORA_INICIO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:HORA_FIN, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:HORA_FIN)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:OBSERVACION, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:OBSERVACION)) , 'CURSO_MODULOS')
   END
   DbChangeTrigger.Update('CURSO_MODULOS')
  RETURN ReturnValue


Hide:Access:CURSO_MODULOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CUR2:Record
  SELF.FileNameValue = 'CURSO_MODULOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CURSO_MODULOS
  PARENT.Init
  Access:CURSO_MODULOS &= SELF


Hide:Access:CURSO_MODULOS.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CURSO_MODULOS',CURSO_MODULOS)
  RETURN ReturnValue


Hide:Access:CURSO_MODULOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CURSO_MODULOS &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CURSO_MODULOS.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CURSO_MODULOS')
      DbChangeTrigger.AddThread('CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:ID_MODULO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:ID_MODULO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:IDCURSO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:IDCURSO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:DESCRIPCION, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:DESCRIPCION)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:NUMERO_MODULO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:NUMERO_MODULO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:CANTIDAD_HORAS, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:CANTIDAD_HORAS)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:EXAMEN, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:EXAMEN)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:MONTO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:MONTO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:FECHA_INICIO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:FECHA_INICIO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:FECHA_FIN, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:FECHA_FIN)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:HORA_INICIO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:HORA_INICIO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:HORA_FIN, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:HORA_FIN)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:OBSERVACION, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:OBSERVACION)) , 'CURSO_MODULOS')
   END
   DbChangeTrigger.Update('CURSO_MODULOS')
  RETURN ReturnValue


Hide:Access:CURSO_MODULOS.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CURSO_MODULOS')
      DbChangeTrigger.AddThread('CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:ID_MODULO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:ID_MODULO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:IDCURSO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:IDCURSO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:DESCRIPCION, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:DESCRIPCION)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:NUMERO_MODULO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:NUMERO_MODULO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:CANTIDAD_HORAS, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:CANTIDAD_HORAS)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:EXAMEN, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:EXAMEN)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:MONTO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:MONTO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:FECHA_INICIO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:FECHA_INICIO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:FECHA_FIN, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:FECHA_FIN)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:HORA_INICIO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:HORA_INICIO)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:HORA_FIN, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:HORA_FIN)) , 'CURSO_MODULOS')
      DbChangeTrigger.AddItem(CUR2:OBSERVACION, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:OBSERVACION)) , 'CURSO_MODULOS')
   END
   DbChangeTrigger.Update('CURSO_MODULOS')
  RETURN ReturnValue


Hide:Access:CURSO_MODULOS.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CURSO_MODULOS')
       DbChangeTrigger.CheckChanges('CURSO_MODULOS',CURSO_MODULOS) 
    END
  RETURN ReturnValue


Hide:Access:CURSO_MODULOS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CURSO_MODULOS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CUR2:CURSO_MODULOS_DESCRIPCION,'CUR2:CURSO_MODULOS_DESCRIPCION',0)
    SELF.AddKey(CUR2:IDX_CONTROL,'CUR2:IDX_CONTROL',0)
    SELF.AddKey(CUR2:IDX_MODULO_NUMERO,'CUR2:IDX_MODULO_NUMERO',0)
    SELF.AddKey(CUR2:FK_CURSO_MODULOS_CURSO,'CUR2:FK_CURSO_MODULOS_CURSO',0)
    SELF.AddKey(CUR2:IDX_MODULO_UNIQUE,'CUR2:IDX_MODULO_UNIQUE',0)
    SELF.AddKey(CUR2:PK_CURSO_MODULOS,'CUR2:PK_CURSO_MODULOS',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CURSO_MODULOS.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:CURSO2        USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('CUR2:IDCURSO')
    Save:CURSO2 = Access:CURSO.SaveFile()
    CUR:IDCURSO = CUR2:IDCURSO
    ReturnValue = Access:CURSO.TryFetch(CUR:PK_CURSO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CURSO')
      END
    END
    Access:CURSO.RestoreFile(Save:CURSO2)
  END
  RETURN ReturnValue


Hide:Relate:CURSO_MODULOS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CURSO)

  SELF.AddRelation(Relate:CURSO_INSCRIPCION_DETALLE,RI:None,RI:None,CURD:IDX_CURSO_DETALLE_MODULO)
  SELF.AddRelationLink(CUR2:ID_MODULO,CURD:ID_MODULO)


Hide:Relate:CURSO_MODULOS.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CURSO_MODULOS',CURSO_MODULOS)
  RETURN ReturnValue


Hide:Relate:CURSO_MODULOS.Kill PROCEDURE

  CODE
  _Hide:Access:CURSO_MODULOS.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:CURSO_MODULOS &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CURSO_MODULOS)                      ! destroy the file manager


Hide:Relate:CURSO_MODULOS.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CURSO_MODULOS')
       DbChangeTrigger.AddThread('CURSO_MODULOS')
       DbChangeTrigger.AddItem(CUR2:ID_MODULO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:ID_MODULO)) , 'CURSO_MODULOS')
       DbChangeTrigger.AddItem(CUR2:IDCURSO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:IDCURSO)) , 'CURSO_MODULOS')
       DbChangeTrigger.AddItem(CUR2:DESCRIPCION, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:DESCRIPCION)) , 'CURSO_MODULOS')
       DbChangeTrigger.AddItem(CUR2:NUMERO_MODULO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:NUMERO_MODULO)) , 'CURSO_MODULOS')
       DbChangeTrigger.AddItem(CUR2:CANTIDAD_HORAS, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:CANTIDAD_HORAS)) , 'CURSO_MODULOS')
       DbChangeTrigger.AddItem(CUR2:EXAMEN, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:EXAMEN)) , 'CURSO_MODULOS')
       DbChangeTrigger.AddItem(CUR2:MONTO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:MONTO)) , 'CURSO_MODULOS')
       DbChangeTrigger.AddItem(CUR2:FECHA_INICIO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:FECHA_INICIO)) , 'CURSO_MODULOS')
       DbChangeTrigger.AddItem(CUR2:FECHA_FIN, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:FECHA_FIN)) , 'CURSO_MODULOS')
       DbChangeTrigger.AddItem(CUR2:HORA_INICIO, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:HORA_INICIO)) , 'CURSO_MODULOS')
       DbChangeTrigger.AddItem(CUR2:HORA_FIN, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:HORA_FIN)) , 'CURSO_MODULOS')
       DbChangeTrigger.AddItem(CUR2:OBSERVACION, WHO(CUR2:RECORD,WHERE(CUR2:RECORD,CUR2:OBSERVACION)) , 'CURSO_MODULOS')
    END
    DbChangeTrigger.Update('CURSO_MODULOS')


Hide:Relate:CURSO_MODULOS.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CURSO_MODULOS')
        DbChangeTrigger.CheckChanges('CURSO_MODULOS',CURSO_MODULOS) 
     END
  RETURN ReturnValue


Hide:Relate:ME.Init PROCEDURE()
  CODE
  _Hide:Access:ME.Init
  SELF.Init(Access:ME,1)


Hide:Access:ME.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('ME')
      DbChangeTrigger.AddThread('ME')
      DbChangeTrigger.AddItem(ME:ME, WHO(ME:RECORD,WHERE(ME:RECORD,ME:ME)) , 'ME')
      DbChangeTrigger.AddItem(ME:FECHA, WHO(ME:RECORD,WHERE(ME:RECORD,ME:FECHA)) , 'ME')
      DbChangeTrigger.AddItem(ME:NUMERO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:NUMERO)) , 'ME')
      DbChangeTrigger.AddItem(ME:ORIGEN, WHO(ME:RECORD,WHERE(ME:RECORD,ME:ORIGEN)) , 'ME')
      DbChangeTrigger.AddItem(ME:CONTENIDO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:CONTENIDO)) , 'ME')
      DbChangeTrigger.AddItem(ME:ACTIVO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:ACTIVO)) , 'ME')
      DbChangeTrigger.AddItem(ME:IDESTADO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:IDESTADO)) , 'ME')
      DbChangeTrigger.AddItem(ME:IDDPTO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:IDDPTO)) , 'ME')
      DbChangeTrigger.AddItem(ME:IDTIPO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:IDTIPO)) , 'ME')
      DbChangeTrigger.AddItem(ME:IDUSUARIO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:IDUSUARIO)) , 'ME')
      DbChangeTrigger.AddItem(ME:HORA, WHO(ME:RECORD,WHERE(ME:RECORD,ME:HORA)) , 'ME')
   END
   DbChangeTrigger.Update('ME')
  RETURN ReturnValue


Hide:Access:ME.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ME:Record
  SELF.FileNameValue = 'ME'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ME
  PARENT.Init
  Access:ME &= SELF


Hide:Access:ME.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('ME',ME)
  RETURN ReturnValue


Hide:Access:ME.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ME &= NULL                                        ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ME.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('ME')
      DbChangeTrigger.AddThread('ME')
      DbChangeTrigger.AddItem(ME:ME, WHO(ME:RECORD,WHERE(ME:RECORD,ME:ME)) , 'ME')
      DbChangeTrigger.AddItem(ME:FECHA, WHO(ME:RECORD,WHERE(ME:RECORD,ME:FECHA)) , 'ME')
      DbChangeTrigger.AddItem(ME:NUMERO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:NUMERO)) , 'ME')
      DbChangeTrigger.AddItem(ME:ORIGEN, WHO(ME:RECORD,WHERE(ME:RECORD,ME:ORIGEN)) , 'ME')
      DbChangeTrigger.AddItem(ME:CONTENIDO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:CONTENIDO)) , 'ME')
      DbChangeTrigger.AddItem(ME:ACTIVO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:ACTIVO)) , 'ME')
      DbChangeTrigger.AddItem(ME:IDESTADO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:IDESTADO)) , 'ME')
      DbChangeTrigger.AddItem(ME:IDDPTO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:IDDPTO)) , 'ME')
      DbChangeTrigger.AddItem(ME:IDTIPO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:IDTIPO)) , 'ME')
      DbChangeTrigger.AddItem(ME:IDUSUARIO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:IDUSUARIO)) , 'ME')
      DbChangeTrigger.AddItem(ME:HORA, WHO(ME:RECORD,WHERE(ME:RECORD,ME:HORA)) , 'ME')
   END
   DbChangeTrigger.Update('ME')
  RETURN ReturnValue


Hide:Access:ME.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('ME')
      DbChangeTrigger.AddThread('ME')
      DbChangeTrigger.AddItem(ME:ME, WHO(ME:RECORD,WHERE(ME:RECORD,ME:ME)) , 'ME')
      DbChangeTrigger.AddItem(ME:FECHA, WHO(ME:RECORD,WHERE(ME:RECORD,ME:FECHA)) , 'ME')
      DbChangeTrigger.AddItem(ME:NUMERO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:NUMERO)) , 'ME')
      DbChangeTrigger.AddItem(ME:ORIGEN, WHO(ME:RECORD,WHERE(ME:RECORD,ME:ORIGEN)) , 'ME')
      DbChangeTrigger.AddItem(ME:CONTENIDO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:CONTENIDO)) , 'ME')
      DbChangeTrigger.AddItem(ME:ACTIVO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:ACTIVO)) , 'ME')
      DbChangeTrigger.AddItem(ME:IDESTADO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:IDESTADO)) , 'ME')
      DbChangeTrigger.AddItem(ME:IDDPTO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:IDDPTO)) , 'ME')
      DbChangeTrigger.AddItem(ME:IDTIPO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:IDTIPO)) , 'ME')
      DbChangeTrigger.AddItem(ME:IDUSUARIO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:IDUSUARIO)) , 'ME')
      DbChangeTrigger.AddItem(ME:HORA, WHO(ME:RECORD,WHERE(ME:RECORD,ME:HORA)) , 'ME')
   END
   DbChangeTrigger.Update('ME')
  RETURN ReturnValue


Hide:Access:ME.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('ME')
       DbChangeTrigger.CheckChanges('ME',ME) 
    END
  RETURN ReturnValue


Hide:Access:ME.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ME,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(ME:IDX_ME_FECHAi,'ME:IDX_ME_FECHAi',0)
    SELF.AddKey(ME:IDX_ME_ORIGEN,'ME:IDX_ME_ORIGEN',0)
    SELF.AddKey(ME:FK_ME_DPTO,'ME:FK_ME_DPTO',0)
    SELF.AddKey(ME:FK_ME_ESTADO,'ME:FK_ME_ESTADO',0)
    SELF.AddKey(ME:FK_ME_TIPO,'ME:FK_ME_TIPO',0)
    SELF.AddKey(ME:FK_ME_USUARIO,'ME:FK_ME_USUARIO',0)
    SELF.AddKey(ME:PK_ME,'ME:PK_ME',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:ME.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:MEESTADO7     USHORT,AUTO
Save:MEDPTO8       USHORT,AUTO
Save:METIPO9       USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 7
    GlobalErrors.SetField('ME:IDESTADO')
    Save:MEESTADO7 = Access:MEESTADO.SaveFile()
    MEE:IDESTADO = ME:IDESTADO
    ReturnValue = Access:MEESTADO.TryFetch(MEE:PK_MEESTADO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'MEESTADO')
      END
    END
    Access:MEESTADO.RestoreFile(Save:MEESTADO7)
  OF 8
    GlobalErrors.SetField('ME:IDDPTO')
    Save:MEDPTO8 = Access:MEDPTO.SaveFile()
    MED:IDDPTO = ME:IDDPTO
    ReturnValue = Access:MEDPTO.TryFetch(MED:PK_MEDPTO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'MEDPTO')
      END
    END
    Access:MEDPTO.RestoreFile(Save:MEDPTO8)
  OF 9
    GlobalErrors.SetField('ME:IDTIPO')
    Save:METIPO9 = Access:METIPO.SaveFile()
    MET:IDTIPO = ME:IDTIPO
    ReturnValue = Access:METIPO.TryFetch(MET:PK_METIPO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'METIPO')
      END
    END
    Access:METIPO.RestoreFile(Save:METIPO9)
  END
  RETURN ReturnValue


Hide:Relate:ME.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:MEPASES,RI:None,RI:None,MEP:IDX_MEPASES_ME)
  SELF.AddRelationLink(ME:IDUSUARIO,MEP:IDME)

  SELF.AddRelation(Relate:MS,RI:None,RI:None,MS:IDX_MS_NUMERO)
  SELF.AddRelationLink(ME:ME,MS:NUMERO)

  SELF.AddRelation(Relate:USUARIO)

  SELF.AddRelation(Relate:MEDPTO)

  SELF.AddRelation(Relate:MEESTADO)

  SELF.AddRelation(Relate:METIPO)


Hide:Relate:ME.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('ME',ME)
  RETURN ReturnValue


Hide:Relate:ME.Kill PROCEDURE

  CODE
  _Hide:Access:ME.Kill                                     ! Kill the file manager
  PARENT.Kill
  Relate:ME &= NULL                                        ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ME)                                 ! destroy the file manager


Hide:Relate:ME.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('ME')
       DbChangeTrigger.AddThread('ME')
       DbChangeTrigger.AddItem(ME:ME, WHO(ME:RECORD,WHERE(ME:RECORD,ME:ME)) , 'ME')
       DbChangeTrigger.AddItem(ME:FECHA, WHO(ME:RECORD,WHERE(ME:RECORD,ME:FECHA)) , 'ME')
       DbChangeTrigger.AddItem(ME:NUMERO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:NUMERO)) , 'ME')
       DbChangeTrigger.AddItem(ME:ORIGEN, WHO(ME:RECORD,WHERE(ME:RECORD,ME:ORIGEN)) , 'ME')
       DbChangeTrigger.AddItem(ME:CONTENIDO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:CONTENIDO)) , 'ME')
       DbChangeTrigger.AddItem(ME:ACTIVO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:ACTIVO)) , 'ME')
       DbChangeTrigger.AddItem(ME:IDESTADO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:IDESTADO)) , 'ME')
       DbChangeTrigger.AddItem(ME:IDDPTO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:IDDPTO)) , 'ME')
       DbChangeTrigger.AddItem(ME:IDTIPO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:IDTIPO)) , 'ME')
       DbChangeTrigger.AddItem(ME:IDUSUARIO, WHO(ME:RECORD,WHERE(ME:RECORD,ME:IDUSUARIO)) , 'ME')
       DbChangeTrigger.AddItem(ME:HORA, WHO(ME:RECORD,WHERE(ME:RECORD,ME:HORA)) , 'ME')
    END
    DbChangeTrigger.Update('ME')


Hide:Relate:ME.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('ME')
        DbChangeTrigger.CheckChanges('ME',ME) 
     END
  RETURN ReturnValue


Hide:Relate:MEDPTO.Init PROCEDURE()
  CODE
  _Hide:Access:MEDPTO.Init
  SELF.Init(Access:MEDPTO,1)


Hide:Access:MEDPTO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('MEDPTO')
      DbChangeTrigger.AddThread('MEDPTO')
      DbChangeTrigger.AddItem(MED:IDDPTO, WHO(MED:RECORD,WHERE(MED:RECORD,MED:IDDPTO)) , 'MEDPTO')
      DbChangeTrigger.AddItem(MED:DESCRIPCION, WHO(MED:RECORD,WHERE(MED:RECORD,MED:DESCRIPCION)) , 'MEDPTO')
   END
   DbChangeTrigger.Update('MEDPTO')
  RETURN ReturnValue


Hide:Access:MEDPTO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MED:Record
  SELF.FileNameValue = 'MEDPTO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= MEDPTO
  PARENT.Init
  Access:MEDPTO &= SELF


Hide:Access:MEDPTO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('MEDPTO',MEDPTO)
  RETURN ReturnValue


Hide:Access:MEDPTO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:MEDPTO &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:MEDPTO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('MEDPTO')
      DbChangeTrigger.AddThread('MEDPTO')
      DbChangeTrigger.AddItem(MED:IDDPTO, WHO(MED:RECORD,WHERE(MED:RECORD,MED:IDDPTO)) , 'MEDPTO')
      DbChangeTrigger.AddItem(MED:DESCRIPCION, WHO(MED:RECORD,WHERE(MED:RECORD,MED:DESCRIPCION)) , 'MEDPTO')
   END
   DbChangeTrigger.Update('MEDPTO')
  RETURN ReturnValue


Hide:Access:MEDPTO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('MEDPTO')
      DbChangeTrigger.AddThread('MEDPTO')
      DbChangeTrigger.AddItem(MED:IDDPTO, WHO(MED:RECORD,WHERE(MED:RECORD,MED:IDDPTO)) , 'MEDPTO')
      DbChangeTrigger.AddItem(MED:DESCRIPCION, WHO(MED:RECORD,WHERE(MED:RECORD,MED:DESCRIPCION)) , 'MEDPTO')
   END
   DbChangeTrigger.Update('MEDPTO')
  RETURN ReturnValue


Hide:Access:MEDPTO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('MEDPTO')
       DbChangeTrigger.CheckChanges('MEDPTO',MEDPTO) 
    END
  RETURN ReturnValue


Hide:Access:MEDPTO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(MEDPTO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(MED:IDX_MEDPTO_DECRIP,'MED:IDX_MEDPTO_DECRIP',0)
    SELF.AddKey(MED:PK_MEDPTO,'MED:PK_MEDPTO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:MEDPTO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ME,RI:None,RI:None,ME:FK_ME_DPTO)
  SELF.AddRelationLink(MED:IDDPTO,ME:IDDPTO)

  SELF.AddRelation(Relate:MS,RI:None,RI:None,MS:FK_MS_DPTO)
  SELF.AddRelationLink(MED:IDDPTO,MS:IDDPTO)


Hide:Relate:MEDPTO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('MEDPTO',MEDPTO)
  RETURN ReturnValue


Hide:Relate:MEDPTO.Kill PROCEDURE

  CODE
  _Hide:Access:MEDPTO.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:MEDPTO &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:MEDPTO)                             ! destroy the file manager


Hide:Relate:MEDPTO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('MEDPTO')
       DbChangeTrigger.AddThread('MEDPTO')
       DbChangeTrigger.AddItem(MED:IDDPTO, WHO(MED:RECORD,WHERE(MED:RECORD,MED:IDDPTO)) , 'MEDPTO')
       DbChangeTrigger.AddItem(MED:DESCRIPCION, WHO(MED:RECORD,WHERE(MED:RECORD,MED:DESCRIPCION)) , 'MEDPTO')
    END
    DbChangeTrigger.Update('MEDPTO')


Hide:Relate:MEDPTO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('MEDPTO')
        DbChangeTrigger.CheckChanges('MEDPTO',MEDPTO) 
     END
  RETURN ReturnValue


Hide:Relate:MEESTADO.Init PROCEDURE()
  CODE
  _Hide:Access:MEESTADO.Init
  SELF.Init(Access:MEESTADO,1)


Hide:Access:MEESTADO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('MEESTADO')
      DbChangeTrigger.AddThread('MEESTADO')
      DbChangeTrigger.AddItem(MEE:IDESTADO, WHO(MEE:RECORD,WHERE(MEE:RECORD,MEE:IDESTADO)) , 'MEESTADO')
      DbChangeTrigger.AddItem(MEE:DESCRIPCION, WHO(MEE:RECORD,WHERE(MEE:RECORD,MEE:DESCRIPCION)) , 'MEESTADO')
   END
   DbChangeTrigger.Update('MEESTADO')
  RETURN ReturnValue


Hide:Access:MEESTADO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MEE:Record
  SELF.FileNameValue = 'MEESTADO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= MEESTADO
  PARENT.Init
  Access:MEESTADO &= SELF


Hide:Access:MEESTADO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('MEESTADO',MEESTADO)
  RETURN ReturnValue


Hide:Access:MEESTADO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:MEESTADO &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:MEESTADO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('MEESTADO')
      DbChangeTrigger.AddThread('MEESTADO')
      DbChangeTrigger.AddItem(MEE:IDESTADO, WHO(MEE:RECORD,WHERE(MEE:RECORD,MEE:IDESTADO)) , 'MEESTADO')
      DbChangeTrigger.AddItem(MEE:DESCRIPCION, WHO(MEE:RECORD,WHERE(MEE:RECORD,MEE:DESCRIPCION)) , 'MEESTADO')
   END
   DbChangeTrigger.Update('MEESTADO')
  RETURN ReturnValue


Hide:Access:MEESTADO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('MEESTADO')
      DbChangeTrigger.AddThread('MEESTADO')
      DbChangeTrigger.AddItem(MEE:IDESTADO, WHO(MEE:RECORD,WHERE(MEE:RECORD,MEE:IDESTADO)) , 'MEESTADO')
      DbChangeTrigger.AddItem(MEE:DESCRIPCION, WHO(MEE:RECORD,WHERE(MEE:RECORD,MEE:DESCRIPCION)) , 'MEESTADO')
   END
   DbChangeTrigger.Update('MEESTADO')
  RETURN ReturnValue


Hide:Access:MEESTADO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('MEESTADO')
       DbChangeTrigger.CheckChanges('MEESTADO',MEESTADO) 
    END
  RETURN ReturnValue


Hide:Access:MEESTADO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(MEESTADO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(MEE:IDX_MEESTADO_DESCRIP,'MEE:IDX_MEESTADO_DESCRIP',0)
    SELF.AddKey(MEE:PK_MEESTADO,'MEE:PK_MEESTADO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:MEESTADO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ME,RI:None,RI:None,ME:FK_ME_ESTADO)
  SELF.AddRelationLink(MEE:IDESTADO,ME:IDESTADO)

  SELF.AddRelation(Relate:MS,RI:None,RI:None,MS:FK_MS_ESTADO)
  SELF.AddRelationLink(MEE:IDESTADO,MS:IDESTADO)


Hide:Relate:MEESTADO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('MEESTADO',MEESTADO)
  RETURN ReturnValue


Hide:Relate:MEESTADO.Kill PROCEDURE

  CODE
  _Hide:Access:MEESTADO.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:MEESTADO &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:MEESTADO)                           ! destroy the file manager


Hide:Relate:MEESTADO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('MEESTADO')
       DbChangeTrigger.AddThread('MEESTADO')
       DbChangeTrigger.AddItem(MEE:IDESTADO, WHO(MEE:RECORD,WHERE(MEE:RECORD,MEE:IDESTADO)) , 'MEESTADO')
       DbChangeTrigger.AddItem(MEE:DESCRIPCION, WHO(MEE:RECORD,WHERE(MEE:RECORD,MEE:DESCRIPCION)) , 'MEESTADO')
    END
    DbChangeTrigger.Update('MEESTADO')


Hide:Relate:MEESTADO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('MEESTADO')
        DbChangeTrigger.CheckChanges('MEESTADO',MEESTADO) 
     END
  RETURN ReturnValue


Hide:Relate:MEPASES.Init PROCEDURE()
  CODE
  _Hide:Access:MEPASES.Init
  SELF.Init(Access:MEPASES,1)


Hide:Access:MEPASES.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('MEPASES')
      DbChangeTrigger.AddThread('MEPASES')
      DbChangeTrigger.AddItem(MEP:IDME, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:IDME)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:DPTO_ORIGEN, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:DPTO_ORIGEN)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:DPTO_DESTINO, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:DPTO_DESTINO)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:MOTIVO, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:MOTIVO)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:IDUSUARIO, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:IDUSUARIO)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:FECHA, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:FECHA)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:HORA, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:HORA)) , 'MEPASES')
   END
   DbChangeTrigger.Update('MEPASES')
  RETURN ReturnValue


Hide:Access:MEPASES.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MEP:Record
  SELF.FileNameValue = 'MEPASES'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= MEPASES
  PARENT.Init
  Access:MEPASES &= SELF


Hide:Access:MEPASES.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('MEPASES',MEPASES)
  RETURN ReturnValue


Hide:Access:MEPASES.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:MEPASES &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:MEPASES.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('MEPASES')
      DbChangeTrigger.AddThread('MEPASES')
      DbChangeTrigger.AddItem(MEP:IDME, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:IDME)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:DPTO_ORIGEN, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:DPTO_ORIGEN)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:DPTO_DESTINO, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:DPTO_DESTINO)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:MOTIVO, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:MOTIVO)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:IDUSUARIO, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:IDUSUARIO)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:FECHA, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:FECHA)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:HORA, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:HORA)) , 'MEPASES')
   END
   DbChangeTrigger.Update('MEPASES')
  RETURN ReturnValue


Hide:Access:MEPASES.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('MEPASES')
      DbChangeTrigger.AddThread('MEPASES')
      DbChangeTrigger.AddItem(MEP:IDME, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:IDME)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:DPTO_ORIGEN, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:DPTO_ORIGEN)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:DPTO_DESTINO, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:DPTO_DESTINO)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:MOTIVO, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:MOTIVO)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:IDUSUARIO, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:IDUSUARIO)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:FECHA, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:FECHA)) , 'MEPASES')
      DbChangeTrigger.AddItem(MEP:HORA, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:HORA)) , 'MEPASES')
   END
   DbChangeTrigger.Update('MEPASES')
  RETURN ReturnValue


Hide:Access:MEPASES.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('MEPASES')
       DbChangeTrigger.CheckChanges('MEPASES',MEPASES) 
    END
  RETURN ReturnValue


Hide:Access:MEPASES.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(MEPASES,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(MEP:IDX_MEPASES_DESTINO,'MEP:IDX_MEPASES_DESTINO',0)
    SELF.AddKey(MEP:IDX_MEPASES_ORIGEN,'MEP:IDX_MEPASES_ORIGEN',0)
    SELF.AddKey(MEP:PK_MEPASES,'MEP:PK_MEPASES',0)
    SELF.AddKey(MEP:IDX_MEPASES_ME,'MEP:IDX_MEPASES_ME',0)
    SELF.AddKey(MEP:IDX_MEPASES_FECHA,'MEP:IDX_MEPASES_FECHA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:MEPASES.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ME)


Hide:Relate:MEPASES.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('MEPASES',MEPASES)
  RETURN ReturnValue


Hide:Relate:MEPASES.Kill PROCEDURE

  CODE
  _Hide:Access:MEPASES.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:MEPASES &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:MEPASES)                            ! destroy the file manager


Hide:Relate:MEPASES.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('MEPASES')
       DbChangeTrigger.AddThread('MEPASES')
       DbChangeTrigger.AddItem(MEP:IDME, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:IDME)) , 'MEPASES')
       DbChangeTrigger.AddItem(MEP:DPTO_ORIGEN, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:DPTO_ORIGEN)) , 'MEPASES')
       DbChangeTrigger.AddItem(MEP:DPTO_DESTINO, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:DPTO_DESTINO)) , 'MEPASES')
       DbChangeTrigger.AddItem(MEP:MOTIVO, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:MOTIVO)) , 'MEPASES')
       DbChangeTrigger.AddItem(MEP:IDUSUARIO, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:IDUSUARIO)) , 'MEPASES')
       DbChangeTrigger.AddItem(MEP:FECHA, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:FECHA)) , 'MEPASES')
       DbChangeTrigger.AddItem(MEP:HORA, WHO(MEP:RECORD,WHERE(MEP:RECORD,MEP:HORA)) , 'MEPASES')
    END
    DbChangeTrigger.Update('MEPASES')


Hide:Relate:MEPASES.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('MEPASES')
        DbChangeTrigger.CheckChanges('MEPASES',MEPASES) 
     END
  RETURN ReturnValue


Hide:Relate:METIPO.Init PROCEDURE()
  CODE
  _Hide:Access:METIPO.Init
  SELF.Init(Access:METIPO,1)


Hide:Access:METIPO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('METIPO')
      DbChangeTrigger.AddThread('METIPO')
      DbChangeTrigger.AddItem(MET:IDTIPO, WHO(MET:RECORD,WHERE(MET:RECORD,MET:IDTIPO)) , 'METIPO')
      DbChangeTrigger.AddItem(MET:DESCRIPCION, WHO(MET:RECORD,WHERE(MET:RECORD,MET:DESCRIPCION)) , 'METIPO')
   END
   DbChangeTrigger.Update('METIPO')
  RETURN ReturnValue


Hide:Access:METIPO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MET:Record
  SELF.FileNameValue = 'METIPO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= METIPO
  PARENT.Init
  Access:METIPO &= SELF


Hide:Access:METIPO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('METIPO',METIPO)
  RETURN ReturnValue


Hide:Access:METIPO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:METIPO &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:METIPO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('METIPO')
      DbChangeTrigger.AddThread('METIPO')
      DbChangeTrigger.AddItem(MET:IDTIPO, WHO(MET:RECORD,WHERE(MET:RECORD,MET:IDTIPO)) , 'METIPO')
      DbChangeTrigger.AddItem(MET:DESCRIPCION, WHO(MET:RECORD,WHERE(MET:RECORD,MET:DESCRIPCION)) , 'METIPO')
   END
   DbChangeTrigger.Update('METIPO')
  RETURN ReturnValue


Hide:Access:METIPO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('METIPO')
      DbChangeTrigger.AddThread('METIPO')
      DbChangeTrigger.AddItem(MET:IDTIPO, WHO(MET:RECORD,WHERE(MET:RECORD,MET:IDTIPO)) , 'METIPO')
      DbChangeTrigger.AddItem(MET:DESCRIPCION, WHO(MET:RECORD,WHERE(MET:RECORD,MET:DESCRIPCION)) , 'METIPO')
   END
   DbChangeTrigger.Update('METIPO')
  RETURN ReturnValue


Hide:Access:METIPO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('METIPO')
       DbChangeTrigger.CheckChanges('METIPO',METIPO) 
    END
  RETURN ReturnValue


Hide:Access:METIPO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(METIPO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(MET:IDX_METIPO_DESCRIP,'MET:IDX_METIPO_DESCRIP',0)
    SELF.AddKey(MET:PK_METIPO,'MET:PK_METIPO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:METIPO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ME,RI:None,RI:None,ME:FK_ME_TIPO)
  SELF.AddRelationLink(MET:IDTIPO,ME:IDTIPO)

  SELF.AddRelation(Relate:MS,RI:None,RI:None,MS:FK_MS_TIPO)
  SELF.AddRelationLink(MET:IDTIPO,MS:IDTIPO)


Hide:Relate:METIPO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('METIPO',METIPO)
  RETURN ReturnValue


Hide:Relate:METIPO.Kill PROCEDURE

  CODE
  _Hide:Access:METIPO.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:METIPO &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:METIPO)                             ! destroy the file manager


Hide:Relate:METIPO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('METIPO')
       DbChangeTrigger.AddThread('METIPO')
       DbChangeTrigger.AddItem(MET:IDTIPO, WHO(MET:RECORD,WHERE(MET:RECORD,MET:IDTIPO)) , 'METIPO')
       DbChangeTrigger.AddItem(MET:DESCRIPCION, WHO(MET:RECORD,WHERE(MET:RECORD,MET:DESCRIPCION)) , 'METIPO')
    END
    DbChangeTrigger.Update('METIPO')


Hide:Relate:METIPO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('METIPO')
        DbChangeTrigger.CheckChanges('METIPO',METIPO) 
     END
  RETURN ReturnValue


Hide:Relate:MS.Init PROCEDURE()
  CODE
  _Hide:Access:MS.Init
  SELF.Init(Access:MS,1)


Hide:Access:MS.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('MS')
      DbChangeTrigger.AddThread('MS')
      DbChangeTrigger.AddItem(MS:MS, WHO(MS:RECORD,WHERE(MS:RECORD,MS:MS)) , 'MS')
      DbChangeTrigger.AddItem(MS:FECHA, WHO(MS:RECORD,WHERE(MS:RECORD,MS:FECHA)) , 'MS')
      DbChangeTrigger.AddItem(MS:NUMERO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:NUMERO)) , 'MS')
      DbChangeTrigger.AddItem(MS:ORIGEN, WHO(MS:RECORD,WHERE(MS:RECORD,MS:ORIGEN)) , 'MS')
      DbChangeTrigger.AddItem(MS:CONTENIDO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:CONTENIDO)) , 'MS')
      DbChangeTrigger.AddItem(MS:ACTIVO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:ACTIVO)) , 'MS')
      DbChangeTrigger.AddItem(MS:IDESTADO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:IDESTADO)) , 'MS')
      DbChangeTrigger.AddItem(MS:IDDPTO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:IDDPTO)) , 'MS')
      DbChangeTrigger.AddItem(MS:IDTIPO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:IDTIPO)) , 'MS')
      DbChangeTrigger.AddItem(MS:IDUSUARIO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:IDUSUARIO)) , 'MS')
      DbChangeTrigger.AddItem(MS:HORA, WHO(MS:RECORD,WHERE(MS:RECORD,MS:HORA)) , 'MS')
   END
   DbChangeTrigger.Update('MS')
  RETURN ReturnValue


Hide:Access:MS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MS:Record
  SELF.FileNameValue = 'MS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= MS
  PARENT.Init
  Access:MS &= SELF


Hide:Access:MS.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('MS',MS)
  RETURN ReturnValue


Hide:Access:MS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:MS &= NULL                                        ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:MS.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('MS')
      DbChangeTrigger.AddThread('MS')
      DbChangeTrigger.AddItem(MS:MS, WHO(MS:RECORD,WHERE(MS:RECORD,MS:MS)) , 'MS')
      DbChangeTrigger.AddItem(MS:FECHA, WHO(MS:RECORD,WHERE(MS:RECORD,MS:FECHA)) , 'MS')
      DbChangeTrigger.AddItem(MS:NUMERO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:NUMERO)) , 'MS')
      DbChangeTrigger.AddItem(MS:ORIGEN, WHO(MS:RECORD,WHERE(MS:RECORD,MS:ORIGEN)) , 'MS')
      DbChangeTrigger.AddItem(MS:CONTENIDO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:CONTENIDO)) , 'MS')
      DbChangeTrigger.AddItem(MS:ACTIVO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:ACTIVO)) , 'MS')
      DbChangeTrigger.AddItem(MS:IDESTADO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:IDESTADO)) , 'MS')
      DbChangeTrigger.AddItem(MS:IDDPTO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:IDDPTO)) , 'MS')
      DbChangeTrigger.AddItem(MS:IDTIPO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:IDTIPO)) , 'MS')
      DbChangeTrigger.AddItem(MS:IDUSUARIO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:IDUSUARIO)) , 'MS')
      DbChangeTrigger.AddItem(MS:HORA, WHO(MS:RECORD,WHERE(MS:RECORD,MS:HORA)) , 'MS')
   END
   DbChangeTrigger.Update('MS')
  RETURN ReturnValue


Hide:Access:MS.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('MS')
      DbChangeTrigger.AddThread('MS')
      DbChangeTrigger.AddItem(MS:MS, WHO(MS:RECORD,WHERE(MS:RECORD,MS:MS)) , 'MS')
      DbChangeTrigger.AddItem(MS:FECHA, WHO(MS:RECORD,WHERE(MS:RECORD,MS:FECHA)) , 'MS')
      DbChangeTrigger.AddItem(MS:NUMERO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:NUMERO)) , 'MS')
      DbChangeTrigger.AddItem(MS:ORIGEN, WHO(MS:RECORD,WHERE(MS:RECORD,MS:ORIGEN)) , 'MS')
      DbChangeTrigger.AddItem(MS:CONTENIDO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:CONTENIDO)) , 'MS')
      DbChangeTrigger.AddItem(MS:ACTIVO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:ACTIVO)) , 'MS')
      DbChangeTrigger.AddItem(MS:IDESTADO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:IDESTADO)) , 'MS')
      DbChangeTrigger.AddItem(MS:IDDPTO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:IDDPTO)) , 'MS')
      DbChangeTrigger.AddItem(MS:IDTIPO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:IDTIPO)) , 'MS')
      DbChangeTrigger.AddItem(MS:IDUSUARIO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:IDUSUARIO)) , 'MS')
      DbChangeTrigger.AddItem(MS:HORA, WHO(MS:RECORD,WHERE(MS:RECORD,MS:HORA)) , 'MS')
   END
   DbChangeTrigger.Update('MS')
  RETURN ReturnValue


Hide:Access:MS.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('MS')
       DbChangeTrigger.CheckChanges('MS',MS) 
    END
  RETURN ReturnValue


Hide:Access:MS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(MS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(MS:IDX_MS_FECHA,'MS:IDX_MS_FECHA',0)
    SELF.AddKey(MS:IDX_MS_ORIGEN,'MS:IDX_MS_ORIGEN',0)
    SELF.AddKey(MS:FK_MS_DPTO,'MS:FK_MS_DPTO',0)
    SELF.AddKey(MS:FK_MS_ESTADO,'MS:FK_MS_ESTADO',0)
    SELF.AddKey(MS:FK_MS_TIPO,'MS:FK_MS_TIPO',0)
    SELF.AddKey(MS:FK_MS_USUARIO,'MS:FK_MS_USUARIO',0)
    SELF.AddKey(MS:PK_MS,'MS:PK_MS',0)
    SELF.AddKey(MS:IDX_MS_NUMERO,'MS:IDX_MS_NUMERO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:MS.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:MEESTADO7     USHORT,AUTO
Save:MEDPTO8       USHORT,AUTO
Save:METIPO9       USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 7
    GlobalErrors.SetField('MS:IDESTADO')
    Save:MEESTADO7 = Access:MEESTADO.SaveFile()
    MEE:IDESTADO = MS:IDESTADO
    ReturnValue = Access:MEESTADO.TryFetch(MEE:PK_MEESTADO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'MEESTADO')
      END
    END
    Access:MEESTADO.RestoreFile(Save:MEESTADO7)
  OF 8
    GlobalErrors.SetField('MS:IDDPTO')
    Save:MEDPTO8 = Access:MEDPTO.SaveFile()
    MED:IDDPTO = MS:IDDPTO
    ReturnValue = Access:MEDPTO.TryFetch(MED:PK_MEDPTO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'MEDPTO')
      END
    END
    Access:MEDPTO.RestoreFile(Save:MEDPTO8)
  OF 9
    GlobalErrors.SetField('MS:IDTIPO')
    Save:METIPO9 = Access:METIPO.SaveFile()
    MET:IDTIPO = MS:IDTIPO
    ReturnValue = Access:METIPO.TryFetch(MET:PK_METIPO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'METIPO')
      END
    END
    Access:METIPO.RestoreFile(Save:METIPO9)
  END
  RETURN ReturnValue


Hide:Relate:MS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:USUARIO,RI:None,RI:None,USU:PK_USUARIO)
  SELF.AddRelationLink(MS:IDUSUARIO,USU:IDUSUARIO)

  SELF.AddRelation(Relate:ME)

  SELF.AddRelation(Relate:MEDPTO)

  SELF.AddRelation(Relate:MEESTADO)

  SELF.AddRelation(Relate:METIPO)


Hide:Relate:MS.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('MS',MS)
  RETURN ReturnValue


Hide:Relate:MS.Kill PROCEDURE

  CODE
  _Hide:Access:MS.Kill                                     ! Kill the file manager
  PARENT.Kill
  Relate:MS &= NULL                                        ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:MS)                                 ! destroy the file manager


Hide:Relate:MS.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('MS')
       DbChangeTrigger.AddThread('MS')
       DbChangeTrigger.AddItem(MS:MS, WHO(MS:RECORD,WHERE(MS:RECORD,MS:MS)) , 'MS')
       DbChangeTrigger.AddItem(MS:FECHA, WHO(MS:RECORD,WHERE(MS:RECORD,MS:FECHA)) , 'MS')
       DbChangeTrigger.AddItem(MS:NUMERO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:NUMERO)) , 'MS')
       DbChangeTrigger.AddItem(MS:ORIGEN, WHO(MS:RECORD,WHERE(MS:RECORD,MS:ORIGEN)) , 'MS')
       DbChangeTrigger.AddItem(MS:CONTENIDO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:CONTENIDO)) , 'MS')
       DbChangeTrigger.AddItem(MS:ACTIVO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:ACTIVO)) , 'MS')
       DbChangeTrigger.AddItem(MS:IDESTADO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:IDESTADO)) , 'MS')
       DbChangeTrigger.AddItem(MS:IDDPTO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:IDDPTO)) , 'MS')
       DbChangeTrigger.AddItem(MS:IDTIPO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:IDTIPO)) , 'MS')
       DbChangeTrigger.AddItem(MS:IDUSUARIO, WHO(MS:RECORD,WHERE(MS:RECORD,MS:IDUSUARIO)) , 'MS')
       DbChangeTrigger.AddItem(MS:HORA, WHO(MS:RECORD,WHERE(MS:RECORD,MS:HORA)) , 'MS')
    END
    DbChangeTrigger.Update('MS')


Hide:Relate:MS.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('MS')
        DbChangeTrigger.CheckChanges('MS',MS) 
     END
  RETURN ReturnValue


Hide:Relate:LIQUIDACION_INFORME.Init PROCEDURE()
  CODE
  _Hide:Access:LIQUIDACION_INFORME.Init
  SELF.Init(Access:LIQUIDACION_INFORME,1)


Hide:Access:LIQUIDACION_INFORME.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('LIQUIDACION_INFORME')
      DbChangeTrigger.AddThread('LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:IDSOCIO, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:IDSOCIO)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:NOMBRE, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:NOMBRE)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:EMAIL, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:EMAIL)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:MONTO, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:MONTO)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:DESC_OS, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:DESC_OS)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:DEBITO, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:DEBITO)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:SEGURO, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:SEGURO)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:DEBITO_COMISION, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:DEBITO_COMISION)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:DEBITO_PAGO_CUOTA, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:DEBITO_PAGO_CUOTA)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:MONTO_TOTAL, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:MONTO_TOTAL)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:MENSAJE, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:MENSAJE)) , 'LIQUIDACION_INFORME')
   END
   DbChangeTrigger.Update('LIQUIDACION_INFORME')
  RETURN ReturnValue


Hide:Access:LIQUIDACION_INFORME.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LIQINF:Record
  SELF.FileNameValue = 'LIQUIDACION_INFORME'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LIQUIDACION_INFORME
  PARENT.Init
  Access:LIQUIDACION_INFORME &= SELF


Hide:Access:LIQUIDACION_INFORME.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('LIQUIDACION_INFORME',LIQUIDACION_INFORME)
  RETURN ReturnValue


Hide:Access:LIQUIDACION_INFORME.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LIQUIDACION_INFORME &= NULL                       ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LIQUIDACION_INFORME.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('LIQUIDACION_INFORME')
      DbChangeTrigger.AddThread('LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:IDSOCIO, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:IDSOCIO)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:NOMBRE, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:NOMBRE)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:EMAIL, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:EMAIL)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:MONTO, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:MONTO)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:DESC_OS, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:DESC_OS)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:DEBITO, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:DEBITO)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:SEGURO, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:SEGURO)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:DEBITO_COMISION, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:DEBITO_COMISION)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:DEBITO_PAGO_CUOTA, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:DEBITO_PAGO_CUOTA)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:MONTO_TOTAL, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:MONTO_TOTAL)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:MENSAJE, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:MENSAJE)) , 'LIQUIDACION_INFORME')
   END
   DbChangeTrigger.Update('LIQUIDACION_INFORME')
  RETURN ReturnValue


Hide:Access:LIQUIDACION_INFORME.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('LIQUIDACION_INFORME')
      DbChangeTrigger.AddThread('LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:IDSOCIO, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:IDSOCIO)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:NOMBRE, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:NOMBRE)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:EMAIL, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:EMAIL)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:MONTO, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:MONTO)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:DESC_OS, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:DESC_OS)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:DEBITO, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:DEBITO)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:SEGURO, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:SEGURO)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:DEBITO_COMISION, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:DEBITO_COMISION)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:DEBITO_PAGO_CUOTA, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:DEBITO_PAGO_CUOTA)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:MONTO_TOTAL, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:MONTO_TOTAL)) , 'LIQUIDACION_INFORME')
      DbChangeTrigger.AddItem(LIQINF:MENSAJE, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:MENSAJE)) , 'LIQUIDACION_INFORME')
   END
   DbChangeTrigger.Update('LIQUIDACION_INFORME')
  RETURN ReturnValue


Hide:Access:LIQUIDACION_INFORME.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('LIQUIDACION_INFORME')
       DbChangeTrigger.CheckChanges('LIQUIDACION_INFORME',LIQUIDACION_INFORME) 
    END
  RETURN ReturnValue


Hide:Access:LIQUIDACION_INFORME.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LIQUIDACION_INFORME,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(LIQINF:PK_LIQUIDACION_INFORME,'LIQINF:PK_LIQUIDACION_INFORME',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LIQUIDACION_INFORME.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('LIQUIDACION_INFORME',LIQUIDACION_INFORME)
  RETURN ReturnValue


Hide:Relate:LIQUIDACION_INFORME.Kill PROCEDURE

  CODE
  _Hide:Access:LIQUIDACION_INFORME.Kill                    ! Kill the file manager
  PARENT.Kill
  Relate:LIQUIDACION_INFORME &= NULL                       ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LIQUIDACION_INFORME)                ! destroy the file manager


Hide:Relate:LIQUIDACION_INFORME.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('LIQUIDACION_INFORME')
       DbChangeTrigger.AddThread('LIQUIDACION_INFORME')
       DbChangeTrigger.AddItem(LIQINF:IDSOCIO, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:IDSOCIO)) , 'LIQUIDACION_INFORME')
       DbChangeTrigger.AddItem(LIQINF:NOMBRE, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:NOMBRE)) , 'LIQUIDACION_INFORME')
       DbChangeTrigger.AddItem(LIQINF:EMAIL, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:EMAIL)) , 'LIQUIDACION_INFORME')
       DbChangeTrigger.AddItem(LIQINF:MONTO, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:MONTO)) , 'LIQUIDACION_INFORME')
       DbChangeTrigger.AddItem(LIQINF:DESC_OS, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:DESC_OS)) , 'LIQUIDACION_INFORME')
       DbChangeTrigger.AddItem(LIQINF:DEBITO, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:DEBITO)) , 'LIQUIDACION_INFORME')
       DbChangeTrigger.AddItem(LIQINF:SEGURO, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:SEGURO)) , 'LIQUIDACION_INFORME')
       DbChangeTrigger.AddItem(LIQINF:DEBITO_COMISION, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:DEBITO_COMISION)) , 'LIQUIDACION_INFORME')
       DbChangeTrigger.AddItem(LIQINF:DEBITO_PAGO_CUOTA, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:DEBITO_PAGO_CUOTA)) , 'LIQUIDACION_INFORME')
       DbChangeTrigger.AddItem(LIQINF:MONTO_TOTAL, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:MONTO_TOTAL)) , 'LIQUIDACION_INFORME')
       DbChangeTrigger.AddItem(LIQINF:MENSAJE, WHO(LIQINF:RECORD,WHERE(LIQINF:RECORD,LIQINF:MENSAJE)) , 'LIQUIDACION_INFORME')
    END
    DbChangeTrigger.Update('LIQUIDACION_INFORME')


Hide:Relate:LIQUIDACION_INFORME.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('LIQUIDACION_INFORME')
        DbChangeTrigger.CheckChanges('LIQUIDACION_INFORME',LIQUIDACION_INFORME) 
     END
  RETURN ReturnValue


Hide:Relate:INGRESOS_FACTURA.Init PROCEDURE()
  CODE
  _Hide:Access:INGRESOS_FACTURA.Init
  SELF.Init(Access:INGRESOS_FACTURA,1)


Hide:Access:INGRESOS_FACTURA.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('INGRESOS_FACTURA')
      DbChangeTrigger.AddThread('INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:IDINGRESO_FAC, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDINGRESO_FAC)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:IDSOCIO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDSOCIO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:IDSUBCUENTA, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDSUBCUENTA)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:OBSERVACION, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:OBSERVACION)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:MONTO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:MONTO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:FECHA, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:FECHA)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:HORA, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:HORA)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:MES, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:MES)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:ANO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:ANO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:PERIODO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:PERIODO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:SUCURSAL, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:SUCURSAL)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:IDRECIBO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDRECIBO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:IDUSUARIO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDUSUARIO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:MES_HASTA, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:MES_HASTA)) , 'INGRESOS_FACTURA')
   END
   DbChangeTrigger.Update('INGRESOS_FACTURA')
  RETURN ReturnValue


Hide:Access:INGRESOS_FACTURA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ING2:Record
  SELF.FileNameValue = 'INGRESOS_FACTURA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= INGRESOS_FACTURA
  PARENT.Init
  Access:INGRESOS_FACTURA &= SELF


Hide:Access:INGRESOS_FACTURA.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('INGRESOS_FACTURA',INGRESOS_FACTURA)
  RETURN ReturnValue


Hide:Access:INGRESOS_FACTURA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:INGRESOS_FACTURA &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:INGRESOS_FACTURA.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('INGRESOS_FACTURA')
      DbChangeTrigger.AddThread('INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:IDINGRESO_FAC, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDINGRESO_FAC)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:IDSOCIO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDSOCIO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:IDSUBCUENTA, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDSUBCUENTA)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:OBSERVACION, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:OBSERVACION)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:MONTO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:MONTO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:FECHA, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:FECHA)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:HORA, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:HORA)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:MES, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:MES)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:ANO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:ANO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:PERIODO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:PERIODO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:SUCURSAL, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:SUCURSAL)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:IDRECIBO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDRECIBO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:IDUSUARIO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDUSUARIO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:MES_HASTA, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:MES_HASTA)) , 'INGRESOS_FACTURA')
   END
   DbChangeTrigger.Update('INGRESOS_FACTURA')
  RETURN ReturnValue


Hide:Access:INGRESOS_FACTURA.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('INGRESOS_FACTURA')
      DbChangeTrigger.AddThread('INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:IDINGRESO_FAC, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDINGRESO_FAC)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:IDSOCIO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDSOCIO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:IDSUBCUENTA, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDSUBCUENTA)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:OBSERVACION, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:OBSERVACION)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:MONTO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:MONTO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:FECHA, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:FECHA)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:HORA, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:HORA)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:MES, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:MES)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:ANO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:ANO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:PERIODO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:PERIODO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:SUCURSAL, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:SUCURSAL)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:IDRECIBO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDRECIBO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:IDUSUARIO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDUSUARIO)) , 'INGRESOS_FACTURA')
      DbChangeTrigger.AddItem(ING2:MES_HASTA, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:MES_HASTA)) , 'INGRESOS_FACTURA')
   END
   DbChangeTrigger.Update('INGRESOS_FACTURA')
  RETURN ReturnValue


Hide:Access:INGRESOS_FACTURA.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('INGRESOS_FACTURA')
       DbChangeTrigger.CheckChanges('INGRESOS_FACTURA',INGRESOS_FACTURA) 
    END
  RETURN ReturnValue


Hide:Access:INGRESOS_FACTURA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(INGRESOS_FACTURA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(ING2:IDX_INGRESOS_FACTURA_1,'ING2:IDX_INGRESOS_FACTURA_1',0)
    SELF.AddKey(ING2:IDX_INGRESOS_FACTURA_2,'ING2:IDX_INGRESOS_FACTURA_2',0)
    SELF.AddKey(ING2:FK_INGRESOS_FACTURA_SOCIO,'ING2:FK_INGRESOS_FACTURA_SOCIO',0)
    SELF.AddKey(ING2:INGRESOS_FACTURA_IDX_CONTROL,'ING2:INGRESOS_FACTURA_IDX_CONTROL',0)
    SELF.AddKey(ING2:PK_INGRESOS_FACTURA,'ING2:PK_INGRESOS_FACTURA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:INGRESOS_FACTURA.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS2       USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('ING2:IDSOCIO')
    Save:SOCIOS2 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = ING2:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS2)
  END
  RETURN ReturnValue


Hide:Relate:INGRESOS_FACTURA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SOCIOS)


Hide:Relate:INGRESOS_FACTURA.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('INGRESOS_FACTURA',INGRESOS_FACTURA)
  RETURN ReturnValue


Hide:Relate:INGRESOS_FACTURA.Kill PROCEDURE

  CODE
  _Hide:Access:INGRESOS_FACTURA.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:INGRESOS_FACTURA &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:INGRESOS_FACTURA)                   ! destroy the file manager


Hide:Relate:INGRESOS_FACTURA.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('INGRESOS_FACTURA')
       DbChangeTrigger.AddThread('INGRESOS_FACTURA')
       DbChangeTrigger.AddItem(ING2:IDINGRESO_FAC, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDINGRESO_FAC)) , 'INGRESOS_FACTURA')
       DbChangeTrigger.AddItem(ING2:IDSOCIO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDSOCIO)) , 'INGRESOS_FACTURA')
       DbChangeTrigger.AddItem(ING2:IDSUBCUENTA, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDSUBCUENTA)) , 'INGRESOS_FACTURA')
       DbChangeTrigger.AddItem(ING2:OBSERVACION, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:OBSERVACION)) , 'INGRESOS_FACTURA')
       DbChangeTrigger.AddItem(ING2:MONTO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:MONTO)) , 'INGRESOS_FACTURA')
       DbChangeTrigger.AddItem(ING2:FECHA, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:FECHA)) , 'INGRESOS_FACTURA')
       DbChangeTrigger.AddItem(ING2:HORA, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:HORA)) , 'INGRESOS_FACTURA')
       DbChangeTrigger.AddItem(ING2:MES, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:MES)) , 'INGRESOS_FACTURA')
       DbChangeTrigger.AddItem(ING2:ANO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:ANO)) , 'INGRESOS_FACTURA')
       DbChangeTrigger.AddItem(ING2:PERIODO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:PERIODO)) , 'INGRESOS_FACTURA')
       DbChangeTrigger.AddItem(ING2:SUCURSAL, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:SUCURSAL)) , 'INGRESOS_FACTURA')
       DbChangeTrigger.AddItem(ING2:IDRECIBO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDRECIBO)) , 'INGRESOS_FACTURA')
       DbChangeTrigger.AddItem(ING2:IDUSUARIO, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:IDUSUARIO)) , 'INGRESOS_FACTURA')
       DbChangeTrigger.AddItem(ING2:MES_HASTA, WHO(ING2:RECORD,WHERE(ING2:RECORD,ING2:MES_HASTA)) , 'INGRESOS_FACTURA')
    END
    DbChangeTrigger.Update('INGRESOS_FACTURA')


Hide:Relate:INGRESOS_FACTURA.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('INGRESOS_FACTURA')
        DbChangeTrigger.CheckChanges('INGRESOS_FACTURA',INGRESOS_FACTURA) 
     END
  RETURN ReturnValue

