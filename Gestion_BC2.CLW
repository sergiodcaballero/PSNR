  MEMBER('Gestion.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
Gestion_BC2:DctInit    PROCEDURE()
Gestion_BC2:DctKill    PROCEDURE()
Gestion_BC2:FilesInit  PROCEDURE()
  END

Hide:Access:PAIS     CLASS(FileManager),TYPE               ! FileManager for PAIS
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PAIS     CLASS(RelationManager),TYPE           ! RelationManager for PAIS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:PERIODO_FACTURA CLASS(FileManager),TYPE        ! FileManager for PERIODO_FACTURA
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


Hide:Relate:PERIODO_FACTURA CLASS(RelationManager),TYPE    ! RelationManager for PERIODO_FACTURA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:RENUNCIA CLASS(FileManager),TYPE               ! FileManager for RENUNCIA
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


Hide:Relate:RENUNCIA CLASS(RelationManager),TYPE           ! RelationManager for RENUNCIA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:MINESP   CLASS(FileManager),TYPE               ! FileManager for MINESP
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:MINESP   CLASS(RelationManager),TYPE           ! RelationManager for MINESP
Init                   PROCEDURE
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:LIQUIDACIONXSOCIO CLASS(FileManager),TYPE      ! FileManager for LIQUIDACIONXSOCIO
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


Hide:Relate:LIQUIDACIONXSOCIO CLASS(RelationManager),TYPE  ! RelationManager for LIQUIDACIONXSOCIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:LIQUIDACION_DISKETTE CLASS(FileManager),TYPE   ! FileManager for LIQUIDACION_DISKETTE
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:LIQUIDACION_DISKETTE CLASS(RelationManager),TYPE ! RelationManager for LIQUIDACION_DISKETTE
Init                   PROCEDURE
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:MINISTERIO CLASS(FileManager),TYPE             ! FileManager for MINISTERIO
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:MINISTERIO CLASS(RelationManager),TYPE         ! RelationManager for MINISTERIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:MINSALUD CLASS(FileManager),TYPE               ! FileManager for MINSALUD
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:MINSALUD CLASS(RelationManager),TYPE           ! RelationManager for MINSALUD
Init                   PROCEDURE
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:SERVICIOS CLASS(FileManager),TYPE              ! FileManager for SERVICIOS
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SERVICIOS CLASS(RelationManager),TYPE          ! RelationManager for SERVICIOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:SERVICIOXSOCIO CLASS(FileManager),TYPE         ! FileManager for SERVICIOXSOCIO
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


Hide:Relate:SERVICIOXSOCIO CLASS(RelationManager),TYPE     ! RelationManager for SERVICIOXSOCIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:SOCIOS   CLASS(FileManager),TYPE               ! FileManager for SOCIOS
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


Hide:Relate:SOCIOS   CLASS(RelationManager),TYPE           ! RelationManager for SOCIOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:TIPO_CONVENIO CLASS(FileManager),TYPE          ! FileManager for TIPO_CONVENIO
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_CONVENIO CLASS(RelationManager),TYPE      ! RelationManager for TIPO_CONVENIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:PAGOSXCIRCULO CLASS(FileManager),TYPE          ! FileManager for PAGOSXCIRCULO
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


Hide:Relate:PAGOSXCIRCULO CLASS(RelationManager),TYPE      ! RelationManager for PAGOSXCIRCULO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:TIPO_CURSO CLASS(FileManager),TYPE             ! FileManager for TIPO_CURSO
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_CURSO CLASS(RelationManager),TYPE         ! RelationManager for TIPO_CURSO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:TIPO_DOC CLASS(FileManager),TYPE               ! FileManager for TIPO_DOC
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_DOC CLASS(RelationManager),TYPE           ! RelationManager for TIPO_DOC
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:TIPO_INSTITUCION CLASS(FileManager),TYPE       ! FileManager for TIPO_INSTITUCION
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_INSTITUCION CLASS(RelationManager),TYPE   ! RelationManager for TIPO_INSTITUCION
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:LIQUIDACION_ENTREGA_BANCO CLASS(FileManager),TYPE ! FileManager for LIQUIDACION_ENTREGA_BANCO
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:LIQUIDACION_ENTREGA_BANCO CLASS(RelationManager),TYPE ! RelationManager for LIQUIDACION_ENTREGA_BANCO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:USUARIO  CLASS(FileManager),TYPE               ! FileManager for USUARIO
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:USUARIO  CLASS(RelationManager),TYPE           ! RelationManager for USUARIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:ZONA_VIVIENDA CLASS(FileManager),TYPE          ! FileManager for ZONA_VIVIENDA
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ZONA_VIVIENDA CLASS(RelationManager),TYPE      ! RelationManager for ZONA_VIVIENDA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CONSULTORIO_EQUIPO CLASS(FileManager),TYPE     ! FileManager for CONSULTORIO_EQUIPO
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


Hide:Relate:CONSULTORIO_EQUIPO CLASS(RelationManager),TYPE ! RelationManager for CONSULTORIO_EQUIPO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END


_Hide:Access:PAIS    &Hide:Access:PAIS,AUTO,THREAD
_Hide:Relate:PAIS    &Hide:Relate:PAIS,AUTO,THREAD
_Hide:Access:PERIODO_FACTURA &Hide:Access:PERIODO_FACTURA,AUTO,THREAD
_Hide:Relate:PERIODO_FACTURA &Hide:Relate:PERIODO_FACTURA,AUTO,THREAD
_Hide:Access:RENUNCIA &Hide:Access:RENUNCIA,AUTO,THREAD
_Hide:Relate:RENUNCIA &Hide:Relate:RENUNCIA,AUTO,THREAD
_Hide:Access:MINESP  &Hide:Access:MINESP,AUTO,THREAD
_Hide:Relate:MINESP  &Hide:Relate:MINESP,AUTO,THREAD
_Hide:Access:LIQUIDACIONXSOCIO &Hide:Access:LIQUIDACIONXSOCIO,AUTO,THREAD
_Hide:Relate:LIQUIDACIONXSOCIO &Hide:Relate:LIQUIDACIONXSOCIO,AUTO,THREAD
_Hide:Access:LIQUIDACION_DISKETTE &Hide:Access:LIQUIDACION_DISKETTE,AUTO,THREAD
_Hide:Relate:LIQUIDACION_DISKETTE &Hide:Relate:LIQUIDACION_DISKETTE,AUTO,THREAD
_Hide:Access:MINISTERIO &Hide:Access:MINISTERIO,AUTO,THREAD
_Hide:Relate:MINISTERIO &Hide:Relate:MINISTERIO,AUTO,THREAD
_Hide:Access:MINSALUD &Hide:Access:MINSALUD,AUTO,THREAD
_Hide:Relate:MINSALUD &Hide:Relate:MINSALUD,AUTO,THREAD
_Hide:Access:SERVICIOS &Hide:Access:SERVICIOS,AUTO,THREAD
_Hide:Relate:SERVICIOS &Hide:Relate:SERVICIOS,AUTO,THREAD
_Hide:Access:SERVICIOXSOCIO &Hide:Access:SERVICIOXSOCIO,AUTO,THREAD
_Hide:Relate:SERVICIOXSOCIO &Hide:Relate:SERVICIOXSOCIO,AUTO,THREAD
_Hide:Access:SOCIOS  &Hide:Access:SOCIOS,AUTO,THREAD
_Hide:Relate:SOCIOS  &Hide:Relate:SOCIOS,AUTO,THREAD
_Hide:Access:TIPO_CONVENIO &Hide:Access:TIPO_CONVENIO,AUTO,THREAD
_Hide:Relate:TIPO_CONVENIO &Hide:Relate:TIPO_CONVENIO,AUTO,THREAD
_Hide:Access:PAGOSXCIRCULO &Hide:Access:PAGOSXCIRCULO,AUTO,THREAD
_Hide:Relate:PAGOSXCIRCULO &Hide:Relate:PAGOSXCIRCULO,AUTO,THREAD
_Hide:Access:TIPO_CURSO &Hide:Access:TIPO_CURSO,AUTO,THREAD
_Hide:Relate:TIPO_CURSO &Hide:Relate:TIPO_CURSO,AUTO,THREAD
_Hide:Access:TIPO_DOC &Hide:Access:TIPO_DOC,AUTO,THREAD
_Hide:Relate:TIPO_DOC &Hide:Relate:TIPO_DOC,AUTO,THREAD
_Hide:Access:TIPO_INSTITUCION &Hide:Access:TIPO_INSTITUCION,AUTO,THREAD
_Hide:Relate:TIPO_INSTITUCION &Hide:Relate:TIPO_INSTITUCION,AUTO,THREAD
_Hide:Access:LIQUIDACION_ENTREGA_BANCO &Hide:Access:LIQUIDACION_ENTREGA_BANCO,AUTO,THREAD
_Hide:Relate:LIQUIDACION_ENTREGA_BANCO &Hide:Relate:LIQUIDACION_ENTREGA_BANCO,AUTO,THREAD
_Hide:Access:USUARIO &Hide:Access:USUARIO,AUTO,THREAD
_Hide:Relate:USUARIO &Hide:Relate:USUARIO,AUTO,THREAD
_Hide:Access:ZONA_VIVIENDA &Hide:Access:ZONA_VIVIENDA,AUTO,THREAD
_Hide:Relate:ZONA_VIVIENDA &Hide:Relate:ZONA_VIVIENDA,AUTO,THREAD
_Hide:Access:CONSULTORIO_EQUIPO &Hide:Access:CONSULTORIO_EQUIPO,AUTO,THREAD
_Hide:Relate:CONSULTORIO_EQUIPO &Hide:Relate:CONSULTORIO_EQUIPO,AUTO,THREAD


Gestion_BC2:DctInit PROCEDURE()
  CODE
  _Hide:Access:PAIS &= NEW(Hide:Access:PAIS)
  _Hide:Relate:PAIS &= NEW(Hide:Relate:PAIS)
  _Hide:Access:PERIODO_FACTURA &= NEW(Hide:Access:PERIODO_FACTURA)
  _Hide:Relate:PERIODO_FACTURA &= NEW(Hide:Relate:PERIODO_FACTURA)
  _Hide:Access:RENUNCIA &= NEW(Hide:Access:RENUNCIA)
  _Hide:Relate:RENUNCIA &= NEW(Hide:Relate:RENUNCIA)
  _Hide:Access:MINESP &= NEW(Hide:Access:MINESP)
  _Hide:Relate:MINESP &= NEW(Hide:Relate:MINESP)
  _Hide:Access:LIQUIDACIONXSOCIO &= NEW(Hide:Access:LIQUIDACIONXSOCIO)
  _Hide:Relate:LIQUIDACIONXSOCIO &= NEW(Hide:Relate:LIQUIDACIONXSOCIO)
  _Hide:Access:LIQUIDACION_DISKETTE &= NEW(Hide:Access:LIQUIDACION_DISKETTE)
  _Hide:Relate:LIQUIDACION_DISKETTE &= NEW(Hide:Relate:LIQUIDACION_DISKETTE)
  _Hide:Access:MINISTERIO &= NEW(Hide:Access:MINISTERIO)
  _Hide:Relate:MINISTERIO &= NEW(Hide:Relate:MINISTERIO)
  _Hide:Access:MINSALUD &= NEW(Hide:Access:MINSALUD)
  _Hide:Relate:MINSALUD &= NEW(Hide:Relate:MINSALUD)
  _Hide:Access:SERVICIOS &= NEW(Hide:Access:SERVICIOS)
  _Hide:Relate:SERVICIOS &= NEW(Hide:Relate:SERVICIOS)
  _Hide:Access:SERVICIOXSOCIO &= NEW(Hide:Access:SERVICIOXSOCIO)
  _Hide:Relate:SERVICIOXSOCIO &= NEW(Hide:Relate:SERVICIOXSOCIO)
  _Hide:Access:SOCIOS &= NEW(Hide:Access:SOCIOS)
  _Hide:Relate:SOCIOS &= NEW(Hide:Relate:SOCIOS)
  _Hide:Access:TIPO_CONVENIO &= NEW(Hide:Access:TIPO_CONVENIO)
  _Hide:Relate:TIPO_CONVENIO &= NEW(Hide:Relate:TIPO_CONVENIO)
  _Hide:Access:PAGOSXCIRCULO &= NEW(Hide:Access:PAGOSXCIRCULO)
  _Hide:Relate:PAGOSXCIRCULO &= NEW(Hide:Relate:PAGOSXCIRCULO)
  _Hide:Access:TIPO_CURSO &= NEW(Hide:Access:TIPO_CURSO)
  _Hide:Relate:TIPO_CURSO &= NEW(Hide:Relate:TIPO_CURSO)
  _Hide:Access:TIPO_DOC &= NEW(Hide:Access:TIPO_DOC)
  _Hide:Relate:TIPO_DOC &= NEW(Hide:Relate:TIPO_DOC)
  _Hide:Access:TIPO_INSTITUCION &= NEW(Hide:Access:TIPO_INSTITUCION)
  _Hide:Relate:TIPO_INSTITUCION &= NEW(Hide:Relate:TIPO_INSTITUCION)
  _Hide:Access:LIQUIDACION_ENTREGA_BANCO &= NEW(Hide:Access:LIQUIDACION_ENTREGA_BANCO)
  _Hide:Relate:LIQUIDACION_ENTREGA_BANCO &= NEW(Hide:Relate:LIQUIDACION_ENTREGA_BANCO)
  _Hide:Access:USUARIO &= NEW(Hide:Access:USUARIO)
  _Hide:Relate:USUARIO &= NEW(Hide:Relate:USUARIO)
  _Hide:Access:ZONA_VIVIENDA &= NEW(Hide:Access:ZONA_VIVIENDA)
  _Hide:Relate:ZONA_VIVIENDA &= NEW(Hide:Relate:ZONA_VIVIENDA)
  _Hide:Access:CONSULTORIO_EQUIPO &= NEW(Hide:Access:CONSULTORIO_EQUIPO)
  _Hide:Relate:CONSULTORIO_EQUIPO &= NEW(Hide:Relate:CONSULTORIO_EQUIPO)
  Relate:PAIS &= _Hide:Relate:PAIS
  Relate:PERIODO_FACTURA &= _Hide:Relate:PERIODO_FACTURA
  Relate:RENUNCIA &= _Hide:Relate:RENUNCIA
  Relate:MINESP &= _Hide:Relate:MINESP
  Relate:LIQUIDACIONXSOCIO &= _Hide:Relate:LIQUIDACIONXSOCIO
  Relate:LIQUIDACION_DISKETTE &= _Hide:Relate:LIQUIDACION_DISKETTE
  Relate:MINISTERIO &= _Hide:Relate:MINISTERIO
  Relate:MINSALUD &= _Hide:Relate:MINSALUD
  Relate:SERVICIOS &= _Hide:Relate:SERVICIOS
  Relate:SERVICIOXSOCIO &= _Hide:Relate:SERVICIOXSOCIO
  Relate:SOCIOS &= _Hide:Relate:SOCIOS
  Relate:TIPO_CONVENIO &= _Hide:Relate:TIPO_CONVENIO
  Relate:PAGOSXCIRCULO &= _Hide:Relate:PAGOSXCIRCULO
  Relate:TIPO_CURSO &= _Hide:Relate:TIPO_CURSO
  Relate:TIPO_DOC &= _Hide:Relate:TIPO_DOC
  Relate:TIPO_INSTITUCION &= _Hide:Relate:TIPO_INSTITUCION
  Relate:LIQUIDACION_ENTREGA_BANCO &= _Hide:Relate:LIQUIDACION_ENTREGA_BANCO
  Relate:USUARIO &= _Hide:Relate:USUARIO
  Relate:ZONA_VIVIENDA &= _Hide:Relate:ZONA_VIVIENDA
  Relate:CONSULTORIO_EQUIPO &= _Hide:Relate:CONSULTORIO_EQUIPO


Gestion_BC2:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:PAIS.Init
  _Hide:Relate:PERIODO_FACTURA.Init
  _Hide:Relate:RENUNCIA.Init
  _Hide:Relate:MINESP.Init
  _Hide:Relate:LIQUIDACIONXSOCIO.Init
  _Hide:Relate:LIQUIDACION_DISKETTE.Init
  _Hide:Relate:MINISTERIO.Init
  _Hide:Relate:MINSALUD.Init
  _Hide:Relate:SERVICIOS.Init
  _Hide:Relate:SERVICIOXSOCIO.Init
  _Hide:Relate:SOCIOS.Init
  _Hide:Relate:TIPO_CONVENIO.Init
  _Hide:Relate:PAGOSXCIRCULO.Init
  _Hide:Relate:TIPO_CURSO.Init
  _Hide:Relate:TIPO_DOC.Init
  _Hide:Relate:TIPO_INSTITUCION.Init
  _Hide:Relate:LIQUIDACION_ENTREGA_BANCO.Init
  _Hide:Relate:USUARIO.Init
  _Hide:Relate:ZONA_VIVIENDA.Init
  _Hide:Relate:CONSULTORIO_EQUIPO.Init


Gestion_BC2:DctKill PROCEDURE()
  CODE
  _Hide:Relate:PAIS.Kill
  DISPOSE(_Hide:Relate:PAIS)
  _Hide:Relate:PERIODO_FACTURA.Kill
  DISPOSE(_Hide:Relate:PERIODO_FACTURA)
  _Hide:Relate:RENUNCIA.Kill
  DISPOSE(_Hide:Relate:RENUNCIA)
  _Hide:Relate:MINESP.Kill
  DISPOSE(_Hide:Relate:MINESP)
  _Hide:Relate:LIQUIDACIONXSOCIO.Kill
  DISPOSE(_Hide:Relate:LIQUIDACIONXSOCIO)
  _Hide:Relate:LIQUIDACION_DISKETTE.Kill
  DISPOSE(_Hide:Relate:LIQUIDACION_DISKETTE)
  _Hide:Relate:MINISTERIO.Kill
  DISPOSE(_Hide:Relate:MINISTERIO)
  _Hide:Relate:MINSALUD.Kill
  DISPOSE(_Hide:Relate:MINSALUD)
  _Hide:Relate:SERVICIOS.Kill
  DISPOSE(_Hide:Relate:SERVICIOS)
  _Hide:Relate:SERVICIOXSOCIO.Kill
  DISPOSE(_Hide:Relate:SERVICIOXSOCIO)
  _Hide:Relate:SOCIOS.Kill
  DISPOSE(_Hide:Relate:SOCIOS)
  _Hide:Relate:TIPO_CONVENIO.Kill
  DISPOSE(_Hide:Relate:TIPO_CONVENIO)
  _Hide:Relate:PAGOSXCIRCULO.Kill
  DISPOSE(_Hide:Relate:PAGOSXCIRCULO)
  _Hide:Relate:TIPO_CURSO.Kill
  DISPOSE(_Hide:Relate:TIPO_CURSO)
  _Hide:Relate:TIPO_DOC.Kill
  DISPOSE(_Hide:Relate:TIPO_DOC)
  _Hide:Relate:TIPO_INSTITUCION.Kill
  DISPOSE(_Hide:Relate:TIPO_INSTITUCION)
  _Hide:Relate:LIQUIDACION_ENTREGA_BANCO.Kill
  DISPOSE(_Hide:Relate:LIQUIDACION_ENTREGA_BANCO)
  _Hide:Relate:USUARIO.Kill
  DISPOSE(_Hide:Relate:USUARIO)
  _Hide:Relate:ZONA_VIVIENDA.Kill
  DISPOSE(_Hide:Relate:ZONA_VIVIENDA)
  _Hide:Relate:CONSULTORIO_EQUIPO.Kill
  DISPOSE(_Hide:Relate:CONSULTORIO_EQUIPO)


Hide:Relate:PAIS.Init PROCEDURE()
  CODE
  _Hide:Access:PAIS.Init
  SELF.Init(Access:PAIS,1)


Hide:Access:PAIS.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('PAIS')
      DbChangeTrigger.AddThread('PAIS')
      DbChangeTrigger.AddItem(PAI:IDPAIS, WHO(PAI:RECORD,WHERE(PAI:RECORD,PAI:IDPAIS)) , 'PAIS')
      DbChangeTrigger.AddItem(PAI:DESCRIPCION, WHO(PAI:RECORD,WHERE(PAI:RECORD,PAI:DESCRIPCION)) , 'PAIS')
   END
   DbChangeTrigger.Update('PAIS')
  RETURN ReturnValue


Hide:Access:PAIS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PAI:Record
  SELF.FileNameValue = 'PAIS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PAIS
  PARENT.Init
  Access:PAIS &= SELF


Hide:Access:PAIS.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('PAIS',PAIS)
  RETURN ReturnValue


Hide:Access:PAIS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PAIS &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PAIS.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('PAIS')
      DbChangeTrigger.AddThread('PAIS')
      DbChangeTrigger.AddItem(PAI:IDPAIS, WHO(PAI:RECORD,WHERE(PAI:RECORD,PAI:IDPAIS)) , 'PAIS')
      DbChangeTrigger.AddItem(PAI:DESCRIPCION, WHO(PAI:RECORD,WHERE(PAI:RECORD,PAI:DESCRIPCION)) , 'PAIS')
   END
   DbChangeTrigger.Update('PAIS')
  RETURN ReturnValue


Hide:Access:PAIS.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('PAIS')
      DbChangeTrigger.AddThread('PAIS')
      DbChangeTrigger.AddItem(PAI:IDPAIS, WHO(PAI:RECORD,WHERE(PAI:RECORD,PAI:IDPAIS)) , 'PAIS')
      DbChangeTrigger.AddItem(PAI:DESCRIPCION, WHO(PAI:RECORD,WHERE(PAI:RECORD,PAI:DESCRIPCION)) , 'PAIS')
   END
   DbChangeTrigger.Update('PAIS')
  RETURN ReturnValue


Hide:Access:PAIS.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('PAIS')
       DbChangeTrigger.CheckChanges('PAIS',PAIS) 
    END
  RETURN ReturnValue


Hide:Access:PAIS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PAIS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PAI:PK_PAIS,'PAI:PK_PAIS',0)
    SELF.AddKey(PAI:IDX_PAIS_DESCRIPCION,'PAI:IDX_PAIS_DESCRIPCION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PAIS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:LOCALIDAD,RI:None,RI:None,LOC:FK_LOCALIDAD_PAIS)
  SELF.AddRelationLink(PAI:IDPAIS,LOC:IDPAIS)


Hide:Relate:PAIS.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('PAIS',PAIS)
  RETURN ReturnValue


Hide:Relate:PAIS.Kill PROCEDURE

  CODE
  _Hide:Access:PAIS.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:PAIS &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PAIS)                               ! destroy the file manager


Hide:Relate:PAIS.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('PAIS')
       DbChangeTrigger.AddThread('PAIS')
       DbChangeTrigger.AddItem(PAI:IDPAIS, WHO(PAI:RECORD,WHERE(PAI:RECORD,PAI:IDPAIS)) , 'PAIS')
       DbChangeTrigger.AddItem(PAI:DESCRIPCION, WHO(PAI:RECORD,WHERE(PAI:RECORD,PAI:DESCRIPCION)) , 'PAIS')
    END
    DbChangeTrigger.Update('PAIS')


Hide:Relate:PAIS.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('PAIS')
        DbChangeTrigger.CheckChanges('PAIS',PAIS) 
     END
  RETURN ReturnValue


Hide:Relate:PERIODO_FACTURA.Init PROCEDURE()
  CODE
  _Hide:Access:PERIODO_FACTURA.Init
  SELF.Init(Access:PERIODO_FACTURA,1)


Hide:Access:PERIODO_FACTURA.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('PERIODO_FACTURA')
      DbChangeTrigger.AddThread('PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:ANO, WHO(PER:RECORD,WHERE(PER:RECORD,PER:ANO)) , 'PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:MES, WHO(PER:RECORD,WHERE(PER:RECORD,PER:MES)) , 'PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:PERIODO, WHO(PER:RECORD,WHERE(PER:RECORD,PER:PERIODO)) , 'PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:FECHA, WHO(PER:RECORD,WHERE(PER:RECORD,PER:FECHA)) , 'PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:HORA, WHO(PER:RECORD,WHERE(PER:RECORD,PER:HORA)) , 'PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:IDUSUARIO, WHO(PER:RECORD,WHERE(PER:RECORD,PER:IDUSUARIO)) , 'PERIODO_FACTURA')
   END
   DbChangeTrigger.Update('PERIODO_FACTURA')
  RETURN ReturnValue


Hide:Access:PERIODO_FACTURA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PER:Record
  SELF.FileNameValue = 'PERIODO_FACTURA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PERIODO_FACTURA
  PARENT.Init
  Access:PERIODO_FACTURA &= SELF


Hide:Access:PERIODO_FACTURA.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('PERIODO_FACTURA',PERIODO_FACTURA)
  RETURN ReturnValue


Hide:Access:PERIODO_FACTURA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PERIODO_FACTURA &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PERIODO_FACTURA.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('PERIODO_FACTURA')
      DbChangeTrigger.AddThread('PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:ANO, WHO(PER:RECORD,WHERE(PER:RECORD,PER:ANO)) , 'PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:MES, WHO(PER:RECORD,WHERE(PER:RECORD,PER:MES)) , 'PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:PERIODO, WHO(PER:RECORD,WHERE(PER:RECORD,PER:PERIODO)) , 'PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:FECHA, WHO(PER:RECORD,WHERE(PER:RECORD,PER:FECHA)) , 'PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:HORA, WHO(PER:RECORD,WHERE(PER:RECORD,PER:HORA)) , 'PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:IDUSUARIO, WHO(PER:RECORD,WHERE(PER:RECORD,PER:IDUSUARIO)) , 'PERIODO_FACTURA')
   END
   DbChangeTrigger.Update('PERIODO_FACTURA')
  RETURN ReturnValue


Hide:Access:PERIODO_FACTURA.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('PERIODO_FACTURA')
      DbChangeTrigger.AddThread('PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:ANO, WHO(PER:RECORD,WHERE(PER:RECORD,PER:ANO)) , 'PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:MES, WHO(PER:RECORD,WHERE(PER:RECORD,PER:MES)) , 'PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:PERIODO, WHO(PER:RECORD,WHERE(PER:RECORD,PER:PERIODO)) , 'PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:FECHA, WHO(PER:RECORD,WHERE(PER:RECORD,PER:FECHA)) , 'PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:HORA, WHO(PER:RECORD,WHERE(PER:RECORD,PER:HORA)) , 'PERIODO_FACTURA')
      DbChangeTrigger.AddItem(PER:IDUSUARIO, WHO(PER:RECORD,WHERE(PER:RECORD,PER:IDUSUARIO)) , 'PERIODO_FACTURA')
   END
   DbChangeTrigger.Update('PERIODO_FACTURA')
  RETURN ReturnValue


Hide:Access:PERIODO_FACTURA.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('PERIODO_FACTURA')
       DbChangeTrigger.CheckChanges('PERIODO_FACTURA',PERIODO_FACTURA) 
    END
  RETURN ReturnValue


Hide:Access:PERIODO_FACTURA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PERIODO_FACTURA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PER:PK_PERIODO_FACTURA,'PER:PK_PERIODO_FACTURA',0)
    SELF.AddKey(PER:FK_PERIODO_FACTURA_USUARIO,'PER:FK_PERIODO_FACTURA_USUARIO',0)
    SELF.AddKey(PER:IDX_PERIODO_FACTURA_PERIODO,'PER:IDX_PERIODO_FACTURA_PERIODO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:PERIODO_FACTURA.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:USUARIO6      USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 6
    GlobalErrors.SetField('PER:IDUSUARIO')
    Save:USUARIO6 = Access:USUARIO.SaveFile()
    USU:IDUSUARIO = PER:IDUSUARIO
    ReturnValue = Access:USUARIO.TryFetch(USU:PK_USUARIO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'USUARIO')
      END
    END
    Access:USUARIO.RestoreFile(Save:USUARIO6)
  END
  RETURN ReturnValue


Hide:Relate:PERIODO_FACTURA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:USUARIO)


Hide:Relate:PERIODO_FACTURA.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('PERIODO_FACTURA',PERIODO_FACTURA)
  RETURN ReturnValue


Hide:Relate:PERIODO_FACTURA.Kill PROCEDURE

  CODE
  _Hide:Access:PERIODO_FACTURA.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:PERIODO_FACTURA &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PERIODO_FACTURA)                    ! destroy the file manager


Hide:Relate:PERIODO_FACTURA.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('PERIODO_FACTURA')
       DbChangeTrigger.AddThread('PERIODO_FACTURA')
       DbChangeTrigger.AddItem(PER:ANO, WHO(PER:RECORD,WHERE(PER:RECORD,PER:ANO)) , 'PERIODO_FACTURA')
       DbChangeTrigger.AddItem(PER:MES, WHO(PER:RECORD,WHERE(PER:RECORD,PER:MES)) , 'PERIODO_FACTURA')
       DbChangeTrigger.AddItem(PER:PERIODO, WHO(PER:RECORD,WHERE(PER:RECORD,PER:PERIODO)) , 'PERIODO_FACTURA')
       DbChangeTrigger.AddItem(PER:FECHA, WHO(PER:RECORD,WHERE(PER:RECORD,PER:FECHA)) , 'PERIODO_FACTURA')
       DbChangeTrigger.AddItem(PER:HORA, WHO(PER:RECORD,WHERE(PER:RECORD,PER:HORA)) , 'PERIODO_FACTURA')
       DbChangeTrigger.AddItem(PER:IDUSUARIO, WHO(PER:RECORD,WHERE(PER:RECORD,PER:IDUSUARIO)) , 'PERIODO_FACTURA')
    END
    DbChangeTrigger.Update('PERIODO_FACTURA')


Hide:Relate:PERIODO_FACTURA.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('PERIODO_FACTURA')
        DbChangeTrigger.CheckChanges('PERIODO_FACTURA',PERIODO_FACTURA) 
     END
  RETURN ReturnValue


Hide:Relate:RENUNCIA.Init PROCEDURE()
  CODE
  _Hide:Access:RENUNCIA.Init
  SELF.Init(Access:RENUNCIA,1)


Hide:Access:RENUNCIA.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('RENUNCIA')
      DbChangeTrigger.AddThread('RENUNCIA')
      DbChangeTrigger.AddItem(REN:IDRENUNCIA, WHO(REN:RECORD,WHERE(REN:RECORD,REN:IDRENUNCIA)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:IDSOCIO, WHO(REN:RECORD,WHERE(REN:RECORD,REN:IDSOCIO)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:IDUSUARIO, WHO(REN:RECORD,WHERE(REN:RECORD,REN:IDUSUARIO)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:LIBRO, WHO(REN:RECORD,WHERE(REN:RECORD,REN:LIBRO)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:FOLIO, WHO(REN:RECORD,WHERE(REN:RECORD,REN:FOLIO)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:ACTA, WHO(REN:RECORD,WHERE(REN:RECORD,REN:ACTA)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:FECHA, WHO(REN:RECORD,WHERE(REN:RECORD,REN:FECHA)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:HORA, WHO(REN:RECORD,WHERE(REN:RECORD,REN:HORA)) , 'RENUNCIA')
   END
   DbChangeTrigger.Update('RENUNCIA')
  RETURN ReturnValue


Hide:Access:RENUNCIA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= REN:Record
  SELF.FileNameValue = 'RENUNCIA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RENUNCIA
  PARENT.Init
  Access:RENUNCIA &= SELF


Hide:Access:RENUNCIA.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('RENUNCIA',RENUNCIA)
  RETURN ReturnValue


Hide:Access:RENUNCIA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RENUNCIA &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RENUNCIA.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('RENUNCIA')
      DbChangeTrigger.AddThread('RENUNCIA')
      DbChangeTrigger.AddItem(REN:IDRENUNCIA, WHO(REN:RECORD,WHERE(REN:RECORD,REN:IDRENUNCIA)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:IDSOCIO, WHO(REN:RECORD,WHERE(REN:RECORD,REN:IDSOCIO)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:IDUSUARIO, WHO(REN:RECORD,WHERE(REN:RECORD,REN:IDUSUARIO)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:LIBRO, WHO(REN:RECORD,WHERE(REN:RECORD,REN:LIBRO)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:FOLIO, WHO(REN:RECORD,WHERE(REN:RECORD,REN:FOLIO)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:ACTA, WHO(REN:RECORD,WHERE(REN:RECORD,REN:ACTA)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:FECHA, WHO(REN:RECORD,WHERE(REN:RECORD,REN:FECHA)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:HORA, WHO(REN:RECORD,WHERE(REN:RECORD,REN:HORA)) , 'RENUNCIA')
   END
   DbChangeTrigger.Update('RENUNCIA')
  RETURN ReturnValue


Hide:Access:RENUNCIA.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('RENUNCIA')
      DbChangeTrigger.AddThread('RENUNCIA')
      DbChangeTrigger.AddItem(REN:IDRENUNCIA, WHO(REN:RECORD,WHERE(REN:RECORD,REN:IDRENUNCIA)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:IDSOCIO, WHO(REN:RECORD,WHERE(REN:RECORD,REN:IDSOCIO)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:IDUSUARIO, WHO(REN:RECORD,WHERE(REN:RECORD,REN:IDUSUARIO)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:LIBRO, WHO(REN:RECORD,WHERE(REN:RECORD,REN:LIBRO)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:FOLIO, WHO(REN:RECORD,WHERE(REN:RECORD,REN:FOLIO)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:ACTA, WHO(REN:RECORD,WHERE(REN:RECORD,REN:ACTA)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:FECHA, WHO(REN:RECORD,WHERE(REN:RECORD,REN:FECHA)) , 'RENUNCIA')
      DbChangeTrigger.AddItem(REN:HORA, WHO(REN:RECORD,WHERE(REN:RECORD,REN:HORA)) , 'RENUNCIA')
   END
   DbChangeTrigger.Update('RENUNCIA')
  RETURN ReturnValue


Hide:Access:RENUNCIA.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('RENUNCIA')
       DbChangeTrigger.CheckChanges('RENUNCIA',RENUNCIA) 
    END
  RETURN ReturnValue


Hide:Access:RENUNCIA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RENUNCIA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(REN:PK_RENUNCIA,'REN:PK_RENUNCIA',0)
    SELF.AddKey(REN:FK_RENUNCIA_SOCIOS,'REN:FK_RENUNCIA_SOCIOS',0)
    SELF.AddKey(REN:FK_RENUNCIA_USUARIO,'REN:FK_RENUNCIA_USUARIO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:RENUNCIA.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS2       USHORT,AUTO
Save:USUARIO3      USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('REN:IDSOCIO')
    Save:SOCIOS2 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = REN:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS2)
  OF 3
    GlobalErrors.SetField('REN:IDUSUARIO')
    Save:USUARIO3 = Access:USUARIO.SaveFile()
    USU:IDUSUARIO = REN:IDUSUARIO
    ReturnValue = Access:USUARIO.TryFetch(USU:PK_USUARIO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'USUARIO')
      END
    END
    Access:USUARIO.RestoreFile(Save:USUARIO3)
  END
  RETURN ReturnValue


Hide:Relate:RENUNCIA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:USUARIO)


Hide:Relate:RENUNCIA.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('RENUNCIA',RENUNCIA)
  RETURN ReturnValue


Hide:Relate:RENUNCIA.Kill PROCEDURE

  CODE
  _Hide:Access:RENUNCIA.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:RENUNCIA &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RENUNCIA)                           ! destroy the file manager


Hide:Relate:RENUNCIA.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('RENUNCIA')
       DbChangeTrigger.AddThread('RENUNCIA')
       DbChangeTrigger.AddItem(REN:IDRENUNCIA, WHO(REN:RECORD,WHERE(REN:RECORD,REN:IDRENUNCIA)) , 'RENUNCIA')
       DbChangeTrigger.AddItem(REN:IDSOCIO, WHO(REN:RECORD,WHERE(REN:RECORD,REN:IDSOCIO)) , 'RENUNCIA')
       DbChangeTrigger.AddItem(REN:IDUSUARIO, WHO(REN:RECORD,WHERE(REN:RECORD,REN:IDUSUARIO)) , 'RENUNCIA')
       DbChangeTrigger.AddItem(REN:LIBRO, WHO(REN:RECORD,WHERE(REN:RECORD,REN:LIBRO)) , 'RENUNCIA')
       DbChangeTrigger.AddItem(REN:FOLIO, WHO(REN:RECORD,WHERE(REN:RECORD,REN:FOLIO)) , 'RENUNCIA')
       DbChangeTrigger.AddItem(REN:ACTA, WHO(REN:RECORD,WHERE(REN:RECORD,REN:ACTA)) , 'RENUNCIA')
       DbChangeTrigger.AddItem(REN:FECHA, WHO(REN:RECORD,WHERE(REN:RECORD,REN:FECHA)) , 'RENUNCIA')
       DbChangeTrigger.AddItem(REN:HORA, WHO(REN:RECORD,WHERE(REN:RECORD,REN:HORA)) , 'RENUNCIA')
    END
    DbChangeTrigger.Update('RENUNCIA')


Hide:Relate:RENUNCIA.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('RENUNCIA')
        DbChangeTrigger.CheckChanges('RENUNCIA',RENUNCIA) 
     END
  RETURN ReturnValue


Hide:Relate:MINESP.Init PROCEDURE()
  CODE
  _Hide:Access:MINESP.Init
  SELF.Init(Access:MINESP,1)


Hide:Access:MINESP.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('MINESP')
      DbChangeTrigger.AddThread('MINESP')
      DbChangeTrigger.AddItem(MESP:NRO, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:NRO)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:COLEGIO, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:COLEGIO)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:IDSOCIO, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:IDSOCIO)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:NOMBRE, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:NOMBRE)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:IDESPECIALIDAD, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:IDESPECIALIDAD)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:ESPECIALIDAD, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:ESPECIALIDAD)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:FECHA_INICIO, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:FECHA_INICIO)) , 'MINESP')
   END
   DbChangeTrigger.Update('MINESP')
  RETURN ReturnValue


Hide:Access:MINESP.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MESP:Record
  SELF.FileNameValue = 'MINESP'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= MINESP
  PARENT.Init
  Access:MINESP &= SELF


Hide:Access:MINESP.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('MINESP',MINESP)
  RETURN ReturnValue


Hide:Access:MINESP.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:MINESP &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:MINESP.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('MINESP')
      DbChangeTrigger.AddThread('MINESP')
      DbChangeTrigger.AddItem(MESP:NRO, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:NRO)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:COLEGIO, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:COLEGIO)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:IDSOCIO, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:IDSOCIO)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:NOMBRE, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:NOMBRE)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:IDESPECIALIDAD, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:IDESPECIALIDAD)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:ESPECIALIDAD, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:ESPECIALIDAD)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:FECHA_INICIO, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:FECHA_INICIO)) , 'MINESP')
   END
   DbChangeTrigger.Update('MINESP')
  RETURN ReturnValue


Hide:Access:MINESP.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('MINESP')
      DbChangeTrigger.AddThread('MINESP')
      DbChangeTrigger.AddItem(MESP:NRO, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:NRO)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:COLEGIO, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:COLEGIO)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:IDSOCIO, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:IDSOCIO)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:NOMBRE, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:NOMBRE)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:IDESPECIALIDAD, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:IDESPECIALIDAD)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:ESPECIALIDAD, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:ESPECIALIDAD)) , 'MINESP')
      DbChangeTrigger.AddItem(MESP:FECHA_INICIO, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:FECHA_INICIO)) , 'MINESP')
   END
   DbChangeTrigger.Update('MINESP')
  RETURN ReturnValue


Hide:Access:MINESP.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('MINESP')
       DbChangeTrigger.CheckChanges('MINESP',MINESP) 
    END
  RETURN ReturnValue


Hide:Access:MINESP.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(MINESP,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:MINESP.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('MINESP',MINESP)
  RETURN ReturnValue


Hide:Relate:MINESP.Kill PROCEDURE

  CODE
  _Hide:Access:MINESP.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:MINESP &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:MINESP)                             ! destroy the file manager


Hide:Relate:MINESP.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('MINESP')
       DbChangeTrigger.AddThread('MINESP')
       DbChangeTrigger.AddItem(MESP:NRO, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:NRO)) , 'MINESP')
       DbChangeTrigger.AddItem(MESP:COLEGIO, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:COLEGIO)) , 'MINESP')
       DbChangeTrigger.AddItem(MESP:IDSOCIO, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:IDSOCIO)) , 'MINESP')
       DbChangeTrigger.AddItem(MESP:NOMBRE, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:NOMBRE)) , 'MINESP')
       DbChangeTrigger.AddItem(MESP:IDESPECIALIDAD, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:IDESPECIALIDAD)) , 'MINESP')
       DbChangeTrigger.AddItem(MESP:ESPECIALIDAD, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:ESPECIALIDAD)) , 'MINESP')
       DbChangeTrigger.AddItem(MESP:FECHA_INICIO, WHO(MESP:RECORD,WHERE(MESP:RECORD,MESP:FECHA_INICIO)) , 'MINESP')
    END
    DbChangeTrigger.Update('MINESP')


Hide:Relate:MINESP.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('MINESP')
        DbChangeTrigger.CheckChanges('MINESP',MINESP) 
     END
  RETURN ReturnValue


Hide:Relate:LIQUIDACIONXSOCIO.Init PROCEDURE()
  CODE
  _Hide:Access:LIQUIDACIONXSOCIO.Init
  SELF.Init(Access:LIQUIDACIONXSOCIO,1)


Hide:Access:LIQUIDACIONXSOCIO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddThread('LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:IDSOCIO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:IDSOCIO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:MES, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:MES)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:ANO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:ANO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:PERIODO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:PERIODO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:TIPO_PERIODO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:TIPO_PERIODO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:MONTO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:MONTO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:FECHA_CARGA, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:FECHA_CARGA)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:FECHA_PRESENTACION, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:FECHA_PRESENTACION)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:FECHA_COBRO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:FECHA_COBRO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:FECHA_PAGO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:FECHA_PAGO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:MONTO_PAGADO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:MONTO_PAGADO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:IDFORMA_PAGO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:IDFORMA_PAGO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:DEBITO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:DEBITO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:COMISION, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:COMISION)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:CANTIDAD, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:CANTIDAD)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:DEBITO_COMISION, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:DEBITO_COMISION)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:CANTIDAD_CUOTAS_PAGADAS, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:CANTIDAD_CUOTAS_PAGADAS)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:DEBITO_PAGO_CUOTAS, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:DEBITO_PAGO_CUOTAS)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:MONTO_TOTAL, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:MONTO_TOTAL)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:PRESENTADO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:PRESENTADO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:COBRADO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:COBRADO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:PAGADO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:PAGADO)) , 'LIQUIDACIONXSOCIO')
   END
   DbChangeTrigger.Update('LIQUIDACIONXSOCIO')
  RETURN ReturnValue


Hide:Access:LIQUIDACIONXSOCIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LXSOC:Record
  SELF.FileNameValue = 'LIQUIDACIONXSOCIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LIQUIDACIONXSOCIO
  PARENT.Init
  Access:LIQUIDACIONXSOCIO &= SELF


Hide:Access:LIQUIDACIONXSOCIO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('LIQUIDACIONXSOCIO',LIQUIDACIONXSOCIO)
  RETURN ReturnValue


Hide:Access:LIQUIDACIONXSOCIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LIQUIDACIONXSOCIO &= NULL                         ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LIQUIDACIONXSOCIO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddThread('LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:IDSOCIO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:IDSOCIO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:MES, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:MES)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:ANO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:ANO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:PERIODO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:PERIODO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:TIPO_PERIODO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:TIPO_PERIODO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:MONTO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:MONTO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:FECHA_CARGA, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:FECHA_CARGA)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:FECHA_PRESENTACION, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:FECHA_PRESENTACION)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:FECHA_COBRO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:FECHA_COBRO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:FECHA_PAGO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:FECHA_PAGO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:MONTO_PAGADO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:MONTO_PAGADO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:IDFORMA_PAGO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:IDFORMA_PAGO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:DEBITO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:DEBITO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:COMISION, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:COMISION)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:CANTIDAD, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:CANTIDAD)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:DEBITO_COMISION, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:DEBITO_COMISION)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:CANTIDAD_CUOTAS_PAGADAS, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:CANTIDAD_CUOTAS_PAGADAS)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:DEBITO_PAGO_CUOTAS, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:DEBITO_PAGO_CUOTAS)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:MONTO_TOTAL, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:MONTO_TOTAL)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:PRESENTADO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:PRESENTADO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:COBRADO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:COBRADO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:PAGADO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:PAGADO)) , 'LIQUIDACIONXSOCIO')
   END
   DbChangeTrigger.Update('LIQUIDACIONXSOCIO')
  RETURN ReturnValue


Hide:Access:LIQUIDACIONXSOCIO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddThread('LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:IDSOCIO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:IDSOCIO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:MES, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:MES)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:ANO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:ANO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:PERIODO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:PERIODO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:TIPO_PERIODO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:TIPO_PERIODO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:MONTO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:MONTO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:FECHA_CARGA, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:FECHA_CARGA)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:FECHA_PRESENTACION, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:FECHA_PRESENTACION)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:FECHA_COBRO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:FECHA_COBRO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:FECHA_PAGO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:FECHA_PAGO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:MONTO_PAGADO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:MONTO_PAGADO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:IDFORMA_PAGO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:IDFORMA_PAGO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:DEBITO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:DEBITO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:COMISION, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:COMISION)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:CANTIDAD, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:CANTIDAD)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:DEBITO_COMISION, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:DEBITO_COMISION)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:CANTIDAD_CUOTAS_PAGADAS, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:CANTIDAD_CUOTAS_PAGADAS)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:DEBITO_PAGO_CUOTAS, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:DEBITO_PAGO_CUOTAS)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:MONTO_TOTAL, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:MONTO_TOTAL)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:PRESENTADO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:PRESENTADO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:COBRADO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:COBRADO)) , 'LIQUIDACIONXSOCIO')
      DbChangeTrigger.AddItem(LXSOC:PAGADO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:PAGADO)) , 'LIQUIDACIONXSOCIO')
   END
   DbChangeTrigger.Update('LIQUIDACIONXSOCIO')
  RETURN ReturnValue


Hide:Access:LIQUIDACIONXSOCIO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('LIQUIDACIONXSOCIO')
       DbChangeTrigger.CheckChanges('LIQUIDACIONXSOCIO',LIQUIDACIONXSOCIO) 
    END
  RETURN ReturnValue


Hide:Access:LIQUIDACIONXSOCIO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LIQUIDACIONXSOCIO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(LXSOC:PK_LIQUIDACIONXSOCIO,'LXSOC:PK_LIQUIDACIONXSOCIO',0)
    SELF.AddKey(LXSOC:FK_LIQUIDACIONXSOCIO_1,'LXSOC:FK_LIQUIDACIONXSOCIO_1',0)
    SELF.AddKey(LXSOC:IDX_LIQUIDACIONXSOCIO_MES_ANO,'LXSOC:IDX_LIQUIDACIONXSOCIO_MES_ANO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:LIQUIDACIONXSOCIO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('LXSOC:MES')
    IF NOT INRANGE(LXSOC:MES,1,12)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'1 .. 12')
      END
    END
  OF 3
    GlobalErrors.SetField('LXSOC:ANO')
    IF NOT INRANGE(LXSOC:ANO,2009,2999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'2009 .. 2999')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:LIQUIDACIONXSOCIO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SOCIOS)


Hide:Relate:LIQUIDACIONXSOCIO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('LIQUIDACIONXSOCIO',LIQUIDACIONXSOCIO)
  RETURN ReturnValue


Hide:Relate:LIQUIDACIONXSOCIO.Kill PROCEDURE

  CODE
  _Hide:Access:LIQUIDACIONXSOCIO.Kill                      ! Kill the file manager
  PARENT.Kill
  Relate:LIQUIDACIONXSOCIO &= NULL                         ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LIQUIDACIONXSOCIO)                  ! destroy the file manager


Hide:Relate:LIQUIDACIONXSOCIO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddThread('LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:IDSOCIO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:IDSOCIO)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:MES, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:MES)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:ANO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:ANO)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:PERIODO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:PERIODO)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:TIPO_PERIODO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:TIPO_PERIODO)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:MONTO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:MONTO)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:FECHA_CARGA, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:FECHA_CARGA)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:FECHA_PRESENTACION, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:FECHA_PRESENTACION)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:FECHA_COBRO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:FECHA_COBRO)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:FECHA_PAGO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:FECHA_PAGO)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:MONTO_PAGADO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:MONTO_PAGADO)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:IDFORMA_PAGO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:IDFORMA_PAGO)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:DEBITO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:DEBITO)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:COMISION, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:COMISION)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:CANTIDAD, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:CANTIDAD)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:DEBITO_COMISION, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:DEBITO_COMISION)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:CANTIDAD_CUOTAS_PAGADAS, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:CANTIDAD_CUOTAS_PAGADAS)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:DEBITO_PAGO_CUOTAS, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:DEBITO_PAGO_CUOTAS)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:MONTO_TOTAL, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:MONTO_TOTAL)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:PRESENTADO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:PRESENTADO)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:COBRADO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:COBRADO)) , 'LIQUIDACIONXSOCIO')
       DbChangeTrigger.AddItem(LXSOC:PAGADO, WHO(LXSOC:RECORD,WHERE(LXSOC:RECORD,LXSOC:PAGADO)) , 'LIQUIDACIONXSOCIO')
    END
    DbChangeTrigger.Update('LIQUIDACIONXSOCIO')


Hide:Relate:LIQUIDACIONXSOCIO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('LIQUIDACIONXSOCIO')
        DbChangeTrigger.CheckChanges('LIQUIDACIONXSOCIO',LIQUIDACIONXSOCIO) 
     END
  RETURN ReturnValue


Hide:Relate:LIQUIDACION_DISKETTE.Init PROCEDURE()
  CODE
  _Hide:Access:LIQUIDACION_DISKETTE.Init
  SELF.Init(Access:LIQUIDACION_DISKETTE,1)


Hide:Access:LIQUIDACION_DISKETTE.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('LIQUIDACION_DISKETTE')
      DbChangeTrigger.AddThread('LIQUIDACION_DISKETTE')
      DbChangeTrigger.AddItem(MAC:COLUMNA, WHO(MAC:RECORD,WHERE(MAC:RECORD,MAC:COLUMNA)) , 'LIQUIDACION_DISKETTE')
   END
   DbChangeTrigger.Update('LIQUIDACION_DISKETTE')
  RETURN ReturnValue


Hide:Access:LIQUIDACION_DISKETTE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MAC:Record
  SELF.FileNameValue = 'LIQUIDACION_DISKETTE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LIQUIDACION_DISKETTE
  PARENT.Init
  Access:LIQUIDACION_DISKETTE &= SELF


Hide:Access:LIQUIDACION_DISKETTE.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('LIQUIDACION_DISKETTE',LIQUIDACION_DISKETTE)
  RETURN ReturnValue


Hide:Access:LIQUIDACION_DISKETTE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LIQUIDACION_DISKETTE &= NULL                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LIQUIDACION_DISKETTE.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('LIQUIDACION_DISKETTE')
      DbChangeTrigger.AddThread('LIQUIDACION_DISKETTE')
      DbChangeTrigger.AddItem(MAC:COLUMNA, WHO(MAC:RECORD,WHERE(MAC:RECORD,MAC:COLUMNA)) , 'LIQUIDACION_DISKETTE')
   END
   DbChangeTrigger.Update('LIQUIDACION_DISKETTE')
  RETURN ReturnValue


Hide:Access:LIQUIDACION_DISKETTE.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('LIQUIDACION_DISKETTE')
      DbChangeTrigger.AddThread('LIQUIDACION_DISKETTE')
      DbChangeTrigger.AddItem(MAC:COLUMNA, WHO(MAC:RECORD,WHERE(MAC:RECORD,MAC:COLUMNA)) , 'LIQUIDACION_DISKETTE')
   END
   DbChangeTrigger.Update('LIQUIDACION_DISKETTE')
  RETURN ReturnValue


Hide:Access:LIQUIDACION_DISKETTE.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('LIQUIDACION_DISKETTE')
       DbChangeTrigger.CheckChanges('LIQUIDACION_DISKETTE',LIQUIDACION_DISKETTE) 
    END
  RETURN ReturnValue


Hide:Access:LIQUIDACION_DISKETTE.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LIQUIDACION_DISKETTE,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LIQUIDACION_DISKETTE.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('LIQUIDACION_DISKETTE',LIQUIDACION_DISKETTE)
  RETURN ReturnValue


Hide:Relate:LIQUIDACION_DISKETTE.Kill PROCEDURE

  CODE
  _Hide:Access:LIQUIDACION_DISKETTE.Kill                   ! Kill the file manager
  PARENT.Kill
  Relate:LIQUIDACION_DISKETTE &= NULL                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LIQUIDACION_DISKETTE)               ! destroy the file manager


Hide:Relate:LIQUIDACION_DISKETTE.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('LIQUIDACION_DISKETTE')
       DbChangeTrigger.AddThread('LIQUIDACION_DISKETTE')
       DbChangeTrigger.AddItem(MAC:COLUMNA, WHO(MAC:RECORD,WHERE(MAC:RECORD,MAC:COLUMNA)) , 'LIQUIDACION_DISKETTE')
    END
    DbChangeTrigger.Update('LIQUIDACION_DISKETTE')


Hide:Relate:LIQUIDACION_DISKETTE.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('LIQUIDACION_DISKETTE')
        DbChangeTrigger.CheckChanges('LIQUIDACION_DISKETTE',LIQUIDACION_DISKETTE) 
     END
  RETURN ReturnValue


Hide:Relate:MINISTERIO.Init PROCEDURE()
  CODE
  _Hide:Access:MINISTERIO.Init
  SELF.Init(Access:MINISTERIO,1)


Hide:Access:MINISTERIO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('MINISTERIO')
      DbChangeTrigger.AddThread('MINISTERIO')
      DbChangeTrigger.AddItem(MIN:IDMINISTERIO, WHO(MIN:RECORD,WHERE(MIN:RECORD,MIN:IDMINISTERIO)) , 'MINISTERIO')
      DbChangeTrigger.AddItem(MIN:DESCRIPCION, WHO(MIN:RECORD,WHERE(MIN:RECORD,MIN:DESCRIPCION)) , 'MINISTERIO')
      DbChangeTrigger.AddItem(MIN:DIRECCION, WHO(MIN:RECORD,WHERE(MIN:RECORD,MIN:DIRECCION)) , 'MINISTERIO')
   END
   DbChangeTrigger.Update('MINISTERIO')
  RETURN ReturnValue


Hide:Access:MINISTERIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MIN:Record
  SELF.FileNameValue = 'MINISTERIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= MINISTERIO
  PARENT.Init
  Access:MINISTERIO &= SELF


Hide:Access:MINISTERIO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('MINISTERIO',MINISTERIO)
  RETURN ReturnValue


Hide:Access:MINISTERIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:MINISTERIO &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:MINISTERIO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('MINISTERIO')
      DbChangeTrigger.AddThread('MINISTERIO')
      DbChangeTrigger.AddItem(MIN:IDMINISTERIO, WHO(MIN:RECORD,WHERE(MIN:RECORD,MIN:IDMINISTERIO)) , 'MINISTERIO')
      DbChangeTrigger.AddItem(MIN:DESCRIPCION, WHO(MIN:RECORD,WHERE(MIN:RECORD,MIN:DESCRIPCION)) , 'MINISTERIO')
      DbChangeTrigger.AddItem(MIN:DIRECCION, WHO(MIN:RECORD,WHERE(MIN:RECORD,MIN:DIRECCION)) , 'MINISTERIO')
   END
   DbChangeTrigger.Update('MINISTERIO')
  RETURN ReturnValue


Hide:Access:MINISTERIO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('MINISTERIO')
      DbChangeTrigger.AddThread('MINISTERIO')
      DbChangeTrigger.AddItem(MIN:IDMINISTERIO, WHO(MIN:RECORD,WHERE(MIN:RECORD,MIN:IDMINISTERIO)) , 'MINISTERIO')
      DbChangeTrigger.AddItem(MIN:DESCRIPCION, WHO(MIN:RECORD,WHERE(MIN:RECORD,MIN:DESCRIPCION)) , 'MINISTERIO')
      DbChangeTrigger.AddItem(MIN:DIRECCION, WHO(MIN:RECORD,WHERE(MIN:RECORD,MIN:DIRECCION)) , 'MINISTERIO')
   END
   DbChangeTrigger.Update('MINISTERIO')
  RETURN ReturnValue


Hide:Access:MINISTERIO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('MINISTERIO')
       DbChangeTrigger.CheckChanges('MINISTERIO',MINISTERIO) 
    END
  RETURN ReturnValue


Hide:Access:MINISTERIO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(MINISTERIO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(MIN:PK_MINISTERIO,'MIN:PK_MINISTERIO',0)
    SELF.AddKey(MIN:IDX_DECRIPCION,'MIN:IDX_DECRIPCION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:MINISTERIO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:IDX_SOCIOS_MINISTERIO)
  SELF.AddRelationLink(MIN:IDMINISTERIO,SOC:IDMINISTERIO)


Hide:Relate:MINISTERIO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('MINISTERIO',MINISTERIO)
  RETURN ReturnValue


Hide:Relate:MINISTERIO.Kill PROCEDURE

  CODE
  _Hide:Access:MINISTERIO.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:MINISTERIO &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:MINISTERIO)                         ! destroy the file manager


Hide:Relate:MINISTERIO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('MINISTERIO')
       DbChangeTrigger.AddThread('MINISTERIO')
       DbChangeTrigger.AddItem(MIN:IDMINISTERIO, WHO(MIN:RECORD,WHERE(MIN:RECORD,MIN:IDMINISTERIO)) , 'MINISTERIO')
       DbChangeTrigger.AddItem(MIN:DESCRIPCION, WHO(MIN:RECORD,WHERE(MIN:RECORD,MIN:DESCRIPCION)) , 'MINISTERIO')
       DbChangeTrigger.AddItem(MIN:DIRECCION, WHO(MIN:RECORD,WHERE(MIN:RECORD,MIN:DIRECCION)) , 'MINISTERIO')
    END
    DbChangeTrigger.Update('MINISTERIO')


Hide:Relate:MINISTERIO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('MINISTERIO')
        DbChangeTrigger.CheckChanges('MINISTERIO',MINISTERIO) 
     END
  RETURN ReturnValue


Hide:Relate:MINSALUD.Init PROCEDURE()
  CODE
  _Hide:Access:MINSALUD.Init
  SELF.Init(Access:MINSALUD,1)


Hide:Access:MINSALUD.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('MINSALUD')
      DbChangeTrigger.AddThread('MINSALUD')
      DbChangeTrigger.AddItem(MINS:NRO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:NRO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:IDCOLEGIO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:IDCOLEGIO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:MATRICULA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:MATRICULA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:APELLIDO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:APELLIDO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:NOMBRES, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:NOMBRES)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:NOMBRE, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:NOMBRE)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TIPO_DOC, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TIPO_DOC)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:N_DOCUMENTO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:N_DOCUMENTO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:SEXO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:SEXO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:DIRECCION, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:DIRECCION)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TELEFONO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TELEFONO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:CELULAR, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:CELULAR)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:EMAIL, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:EMAIL)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FECHA_ALTA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_ALTA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FECHA_NACIMIENTO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_NACIMIENTO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FECHA_BAJA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_BAJA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:LOCALIDAD, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:LOCALIDAD)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:ANO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:ANO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:DIRECCION_LABORAL, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:DIRECCION_LABORAL)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TELEFONO_LABORAL, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TELEFONO_LABORAL)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:BAJA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:BAJA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:LIBRO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:LIBRO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FOLIO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FOLIO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:ACTA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:ACTA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:PROVISORIO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:PROVISORIO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FECHA_EGRESO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_EGRESO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:BAJA_TEMPORARIA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:BAJA_TEMPORARIA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FECHA_TITULO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_TITULO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:LUGAR_NACIMIENTO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:LUGAR_NACIMIENTO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:DESCRIPCION_MINISTERIO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:DESCRIPCION_MINISTERIO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:INSTITUCION, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:INSTITUCION)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:IDCENTRO_SALUD, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:IDCENTRO_SALUD)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:DESCRIPCION_CENTRO_SALUD, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:DESCRIPCION_CENTRO_SALUD)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TIPO_INSTITUCION, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TIPO_INSTITUCION)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TITULO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TITULO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:NIVEL_FORMACION, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:NIVEL_FORMACION)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:GRADO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:GRADO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TIPO_TITULO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TIPO_TITULO)) , 'MINSALUD')
   END
   DbChangeTrigger.Update('MINSALUD')
  RETURN ReturnValue


Hide:Access:MINSALUD.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MINS:Record
  SELF.FileNameValue = 'MINSALUD'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= MINSALUD
  PARENT.Init
  Access:MINSALUD &= SELF


Hide:Access:MINSALUD.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('MINSALUD',MINSALUD)
  RETURN ReturnValue


Hide:Access:MINSALUD.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:MINSALUD &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:MINSALUD.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('MINSALUD')
      DbChangeTrigger.AddThread('MINSALUD')
      DbChangeTrigger.AddItem(MINS:NRO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:NRO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:IDCOLEGIO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:IDCOLEGIO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:MATRICULA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:MATRICULA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:APELLIDO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:APELLIDO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:NOMBRES, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:NOMBRES)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:NOMBRE, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:NOMBRE)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TIPO_DOC, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TIPO_DOC)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:N_DOCUMENTO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:N_DOCUMENTO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:SEXO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:SEXO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:DIRECCION, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:DIRECCION)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TELEFONO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TELEFONO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:CELULAR, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:CELULAR)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:EMAIL, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:EMAIL)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FECHA_ALTA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_ALTA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FECHA_NACIMIENTO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_NACIMIENTO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FECHA_BAJA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_BAJA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:LOCALIDAD, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:LOCALIDAD)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:ANO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:ANO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:DIRECCION_LABORAL, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:DIRECCION_LABORAL)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TELEFONO_LABORAL, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TELEFONO_LABORAL)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:BAJA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:BAJA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:LIBRO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:LIBRO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FOLIO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FOLIO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:ACTA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:ACTA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:PROVISORIO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:PROVISORIO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FECHA_EGRESO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_EGRESO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:BAJA_TEMPORARIA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:BAJA_TEMPORARIA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FECHA_TITULO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_TITULO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:LUGAR_NACIMIENTO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:LUGAR_NACIMIENTO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:DESCRIPCION_MINISTERIO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:DESCRIPCION_MINISTERIO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:INSTITUCION, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:INSTITUCION)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:IDCENTRO_SALUD, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:IDCENTRO_SALUD)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:DESCRIPCION_CENTRO_SALUD, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:DESCRIPCION_CENTRO_SALUD)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TIPO_INSTITUCION, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TIPO_INSTITUCION)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TITULO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TITULO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:NIVEL_FORMACION, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:NIVEL_FORMACION)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:GRADO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:GRADO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TIPO_TITULO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TIPO_TITULO)) , 'MINSALUD')
   END
   DbChangeTrigger.Update('MINSALUD')
  RETURN ReturnValue


Hide:Access:MINSALUD.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('MINSALUD')
      DbChangeTrigger.AddThread('MINSALUD')
      DbChangeTrigger.AddItem(MINS:NRO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:NRO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:IDCOLEGIO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:IDCOLEGIO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:MATRICULA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:MATRICULA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:APELLIDO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:APELLIDO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:NOMBRES, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:NOMBRES)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:NOMBRE, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:NOMBRE)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TIPO_DOC, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TIPO_DOC)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:N_DOCUMENTO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:N_DOCUMENTO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:SEXO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:SEXO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:DIRECCION, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:DIRECCION)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TELEFONO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TELEFONO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:CELULAR, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:CELULAR)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:EMAIL, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:EMAIL)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FECHA_ALTA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_ALTA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FECHA_NACIMIENTO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_NACIMIENTO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FECHA_BAJA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_BAJA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:LOCALIDAD, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:LOCALIDAD)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:ANO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:ANO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:DIRECCION_LABORAL, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:DIRECCION_LABORAL)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TELEFONO_LABORAL, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TELEFONO_LABORAL)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:BAJA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:BAJA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:LIBRO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:LIBRO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FOLIO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FOLIO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:ACTA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:ACTA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:PROVISORIO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:PROVISORIO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FECHA_EGRESO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_EGRESO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:BAJA_TEMPORARIA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:BAJA_TEMPORARIA)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:FECHA_TITULO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_TITULO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:LUGAR_NACIMIENTO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:LUGAR_NACIMIENTO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:DESCRIPCION_MINISTERIO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:DESCRIPCION_MINISTERIO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:INSTITUCION, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:INSTITUCION)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:IDCENTRO_SALUD, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:IDCENTRO_SALUD)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:DESCRIPCION_CENTRO_SALUD, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:DESCRIPCION_CENTRO_SALUD)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TIPO_INSTITUCION, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TIPO_INSTITUCION)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TITULO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TITULO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:NIVEL_FORMACION, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:NIVEL_FORMACION)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:GRADO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:GRADO)) , 'MINSALUD')
      DbChangeTrigger.AddItem(MINS:TIPO_TITULO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TIPO_TITULO)) , 'MINSALUD')
   END
   DbChangeTrigger.Update('MINSALUD')
  RETURN ReturnValue


Hide:Access:MINSALUD.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('MINSALUD')
       DbChangeTrigger.CheckChanges('MINSALUD',MINSALUD) 
    END
  RETURN ReturnValue


Hide:Access:MINSALUD.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(MINSALUD,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:MINSALUD.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('MINSALUD',MINSALUD)
  RETURN ReturnValue


Hide:Relate:MINSALUD.Kill PROCEDURE

  CODE
  _Hide:Access:MINSALUD.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:MINSALUD &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:MINSALUD)                           ! destroy the file manager


Hide:Relate:MINSALUD.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('MINSALUD')
       DbChangeTrigger.AddThread('MINSALUD')
       DbChangeTrigger.AddItem(MINS:NRO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:NRO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:IDCOLEGIO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:IDCOLEGIO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:MATRICULA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:MATRICULA)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:APELLIDO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:APELLIDO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:NOMBRES, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:NOMBRES)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:NOMBRE, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:NOMBRE)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:TIPO_DOC, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TIPO_DOC)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:N_DOCUMENTO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:N_DOCUMENTO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:SEXO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:SEXO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:DIRECCION, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:DIRECCION)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:TELEFONO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TELEFONO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:CELULAR, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:CELULAR)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:EMAIL, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:EMAIL)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:FECHA_ALTA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_ALTA)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:FECHA_NACIMIENTO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_NACIMIENTO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:FECHA_BAJA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_BAJA)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:LOCALIDAD, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:LOCALIDAD)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:ANO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:ANO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:DIRECCION_LABORAL, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:DIRECCION_LABORAL)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:TELEFONO_LABORAL, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TELEFONO_LABORAL)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:BAJA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:BAJA)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:LIBRO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:LIBRO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:FOLIO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FOLIO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:ACTA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:ACTA)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:PROVISORIO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:PROVISORIO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:FECHA_EGRESO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_EGRESO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:BAJA_TEMPORARIA, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:BAJA_TEMPORARIA)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:FECHA_TITULO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:FECHA_TITULO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:LUGAR_NACIMIENTO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:LUGAR_NACIMIENTO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:DESCRIPCION_MINISTERIO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:DESCRIPCION_MINISTERIO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:INSTITUCION, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:INSTITUCION)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:IDCENTRO_SALUD, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:IDCENTRO_SALUD)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:DESCRIPCION_CENTRO_SALUD, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:DESCRIPCION_CENTRO_SALUD)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:TIPO_INSTITUCION, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TIPO_INSTITUCION)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:TITULO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TITULO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:NIVEL_FORMACION, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:NIVEL_FORMACION)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:GRADO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:GRADO)) , 'MINSALUD')
       DbChangeTrigger.AddItem(MINS:TIPO_TITULO, WHO(MINS:RECORD,WHERE(MINS:RECORD,MINS:TIPO_TITULO)) , 'MINSALUD')
    END
    DbChangeTrigger.Update('MINSALUD')


Hide:Relate:MINSALUD.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('MINSALUD')
        DbChangeTrigger.CheckChanges('MINSALUD',MINSALUD) 
     END
  RETURN ReturnValue


Hide:Relate:SERVICIOS.Init PROCEDURE()
  CODE
  _Hide:Access:SERVICIOS.Init
  SELF.Init(Access:SERVICIOS,1)


Hide:Access:SERVICIOS.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('SERVICIOS')
      DbChangeTrigger.AddThread('SERVICIOS')
      DbChangeTrigger.AddItem(SER:IDSERVICIOS, WHO(SER:RECORD,WHERE(SER:RECORD,SER:IDSERVICIOS)) , 'SERVICIOS')
      DbChangeTrigger.AddItem(SER:DESCRIPCION, WHO(SER:RECORD,WHERE(SER:RECORD,SER:DESCRIPCION)) , 'SERVICIOS')
      DbChangeTrigger.AddItem(SER:MONTO, WHO(SER:RECORD,WHERE(SER:RECORD,SER:MONTO)) , 'SERVICIOS')
      DbChangeTrigger.AddItem(SER:DESCUENTO, WHO(SER:RECORD,WHERE(SER:RECORD,SER:DESCUENTO)) , 'SERVICIOS')
      DbChangeTrigger.AddItem(SER:INTERES, WHO(SER:RECORD,WHERE(SER:RECORD,SER:INTERES)) , 'SERVICIOS')
   END
   DbChangeTrigger.Update('SERVICIOS')
  RETURN ReturnValue


Hide:Access:SERVICIOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SER:Record
  SELF.FileNameValue = 'SERVICIOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SERVICIOS
  PARENT.Init
  Access:SERVICIOS &= SELF


Hide:Access:SERVICIOS.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('SERVICIOS',SERVICIOS)
  RETURN ReturnValue


Hide:Access:SERVICIOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SERVICIOS &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SERVICIOS.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('SERVICIOS')
      DbChangeTrigger.AddThread('SERVICIOS')
      DbChangeTrigger.AddItem(SER:IDSERVICIOS, WHO(SER:RECORD,WHERE(SER:RECORD,SER:IDSERVICIOS)) , 'SERVICIOS')
      DbChangeTrigger.AddItem(SER:DESCRIPCION, WHO(SER:RECORD,WHERE(SER:RECORD,SER:DESCRIPCION)) , 'SERVICIOS')
      DbChangeTrigger.AddItem(SER:MONTO, WHO(SER:RECORD,WHERE(SER:RECORD,SER:MONTO)) , 'SERVICIOS')
      DbChangeTrigger.AddItem(SER:DESCUENTO, WHO(SER:RECORD,WHERE(SER:RECORD,SER:DESCUENTO)) , 'SERVICIOS')
      DbChangeTrigger.AddItem(SER:INTERES, WHO(SER:RECORD,WHERE(SER:RECORD,SER:INTERES)) , 'SERVICIOS')
   END
   DbChangeTrigger.Update('SERVICIOS')
  RETURN ReturnValue


Hide:Access:SERVICIOS.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('SERVICIOS')
      DbChangeTrigger.AddThread('SERVICIOS')
      DbChangeTrigger.AddItem(SER:IDSERVICIOS, WHO(SER:RECORD,WHERE(SER:RECORD,SER:IDSERVICIOS)) , 'SERVICIOS')
      DbChangeTrigger.AddItem(SER:DESCRIPCION, WHO(SER:RECORD,WHERE(SER:RECORD,SER:DESCRIPCION)) , 'SERVICIOS')
      DbChangeTrigger.AddItem(SER:MONTO, WHO(SER:RECORD,WHERE(SER:RECORD,SER:MONTO)) , 'SERVICIOS')
      DbChangeTrigger.AddItem(SER:DESCUENTO, WHO(SER:RECORD,WHERE(SER:RECORD,SER:DESCUENTO)) , 'SERVICIOS')
      DbChangeTrigger.AddItem(SER:INTERES, WHO(SER:RECORD,WHERE(SER:RECORD,SER:INTERES)) , 'SERVICIOS')
   END
   DbChangeTrigger.Update('SERVICIOS')
  RETURN ReturnValue


Hide:Access:SERVICIOS.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('SERVICIOS')
       DbChangeTrigger.CheckChanges('SERVICIOS',SERVICIOS) 
    END
  RETURN ReturnValue


Hide:Access:SERVICIOS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SERVICIOS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SER:PK_SERVICIOS,'SER:PK_SERVICIOS',0)
    SELF.AddKey(SER:IDX_SERVICIOS_DESCRIPCION,'SER:IDX_SERVICIOS_DESCRIPCION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SERVICIOS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SERVICIOXSOCIO,RI:None,RI:None,SER2:FK_SERVICIOXSOCIO_SERVICIOS)
  SELF.AddRelationLink(SER:IDSERVICIOS,SER2:IDSERVICIOS)


Hide:Relate:SERVICIOS.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('SERVICIOS',SERVICIOS)
  RETURN ReturnValue


Hide:Relate:SERVICIOS.Kill PROCEDURE

  CODE
  _Hide:Access:SERVICIOS.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:SERVICIOS &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SERVICIOS)                          ! destroy the file manager


Hide:Relate:SERVICIOS.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('SERVICIOS')
       DbChangeTrigger.AddThread('SERVICIOS')
       DbChangeTrigger.AddItem(SER:IDSERVICIOS, WHO(SER:RECORD,WHERE(SER:RECORD,SER:IDSERVICIOS)) , 'SERVICIOS')
       DbChangeTrigger.AddItem(SER:DESCRIPCION, WHO(SER:RECORD,WHERE(SER:RECORD,SER:DESCRIPCION)) , 'SERVICIOS')
       DbChangeTrigger.AddItem(SER:MONTO, WHO(SER:RECORD,WHERE(SER:RECORD,SER:MONTO)) , 'SERVICIOS')
       DbChangeTrigger.AddItem(SER:DESCUENTO, WHO(SER:RECORD,WHERE(SER:RECORD,SER:DESCUENTO)) , 'SERVICIOS')
       DbChangeTrigger.AddItem(SER:INTERES, WHO(SER:RECORD,WHERE(SER:RECORD,SER:INTERES)) , 'SERVICIOS')
    END
    DbChangeTrigger.Update('SERVICIOS')


Hide:Relate:SERVICIOS.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('SERVICIOS')
        DbChangeTrigger.CheckChanges('SERVICIOS',SERVICIOS) 
     END
  RETURN ReturnValue


Hide:Relate:SERVICIOXSOCIO.Init PROCEDURE()
  CODE
  _Hide:Access:SERVICIOXSOCIO.Init
  SELF.Init(Access:SERVICIOXSOCIO,1)


Hide:Access:SERVICIOXSOCIO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('SERVICIOXSOCIO')
      DbChangeTrigger.AddThread('SERVICIOXSOCIO')
      DbChangeTrigger.AddItem(SER2:IDSOCIO, WHO(SER2:RECORD,WHERE(SER2:RECORD,SER2:IDSOCIO)) , 'SERVICIOXSOCIO')
      DbChangeTrigger.AddItem(SER2:IDSERVICIOS, WHO(SER2:RECORD,WHERE(SER2:RECORD,SER2:IDSERVICIOS)) , 'SERVICIOXSOCIO')
      DbChangeTrigger.AddItem(SER2:FECHA, WHO(SER2:RECORD,WHERE(SER2:RECORD,SER2:FECHA)) , 'SERVICIOXSOCIO')
      DbChangeTrigger.AddItem(SER2:HORA, WHO(SER2:RECORD,WHERE(SER2:RECORD,SER2:HORA)) , 'SERVICIOXSOCIO')
   END
   DbChangeTrigger.Update('SERVICIOXSOCIO')
  RETURN ReturnValue


Hide:Access:SERVICIOXSOCIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SER2:Record
  SELF.FileNameValue = 'SERVICIOXSOCIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SERVICIOXSOCIO
  PARENT.Init
  Access:SERVICIOXSOCIO &= SELF


Hide:Access:SERVICIOXSOCIO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('SERVICIOXSOCIO',SERVICIOXSOCIO)
  RETURN ReturnValue


Hide:Access:SERVICIOXSOCIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SERVICIOXSOCIO &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SERVICIOXSOCIO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('SERVICIOXSOCIO')
      DbChangeTrigger.AddThread('SERVICIOXSOCIO')
      DbChangeTrigger.AddItem(SER2:IDSOCIO, WHO(SER2:RECORD,WHERE(SER2:RECORD,SER2:IDSOCIO)) , 'SERVICIOXSOCIO')
      DbChangeTrigger.AddItem(SER2:IDSERVICIOS, WHO(SER2:RECORD,WHERE(SER2:RECORD,SER2:IDSERVICIOS)) , 'SERVICIOXSOCIO')
      DbChangeTrigger.AddItem(SER2:FECHA, WHO(SER2:RECORD,WHERE(SER2:RECORD,SER2:FECHA)) , 'SERVICIOXSOCIO')
      DbChangeTrigger.AddItem(SER2:HORA, WHO(SER2:RECORD,WHERE(SER2:RECORD,SER2:HORA)) , 'SERVICIOXSOCIO')
   END
   DbChangeTrigger.Update('SERVICIOXSOCIO')
  RETURN ReturnValue


Hide:Access:SERVICIOXSOCIO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('SERVICIOXSOCIO')
      DbChangeTrigger.AddThread('SERVICIOXSOCIO')
      DbChangeTrigger.AddItem(SER2:IDSOCIO, WHO(SER2:RECORD,WHERE(SER2:RECORD,SER2:IDSOCIO)) , 'SERVICIOXSOCIO')
      DbChangeTrigger.AddItem(SER2:IDSERVICIOS, WHO(SER2:RECORD,WHERE(SER2:RECORD,SER2:IDSERVICIOS)) , 'SERVICIOXSOCIO')
      DbChangeTrigger.AddItem(SER2:FECHA, WHO(SER2:RECORD,WHERE(SER2:RECORD,SER2:FECHA)) , 'SERVICIOXSOCIO')
      DbChangeTrigger.AddItem(SER2:HORA, WHO(SER2:RECORD,WHERE(SER2:RECORD,SER2:HORA)) , 'SERVICIOXSOCIO')
   END
   DbChangeTrigger.Update('SERVICIOXSOCIO')
  RETURN ReturnValue


Hide:Access:SERVICIOXSOCIO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('SERVICIOXSOCIO')
       DbChangeTrigger.CheckChanges('SERVICIOXSOCIO',SERVICIOXSOCIO) 
    END
  RETURN ReturnValue


Hide:Access:SERVICIOXSOCIO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SERVICIOXSOCIO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SER2:PK_SOCIOS_SERVICIOS,'SER2:PK_SOCIOS_SERVICIOS',0)
    SELF.AddKey(SER2:FK_SERVICIOXSOCIO_SERVICIOS,'SER2:FK_SERVICIOXSOCIO_SERVICIOS',0)
    SELF.AddKey(SER2:FK_SERVICIOXSOCIO_SOCIOS,'SER2:FK_SERVICIOXSOCIO_SOCIOS',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:SERVICIOXSOCIO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS1       USHORT,AUTO
Save:SERVICIOS2    USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('SER2:IDSOCIO')
    Save:SOCIOS1 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = SER2:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS1)
  OF 2
    GlobalErrors.SetField('SER2:IDSERVICIOS')
    Save:SERVICIOS2 = Access:SERVICIOS.SaveFile()
    SER:IDSERVICIOS = SER2:IDSERVICIOS
    ReturnValue = Access:SERVICIOS.TryFetch(SER:PK_SERVICIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SERVICIOS')
      END
    END
    Access:SERVICIOS.RestoreFile(Save:SERVICIOS2)
  END
  RETURN ReturnValue


Hide:Relate:SERVICIOXSOCIO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SERVICIOS)

  SELF.AddRelation(Relate:SOCIOS)


Hide:Relate:SERVICIOXSOCIO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('SERVICIOXSOCIO',SERVICIOXSOCIO)
  RETURN ReturnValue


Hide:Relate:SERVICIOXSOCIO.Kill PROCEDURE

  CODE
  _Hide:Access:SERVICIOXSOCIO.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:SERVICIOXSOCIO &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SERVICIOXSOCIO)                     ! destroy the file manager


Hide:Relate:SERVICIOXSOCIO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('SERVICIOXSOCIO')
       DbChangeTrigger.AddThread('SERVICIOXSOCIO')
       DbChangeTrigger.AddItem(SER2:IDSOCIO, WHO(SER2:RECORD,WHERE(SER2:RECORD,SER2:IDSOCIO)) , 'SERVICIOXSOCIO')
       DbChangeTrigger.AddItem(SER2:IDSERVICIOS, WHO(SER2:RECORD,WHERE(SER2:RECORD,SER2:IDSERVICIOS)) , 'SERVICIOXSOCIO')
       DbChangeTrigger.AddItem(SER2:FECHA, WHO(SER2:RECORD,WHERE(SER2:RECORD,SER2:FECHA)) , 'SERVICIOXSOCIO')
       DbChangeTrigger.AddItem(SER2:HORA, WHO(SER2:RECORD,WHERE(SER2:RECORD,SER2:HORA)) , 'SERVICIOXSOCIO')
    END
    DbChangeTrigger.Update('SERVICIOXSOCIO')


Hide:Relate:SERVICIOXSOCIO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('SERVICIOXSOCIO')
        DbChangeTrigger.CheckChanges('SERVICIOXSOCIO',SERVICIOXSOCIO) 
     END
  RETURN ReturnValue


Hide:Relate:SOCIOS.Init PROCEDURE()
  CODE
  _Hide:Access:SOCIOS.Init
  SELF.Init(Access:SOCIOS,1)


Hide:Access:SOCIOS.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('SOCIOS')
      DbChangeTrigger.AddThread('SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDSOCIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDSOCIO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:MATRICULA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:MATRICULA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDZONA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDZONA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDCOBERTURA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDCOBERTURA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDLOCALIDAD, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDLOCALIDAD)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDUSUARIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDUSUARIO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:NOMBRE, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:NOMBRE)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:N_DOCUMENTO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:N_DOCUMENTO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:DIRECCION, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:DIRECCION)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_ALTA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_ALTA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:EMAIL, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:EMAIL)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_NACIMIENTO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_NACIMIENTO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:NRO_VIEJO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:NRO_VIEJO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:BENEF, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:BENEF)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_BAJA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_BAJA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:OBSERVACION, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:OBSERVACION)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDVENDEDOR, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDVENDEDOR)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:INGRESO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:INGRESO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:DESCUENTO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:DESCUENTO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:MES, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:MES)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:ANO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:ANO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:PERIODO_ALTA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:PERIODO_ALTA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:SEXO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:SEXO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:CANTIDAD, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CANTIDAD)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:HORA_ALTA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:HORA_ALTA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:TELEFONO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:TELEFONO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:DIRECCION_LABORAL, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:DIRECCION_LABORAL)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:TELEFONO_LABORAL, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:TELEFONO_LABORAL)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FIN_COBERTURA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FIN_COBERTURA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:BAJA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:BAJA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:ID_TIPO_DOC, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:ID_TIPO_DOC)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDCIRCULO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDCIRCULO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:LIBRO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:LIBRO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FOLIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FOLIO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:ACTA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:ACTA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:PROVISORIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:PROVISORIO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDINSTITUCION, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDINSTITUCION)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_EGRESO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_EGRESO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:BAJA_TEMPORARIA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:BAJA_TEMPORARIA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:OTRAS_MATRICULAS, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:OTRAS_MATRICULAS)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:OTRAS_CERTIFICACIONES, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:OTRAS_CERTIFICACIONES)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_TITULO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_TITULO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:LUGAR_NACIMIENTO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:LUGAR_NACIMIENTO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:CELULAR, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CELULAR)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDTIPOTITULO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDTIPOTITULO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDMINISTERIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDMINISTERIO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDCS, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDCS)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:LUGAR_TRABAJO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:LUGAR_TRABAJO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:TIPO_TITULO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:TIPO_TITULO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDPROVEEDOR, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDPROVEEDOR)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:TIPOIVA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:TIPOIVA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:CUIT, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CUIT)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDBANCO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDBANCO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:CBU, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CBU)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:ANSSAL, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:ANSSAL)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_ALTA_MIN, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_ALTA_MIN)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:APELLIDO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:APELLIDO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:NOMBRES, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:NOMBRES)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:CUMPLE, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CUMPLE)) , 'SOCIOS')
   END
   DbChangeTrigger.Update('SOCIOS')
  RETURN ReturnValue


Hide:Access:SOCIOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SOC:Record
  SELF.FileNameValue = 'SOCIOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SOCIOS
  PARENT.Init
  Access:SOCIOS &= SELF


Hide:Access:SOCIOS.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('SOCIOS',SOCIOS)
  RETURN ReturnValue


Hide:Access:SOCIOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SOCIOS &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SOCIOS.PrimeFields PROCEDURE

  CODE
  SOC:BAJA_TEMPORARIA = 'NO'                               ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:SOCIOS.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('SOCIOS')
      DbChangeTrigger.AddThread('SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDSOCIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDSOCIO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:MATRICULA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:MATRICULA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDZONA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDZONA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDCOBERTURA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDCOBERTURA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDLOCALIDAD, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDLOCALIDAD)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDUSUARIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDUSUARIO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:NOMBRE, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:NOMBRE)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:N_DOCUMENTO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:N_DOCUMENTO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:DIRECCION, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:DIRECCION)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_ALTA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_ALTA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:EMAIL, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:EMAIL)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_NACIMIENTO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_NACIMIENTO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:NRO_VIEJO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:NRO_VIEJO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:BENEF, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:BENEF)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_BAJA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_BAJA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:OBSERVACION, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:OBSERVACION)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDVENDEDOR, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDVENDEDOR)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:INGRESO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:INGRESO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:DESCUENTO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:DESCUENTO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:MES, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:MES)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:ANO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:ANO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:PERIODO_ALTA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:PERIODO_ALTA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:SEXO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:SEXO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:CANTIDAD, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CANTIDAD)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:HORA_ALTA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:HORA_ALTA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:TELEFONO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:TELEFONO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:DIRECCION_LABORAL, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:DIRECCION_LABORAL)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:TELEFONO_LABORAL, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:TELEFONO_LABORAL)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FIN_COBERTURA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FIN_COBERTURA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:BAJA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:BAJA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:ID_TIPO_DOC, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:ID_TIPO_DOC)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDCIRCULO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDCIRCULO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:LIBRO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:LIBRO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FOLIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FOLIO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:ACTA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:ACTA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:PROVISORIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:PROVISORIO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDINSTITUCION, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDINSTITUCION)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_EGRESO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_EGRESO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:BAJA_TEMPORARIA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:BAJA_TEMPORARIA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:OTRAS_MATRICULAS, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:OTRAS_MATRICULAS)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:OTRAS_CERTIFICACIONES, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:OTRAS_CERTIFICACIONES)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_TITULO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_TITULO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:LUGAR_NACIMIENTO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:LUGAR_NACIMIENTO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:CELULAR, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CELULAR)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDTIPOTITULO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDTIPOTITULO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDMINISTERIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDMINISTERIO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDCS, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDCS)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:LUGAR_TRABAJO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:LUGAR_TRABAJO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:TIPO_TITULO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:TIPO_TITULO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDPROVEEDOR, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDPROVEEDOR)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:TIPOIVA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:TIPOIVA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:CUIT, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CUIT)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDBANCO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDBANCO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:CBU, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CBU)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:ANSSAL, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:ANSSAL)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_ALTA_MIN, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_ALTA_MIN)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:APELLIDO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:APELLIDO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:NOMBRES, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:NOMBRES)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:CUMPLE, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CUMPLE)) , 'SOCIOS')
   END
   DbChangeTrigger.Update('SOCIOS')
  RETURN ReturnValue


Hide:Access:SOCIOS.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('SOCIOS')
      DbChangeTrigger.AddThread('SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDSOCIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDSOCIO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:MATRICULA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:MATRICULA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDZONA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDZONA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDCOBERTURA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDCOBERTURA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDLOCALIDAD, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDLOCALIDAD)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDUSUARIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDUSUARIO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:NOMBRE, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:NOMBRE)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:N_DOCUMENTO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:N_DOCUMENTO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:DIRECCION, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:DIRECCION)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_ALTA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_ALTA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:EMAIL, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:EMAIL)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_NACIMIENTO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_NACIMIENTO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:NRO_VIEJO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:NRO_VIEJO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:BENEF, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:BENEF)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_BAJA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_BAJA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:OBSERVACION, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:OBSERVACION)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDVENDEDOR, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDVENDEDOR)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:INGRESO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:INGRESO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:DESCUENTO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:DESCUENTO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:MES, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:MES)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:ANO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:ANO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:PERIODO_ALTA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:PERIODO_ALTA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:SEXO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:SEXO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:CANTIDAD, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CANTIDAD)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:HORA_ALTA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:HORA_ALTA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:TELEFONO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:TELEFONO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:DIRECCION_LABORAL, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:DIRECCION_LABORAL)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:TELEFONO_LABORAL, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:TELEFONO_LABORAL)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FIN_COBERTURA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FIN_COBERTURA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:BAJA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:BAJA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:ID_TIPO_DOC, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:ID_TIPO_DOC)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDCIRCULO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDCIRCULO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:LIBRO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:LIBRO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FOLIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FOLIO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:ACTA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:ACTA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:PROVISORIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:PROVISORIO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDINSTITUCION, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDINSTITUCION)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_EGRESO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_EGRESO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:BAJA_TEMPORARIA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:BAJA_TEMPORARIA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:OTRAS_MATRICULAS, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:OTRAS_MATRICULAS)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:OTRAS_CERTIFICACIONES, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:OTRAS_CERTIFICACIONES)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_TITULO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_TITULO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:LUGAR_NACIMIENTO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:LUGAR_NACIMIENTO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:CELULAR, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CELULAR)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDTIPOTITULO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDTIPOTITULO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDMINISTERIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDMINISTERIO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDCS, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDCS)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:LUGAR_TRABAJO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:LUGAR_TRABAJO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:TIPO_TITULO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:TIPO_TITULO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDPROVEEDOR, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDPROVEEDOR)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:TIPOIVA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:TIPOIVA)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:CUIT, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CUIT)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:IDBANCO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDBANCO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:CBU, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CBU)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:ANSSAL, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:ANSSAL)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:FECHA_ALTA_MIN, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_ALTA_MIN)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:APELLIDO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:APELLIDO)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:NOMBRES, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:NOMBRES)) , 'SOCIOS')
      DbChangeTrigger.AddItem(SOC:CUMPLE, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CUMPLE)) , 'SOCIOS')
   END
   DbChangeTrigger.Update('SOCIOS')
  RETURN ReturnValue


Hide:Access:SOCIOS.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('SOCIOS')
       DbChangeTrigger.CheckChanges('SOCIOS',SOCIOS) 
    END
  RETURN ReturnValue


Hide:Access:SOCIOS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SOCIOS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SOC:PK_SOCIOS,'SOC:PK_SOCIOS',0)
    SELF.AddKey(SOC:IDX_SOCIOS_DOCUMENTO,'SOC:IDX_SOCIOS_DOCUMENTO',0)
    SELF.AddKey(SOC:IDX_SOCIOS_MATRICULA,'SOC:IDX_SOCIOS_MATRICULA',0)
    SELF.AddKey(SOC:FK_SOCIOS_CIRCULO,'SOC:FK_SOCIOS_CIRCULO',0)
    SELF.AddKey(SOC:FK_SOCIOS_COBERTURA,'SOC:FK_SOCIOS_COBERTURA',0)
    SELF.AddKey(SOC:FK_SOCIOS_INSTITUCION,'SOC:FK_SOCIOS_INSTITUCION',0)
    SELF.AddKey(SOC:FK_SOCIOS_LOCALIDAD,'SOC:FK_SOCIOS_LOCALIDAD',0)
    SELF.AddKey(SOC:FK_SOCIOS_TIPO_DOC,'SOC:FK_SOCIOS_TIPO_DOC',0)
    SELF.AddKey(SOC:FK_SOCIOS_USUARIO,'SOC:FK_SOCIOS_USUARIO',0)
    SELF.AddKey(SOC:FK_SOCIOS_ZONA_VIVENDA,'SOC:FK_SOCIOS_ZONA_VIVENDA',0)
    SELF.AddKey(SOC:IDX_SOCIOS_ACTA,'SOC:IDX_SOCIOS_ACTA',0)
    SELF.AddKey(SOC:IDX_SOCIOS_BAJA,'SOC:IDX_SOCIOS_BAJA',0)
    SELF.AddKey(SOC:IDX_SOCIOS_LIBRO,'SOC:IDX_SOCIOS_LIBRO',0)
    SELF.AddKey(SOC:IDX_SOCIOS_NOMBRE,'SOC:IDX_SOCIOS_NOMBRE',0)
    SELF.AddKey(SOC:IDX_SOCIOS_N_VIEJO,'SOC:IDX_SOCIOS_N_VIEJO',0)
    SELF.AddKey(SOC:IDX_SOCIOS_PROVISORIO,'SOC:IDX_SOCIOS_PROVISORIO',0)
    SELF.AddKey(SOC:IDX_SOCIO_INGRESO,'SOC:IDX_SOCIO_INGRESO',0)
    SELF.AddKey(SOC:FK_SOCIOS_TIPO_TITULO,'SOC:FK_SOCIOS_TIPO_TITULO',0)
    SELF.AddKey(SOC:IDX_SOCIOS_MINISTERIO,'SOC:IDX_SOCIOS_MINISTERIO',0)
    SELF.AddKey(SOC:SOCIOS_CENTRO_SALUD,'SOC:SOCIOS_CENTRO_SALUD',0)
    SELF.AddKey(SOC:IDX_SOCIOS_PROVEEDOR,'SOC:IDX_SOCIOS_PROVEEDOR',0)
    SELF.AddKey(SOC:FK_SOCIOS_TIPO_IVA,'SOC:FK_SOCIOS_TIPO_IVA',0)
    SELF.AddKey(SOC:FK_SOCIOS_BANCO,'SOC:FK_SOCIOS_BANCO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:SOCIOS.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:ZONA_VIVIENDA3 USHORT,AUTO
Save:COBERTURA4    USHORT,AUTO
Save:LOCALIDAD5    USHORT,AUTO
Save:USUARIO6      USHORT,AUTO
Save:TIPO_DOC31    USHORT,AUTO
Save:CIRCULO32     USHORT,AUTO
Save:INSTITUCION37 USHORT,AUTO
Save:TIPO_TITULO45 USHORT,AUTO
Save:BANCO53       USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('SOC:IDZONA')
    Save:ZONA_VIVIENDA3 = Access:ZONA_VIVIENDA.SaveFile()
    ZON:IDZONA = SOC:IDZONA
    ReturnValue = Access:ZONA_VIVIENDA.TryFetch(ZON:PK_ZONA_VIVIENDA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'ZONA_VIVIENDA')
      END
    END
    Access:ZONA_VIVIENDA.RestoreFile(Save:ZONA_VIVIENDA3)
  OF 4
    GlobalErrors.SetField('SOC:IDCOBERTURA')
    Save:COBERTURA4 = Access:COBERTURA.SaveFile()
    COB:IDCOBERTURA = SOC:IDCOBERTURA
    ReturnValue = Access:COBERTURA.TryFetch(COB:PK_COBERTURA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'COBERTURA')
      END
    END
    Access:COBERTURA.RestoreFile(Save:COBERTURA4)
  OF 5
    GlobalErrors.SetField('SOC:IDLOCALIDAD')
    Save:LOCALIDAD5 = Access:LOCALIDAD.SaveFile()
    LOC:IDLOCALIDAD = SOC:IDLOCALIDAD
    ReturnValue = Access:LOCALIDAD.TryFetch(LOC:PK_LOCALIDAD)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'LOCALIDAD')
      END
    END
    Access:LOCALIDAD.RestoreFile(Save:LOCALIDAD5)
  OF 6
    GlobalErrors.SetField('SOC:IDUSUARIO')
    Save:USUARIO6 = Access:USUARIO.SaveFile()
    USU:IDUSUARIO = SOC:IDUSUARIO
    ReturnValue = Access:USUARIO.TryFetch(USU:PK_USUARIO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'USUARIO')
      END
    END
    Access:USUARIO.RestoreFile(Save:USUARIO6)
  OF 31
    GlobalErrors.SetField('SOC:ID_TIPO_DOC')
    Save:TIPO_DOC31 = Access:TIPO_DOC.SaveFile()
    TIP3:ID_TIPO_DOC = SOC:ID_TIPO_DOC
    ReturnValue = Access:TIPO_DOC.TryFetch(TIP3:PK_TIPO_DOC)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_DOC')
      END
    END
    Access:TIPO_DOC.RestoreFile(Save:TIPO_DOC31)
  OF 32
    GlobalErrors.SetField('SOC:IDCIRCULO')
    Save:CIRCULO32 = Access:CIRCULO.SaveFile()
    CIR:IDCIRCULO = SOC:IDCIRCULO
    ReturnValue = Access:CIRCULO.TryFetch(CIR:PK_CIRCULO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CIRCULO')
      END
    END
    Access:CIRCULO.RestoreFile(Save:CIRCULO32)
  OF 37
    GlobalErrors.SetField('SOC:IDINSTITUCION')
    Save:INSTITUCION37 = Access:INSTITUCION.SaveFile()
    INS2:IDINSTITUCION = SOC:IDINSTITUCION
    ReturnValue = Access:INSTITUCION.TryFetch(INS2:PK_INSTITUCION)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'INSTITUCION')
      END
    END
    Access:INSTITUCION.RestoreFile(Save:INSTITUCION37)
  OF 45
    GlobalErrors.SetField('SOC:IDTIPOTITULO')
    Save:TIPO_TITULO45 = Access:TIPO_TITULO.SaveFile()
    TIP6:IDTIPOTITULO = SOC:IDTIPOTITULO
    ReturnValue = Access:TIPO_TITULO.TryFetch(TIP6:PK_TIPO_TITULO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_TITULO')
      END
    END
    Access:TIPO_TITULO.RestoreFile(Save:TIPO_TITULO45)
  OF 53
    GlobalErrors.SetField('SOC:IDBANCO')
    Save:BANCO53 = Access:BANCO.SaveFile()
    BAN2:IDBANCO = SOC:IDBANCO
    ReturnValue = Access:BANCO.TryFetch(BAN2:PK_BANCO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'BANCO')
      END
    END
    Access:BANCO.RestoreFile(Save:BANCO53)
  END
  RETURN ReturnValue


Hide:Relate:SOCIOS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  DO AddRelations_3
  
  DO AddRelations_4
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CONSULTRIO_ADHERENTE,RI:None,RI:None,CON1:FK_CONSULTRIO_ADHERENTE_SOCIO)
  SELF.AddRelationLink(SOC:IDSOCIO,CON1:IDSOCIO)

  SELF.AddRelation(Relate:CIRCULO)

  SELF.AddRelation(Relate:MCENTRO_SALUD)

  SELF.AddRelation(Relate:COBERTURA)

  SELF.AddRelation(Relate:INSTITUCION)

  SELF.AddRelation(Relate:LOCALIDAD)

  SELF.AddRelation(Relate:MINISTERIO)

  SELF.AddRelation(Relate:CONTROL_LIQUIDACION,RI:None,RI:None,CON31:FK_CONTROL_LIQUIDACION)
  SELF.AddRelationLink(SOC:IDSOCIO,CON31:IDSOCIO)

  SELF.AddRelation(Relate:SEGURO,RI:None,RI:None,SEG:FK_SEGURO_SOCIOS)
  SELF.AddRelationLink(SOC:IDSOCIO,SEG:IDSOCIO)

  SELF.AddRelation(Relate:SEGURO_FACTURA,RI:None,RI:None,SEG5:FK_SEGURO_FACTURA_SOCIO)
  SELF.AddRelationLink(SOC:IDSOCIO,SEG5:IDSOCIO)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:PAGOS_LIQUIDACION,RI:None,RI:None,PAGL:FK_PAGOS_LIQUIDACION_SOCIOS)
  SELF.AddRelationLink(SOC:IDSOCIO,PAGL:IDSOCIO)

  SELF.AddRelation(Relate:LIQUIDACIONXSOCIO,RI:None,RI:None,LXSOC:FK_LIQUIDACIONXSOCIO_1)
  SELF.AddRelationLink(SOC:IDSOCIO,LXSOC:IDSOCIO)

  SELF.AddRelation(Relate:LIQUIDACION,RI:None,RI:None,LIQ:FK_LIQUIDACION_SOCIO)
  SELF.AddRelationLink(SOC:IDSOCIO,LIQ:IDSOCIO)

  SELF.AddRelation(Relate:SOCIOSXOS,RI:None,RI:None,SOC3:FK_SOCIOSXOS_SOCIOS)
  SELF.AddRelationLink(SOC:IDSOCIO,SOC3:IDSOCIOS)

  SELF.AddRelation(Relate:SOCIOSXTRABAJO,RI:None,RI:None,SOC2:FK_SOCIOSXTRABAJO_SOCIOS)
  SELF.AddRelationLink(SOC:IDSOCIO,SOC2:IDSOCIOS)

  SELF.AddRelation(Relate:FACTURAXCUPON,RI:None,RI:None,FAC2:FK_FACTURAXCUPON_SOCIO)
  SELF.AddRelationLink(SOC:IDSOCIO,FAC2:IDSOCIO)

  SELF.AddRelation(Relate:PAGO_CONVENIO,RI:None,RI:None,PAGCON:FK_PAGO_CONVENIO_SOCIO)
  SELF.AddRelationLink(SOC:IDSOCIO,PAGCON:IDSOCIO)

  SELF.AddRelation(Relate:PAGOSXCIRCULO,RI:None,RI:None,PAG1:FK_PAGOSXCIRCULO_SOCIO)
  SELF.AddRelationLink(SOC:IDSOCIO,PAG1:IDSOCIO)

  SELF.AddRelation(Relate:AUDITORIA,RI:None,RI:None,AUD:FK_AUDITORIA_SOCIOS)
  SELF.AddRelationLink(SOC:IDSOCIO,AUD:IDSOCIO)

  SELF.AddRelation(Relate:FACTURA,RI:None,RI:None,FAC:FK_FACTURA_SOCIO)
  SELF.AddRelationLink(SOC:IDSOCIO,FAC:IDSOCIO)

AddRelations_3 ROUTINE
  SELF.AddRelation(Relate:CONSULTORIO,RI:None,RI:None,CON2:FK_CONSULTORIO_SOCIOS)
  SELF.AddRelationLink(SOC:IDSOCIO,CON2:IDSOCIO)

  SELF.AddRelation(Relate:CONTROL_FACTURA,RI:None,RI:None,CON3:FK_CONTROL_FACTURA)
  SELF.AddRelationLink(SOC:IDSOCIO,CON3:IDSOCIO)

  SELF.AddRelation(Relate:CONVENIO,RI:None,RI:None,CON4:FK_CONVENIO_SOCIOS)
  SELF.AddRelationLink(SOC:IDSOCIO,CON4:IDSOCIO)

  SELF.AddRelation(Relate:CV,RI:None,RI:None,CV:FK_CV_SOCIOS)
  SELF.AddRelationLink(SOC:IDSOCIO,CV:IDSOCIO)

  SELF.AddRelation(Relate:INSPECTOR,RI:None,RI:None,INS:FK_INSPECTOR_SOCIOS)
  SELF.AddRelationLink(SOC:IDSOCIO,INS:IDSOCIO)

  SELF.AddRelation(Relate:PADRONXESPECIALIDAD,RI:None,RI:None,PAD:FK_PADRONXESPECIALIDAD_SOCI)
  SELF.AddRelationLink(SOC:IDSOCIO,PAD:IDSOCIO)

  SELF.AddRelation(Relate:PAGOS,RI:None,RI:None,PAG:FK_PAGOS_SOCIOS)
  SELF.AddRelationLink(SOC:IDSOCIO,PAG:IDSOCIO)

  SELF.AddRelation(Relate:RENUNCIA,RI:None,RI:None,REN:FK_RENUNCIA_SOCIOS)
  SELF.AddRelationLink(SOC:IDSOCIO,REN:IDSOCIO)

  SELF.AddRelation(Relate:SERVICIOXSOCIO,RI:None,RI:None,SER2:FK_SERVICIOXSOCIO_SOCIOS)
  SELF.AddRelationLink(SOC:IDSOCIO,SER2:IDSOCIO)

  SELF.AddRelation(Relate:TIPO_DOC)

AddRelations_4 ROUTINE
  SELF.AddRelation(Relate:USUARIO)

  SELF.AddRelation(Relate:ZONA_VIVIENDA)

  SELF.AddRelation(Relate:TIPO_TITULO)

  SELF.AddRelation(Relate:TIPO_IVA)

  SELF.AddRelation(Relate:BANCO)

  SELF.AddRelation(Relate:PROVEEDORES,RI:None,RI:None,PRO2:PK_PROVEEDOR)
  SELF.AddRelationLink(SOC:IDPROVEEDOR,PRO2:IDPROVEEDOR)

  SELF.AddRelation(Relate:INGRESOS_FACTURA,RI:None,RI:None,ING2:FK_INGRESOS_FACTURA_SOCIO)
  SELF.AddRelationLink(SOC:IDSOCIO,ING2:IDSOCIO)


Hide:Relate:SOCIOS.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('SOCIOS',SOCIOS)
  RETURN ReturnValue


Hide:Relate:SOCIOS.Kill PROCEDURE

  CODE
  _Hide:Access:SOCIOS.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:SOCIOS &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SOCIOS)                             ! destroy the file manager


Hide:Relate:SOCIOS.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('SOCIOS')
       DbChangeTrigger.AddThread('SOCIOS')
       DbChangeTrigger.AddItem(SOC:IDSOCIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDSOCIO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:MATRICULA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:MATRICULA)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:IDZONA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDZONA)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:IDCOBERTURA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDCOBERTURA)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:IDLOCALIDAD, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDLOCALIDAD)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:IDUSUARIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDUSUARIO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:NOMBRE, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:NOMBRE)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:N_DOCUMENTO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:N_DOCUMENTO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:DIRECCION, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:DIRECCION)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:FECHA_ALTA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_ALTA)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:EMAIL, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:EMAIL)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:FECHA_NACIMIENTO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_NACIMIENTO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:NRO_VIEJO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:NRO_VIEJO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:BENEF, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:BENEF)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:FECHA_BAJA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_BAJA)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:OBSERVACION, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:OBSERVACION)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:IDVENDEDOR, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDVENDEDOR)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:INGRESO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:INGRESO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:DESCUENTO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:DESCUENTO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:MES, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:MES)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:ANO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:ANO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:PERIODO_ALTA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:PERIODO_ALTA)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:SEXO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:SEXO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:CANTIDAD, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CANTIDAD)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:HORA_ALTA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:HORA_ALTA)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:TELEFONO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:TELEFONO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:DIRECCION_LABORAL, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:DIRECCION_LABORAL)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:TELEFONO_LABORAL, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:TELEFONO_LABORAL)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:FIN_COBERTURA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FIN_COBERTURA)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:BAJA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:BAJA)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:ID_TIPO_DOC, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:ID_TIPO_DOC)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:IDCIRCULO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDCIRCULO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:LIBRO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:LIBRO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:FOLIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FOLIO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:ACTA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:ACTA)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:PROVISORIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:PROVISORIO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:IDINSTITUCION, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDINSTITUCION)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:FECHA_EGRESO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_EGRESO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:BAJA_TEMPORARIA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:BAJA_TEMPORARIA)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:OTRAS_MATRICULAS, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:OTRAS_MATRICULAS)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:OTRAS_CERTIFICACIONES, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:OTRAS_CERTIFICACIONES)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:FECHA_TITULO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_TITULO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:LUGAR_NACIMIENTO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:LUGAR_NACIMIENTO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:CELULAR, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CELULAR)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:IDTIPOTITULO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDTIPOTITULO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:IDMINISTERIO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDMINISTERIO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:IDCS, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDCS)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:LUGAR_TRABAJO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:LUGAR_TRABAJO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:TIPO_TITULO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:TIPO_TITULO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:IDPROVEEDOR, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDPROVEEDOR)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:TIPOIVA, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:TIPOIVA)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:CUIT, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CUIT)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:IDBANCO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:IDBANCO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:CBU, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CBU)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:ANSSAL, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:ANSSAL)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:FECHA_ALTA_MIN, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:FECHA_ALTA_MIN)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:APELLIDO, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:APELLIDO)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:NOMBRES, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:NOMBRES)) , 'SOCIOS')
       DbChangeTrigger.AddItem(SOC:CUMPLE, WHO(SOC:RECORD,WHERE(SOC:RECORD,SOC:CUMPLE)) , 'SOCIOS')
    END
    DbChangeTrigger.Update('SOCIOS')


Hide:Relate:SOCIOS.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('SOCIOS')
        DbChangeTrigger.CheckChanges('SOCIOS',SOCIOS) 
     END
  RETURN ReturnValue


Hide:Relate:TIPO_CONVENIO.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_CONVENIO.Init
  SELF.Init(Access:TIPO_CONVENIO,1)


Hide:Access:TIPO_CONVENIO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_CONVENIO')
      DbChangeTrigger.AddThread('TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:IDTIPO_CONVENIO, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:IDTIPO_CONVENIO)) , 'TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:DESCRIPCION, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:DESCRIPCION)) , 'TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:INTERES, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:INTERES)) , 'TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:GASTO_ADMINISTRATIVO, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:GASTO_ADMINISTRATIVO)) , 'TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:CANCELA_CUOTA, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:CANCELA_CUOTA)) , 'TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:CALCULA_DEUDA, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:CALCULA_DEUDA)) , 'TIPO_CONVENIO')
   END
   DbChangeTrigger.Update('TIPO_CONVENIO')
  RETURN ReturnValue


Hide:Access:TIPO_CONVENIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIP:Record
  SELF.FileNameValue = 'TIPO_CONVENIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_CONVENIO
  PARENT.Init
  Access:TIPO_CONVENIO &= SELF


Hide:Access:TIPO_CONVENIO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('TIPO_CONVENIO',TIPO_CONVENIO)
  RETURN ReturnValue


Hide:Access:TIPO_CONVENIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_CONVENIO &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TIPO_CONVENIO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('TIPO_CONVENIO')
      DbChangeTrigger.AddThread('TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:IDTIPO_CONVENIO, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:IDTIPO_CONVENIO)) , 'TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:DESCRIPCION, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:DESCRIPCION)) , 'TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:INTERES, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:INTERES)) , 'TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:GASTO_ADMINISTRATIVO, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:GASTO_ADMINISTRATIVO)) , 'TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:CANCELA_CUOTA, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:CANCELA_CUOTA)) , 'TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:CALCULA_DEUDA, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:CALCULA_DEUDA)) , 'TIPO_CONVENIO')
   END
   DbChangeTrigger.Update('TIPO_CONVENIO')
  RETURN ReturnValue


Hide:Access:TIPO_CONVENIO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_CONVENIO')
      DbChangeTrigger.AddThread('TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:IDTIPO_CONVENIO, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:IDTIPO_CONVENIO)) , 'TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:DESCRIPCION, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:DESCRIPCION)) , 'TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:INTERES, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:INTERES)) , 'TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:GASTO_ADMINISTRATIVO, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:GASTO_ADMINISTRATIVO)) , 'TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:CANCELA_CUOTA, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:CANCELA_CUOTA)) , 'TIPO_CONVENIO')
      DbChangeTrigger.AddItem(TIP:CALCULA_DEUDA, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:CALCULA_DEUDA)) , 'TIPO_CONVENIO')
   END
   DbChangeTrigger.Update('TIPO_CONVENIO')
  RETURN ReturnValue


Hide:Access:TIPO_CONVENIO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('TIPO_CONVENIO')
       DbChangeTrigger.CheckChanges('TIPO_CONVENIO',TIPO_CONVENIO) 
    END
  RETURN ReturnValue


Hide:Access:TIPO_CONVENIO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TIPO_CONVENIO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TIP:PK_T_CONVENIO,'TIP:PK_T_CONVENIO',0)
    SELF.AddKey(TIP:IDX_TIPO_CONVENIO_DESCRIPCION,'TIP:IDX_TIPO_CONVENIO_DESCRIPCION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TIPO_CONVENIO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CONVENIO,RI:None,RI:None,CON4:FK_CONVENIO_TIPO)
  SELF.AddRelationLink(TIP:IDTIPO_CONVENIO,CON4:IDTIPO_CONVENIO)


Hide:Relate:TIPO_CONVENIO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('TIPO_CONVENIO',TIPO_CONVENIO)
  RETURN ReturnValue


Hide:Relate:TIPO_CONVENIO.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_CONVENIO.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_CONVENIO &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_CONVENIO)                      ! destroy the file manager


Hide:Relate:TIPO_CONVENIO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('TIPO_CONVENIO')
       DbChangeTrigger.AddThread('TIPO_CONVENIO')
       DbChangeTrigger.AddItem(TIP:IDTIPO_CONVENIO, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:IDTIPO_CONVENIO)) , 'TIPO_CONVENIO')
       DbChangeTrigger.AddItem(TIP:DESCRIPCION, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:DESCRIPCION)) , 'TIPO_CONVENIO')
       DbChangeTrigger.AddItem(TIP:INTERES, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:INTERES)) , 'TIPO_CONVENIO')
       DbChangeTrigger.AddItem(TIP:GASTO_ADMINISTRATIVO, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:GASTO_ADMINISTRATIVO)) , 'TIPO_CONVENIO')
       DbChangeTrigger.AddItem(TIP:CANCELA_CUOTA, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:CANCELA_CUOTA)) , 'TIPO_CONVENIO')
       DbChangeTrigger.AddItem(TIP:CALCULA_DEUDA, WHO(TIP:RECORD,WHERE(TIP:RECORD,TIP:CALCULA_DEUDA)) , 'TIPO_CONVENIO')
    END
    DbChangeTrigger.Update('TIPO_CONVENIO')


Hide:Relate:TIPO_CONVENIO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('TIPO_CONVENIO')
        DbChangeTrigger.CheckChanges('TIPO_CONVENIO',TIPO_CONVENIO) 
     END
  RETURN ReturnValue


Hide:Relate:PAGOSXCIRCULO.Init PROCEDURE()
  CODE
  _Hide:Access:PAGOSXCIRCULO.Init
  SELF.Init(Access:PAGOSXCIRCULO,1)


Hide:Access:PAGOSXCIRCULO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('PAGOSXCIRCULO')
      DbChangeTrigger.AddThread('PAGOSXCIRCULO')
      DbChangeTrigger.AddItem(PAG1:IDSOCIO, WHO(PAG1:RECORD,WHERE(PAG1:RECORD,PAG1:IDSOCIO)) , 'PAGOSXCIRCULO')
      DbChangeTrigger.AddItem(PAG1:IDCIRCULO, WHO(PAG1:RECORD,WHERE(PAG1:RECORD,PAG1:IDCIRCULO)) , 'PAGOSXCIRCULO')
   END
   DbChangeTrigger.Update('PAGOSXCIRCULO')
  RETURN ReturnValue


Hide:Access:PAGOSXCIRCULO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PAG1:Record
  SELF.FileNameValue = 'PAGOSXCIRCULO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PAGOSXCIRCULO
  PARENT.Init
  Access:PAGOSXCIRCULO &= SELF


Hide:Access:PAGOSXCIRCULO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('PAGOSXCIRCULO',PAGOSXCIRCULO)
  RETURN ReturnValue


Hide:Access:PAGOSXCIRCULO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PAGOSXCIRCULO &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PAGOSXCIRCULO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('PAGOSXCIRCULO')
      DbChangeTrigger.AddThread('PAGOSXCIRCULO')
      DbChangeTrigger.AddItem(PAG1:IDSOCIO, WHO(PAG1:RECORD,WHERE(PAG1:RECORD,PAG1:IDSOCIO)) , 'PAGOSXCIRCULO')
      DbChangeTrigger.AddItem(PAG1:IDCIRCULO, WHO(PAG1:RECORD,WHERE(PAG1:RECORD,PAG1:IDCIRCULO)) , 'PAGOSXCIRCULO')
   END
   DbChangeTrigger.Update('PAGOSXCIRCULO')
  RETURN ReturnValue


Hide:Access:PAGOSXCIRCULO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('PAGOSXCIRCULO')
      DbChangeTrigger.AddThread('PAGOSXCIRCULO')
      DbChangeTrigger.AddItem(PAG1:IDSOCIO, WHO(PAG1:RECORD,WHERE(PAG1:RECORD,PAG1:IDSOCIO)) , 'PAGOSXCIRCULO')
      DbChangeTrigger.AddItem(PAG1:IDCIRCULO, WHO(PAG1:RECORD,WHERE(PAG1:RECORD,PAG1:IDCIRCULO)) , 'PAGOSXCIRCULO')
   END
   DbChangeTrigger.Update('PAGOSXCIRCULO')
  RETURN ReturnValue


Hide:Access:PAGOSXCIRCULO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('PAGOSXCIRCULO')
       DbChangeTrigger.CheckChanges('PAGOSXCIRCULO',PAGOSXCIRCULO) 
    END
  RETURN ReturnValue


Hide:Access:PAGOSXCIRCULO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PAGOSXCIRCULO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PAG1:PK_PAGOSXCIRCULO,'PAG1:PK_PAGOSXCIRCULO',0)
    SELF.AddKey(PAG1:FK_PAGOSXCIRCULO_SOCIO,'PAG1:FK_PAGOSXCIRCULO_SOCIO',0)
    SELF.AddKey(PAG1:FK_PAGOSXCIRCULO_CIRCULO,'PAG1:FK_PAGOSXCIRCULO_CIRCULO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:PAGOSXCIRCULO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS1       USHORT,AUTO
Save:CIRCULO2      USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('PAG1:IDSOCIO')
    Save:SOCIOS1 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = PAG1:IDSOCIO
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS1)
  OF 2
    GlobalErrors.SetField('PAG1:IDCIRCULO')
    Save:CIRCULO2 = Access:CIRCULO.SaveFile()
    CIR:IDCIRCULO = PAG1:IDCIRCULO
    ReturnValue = Access:CIRCULO.TryFetch(CIR:PK_CIRCULO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CIRCULO')
      END
    END
    Access:CIRCULO.RestoreFile(Save:CIRCULO2)
  END
  RETURN ReturnValue


Hide:Relate:PAGOSXCIRCULO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CIRCULO)

  SELF.AddRelation(Relate:SOCIOS)


Hide:Relate:PAGOSXCIRCULO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('PAGOSXCIRCULO',PAGOSXCIRCULO)
  RETURN ReturnValue


Hide:Relate:PAGOSXCIRCULO.Kill PROCEDURE

  CODE
  _Hide:Access:PAGOSXCIRCULO.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:PAGOSXCIRCULO &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PAGOSXCIRCULO)                      ! destroy the file manager


Hide:Relate:PAGOSXCIRCULO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('PAGOSXCIRCULO')
       DbChangeTrigger.AddThread('PAGOSXCIRCULO')
       DbChangeTrigger.AddItem(PAG1:IDSOCIO, WHO(PAG1:RECORD,WHERE(PAG1:RECORD,PAG1:IDSOCIO)) , 'PAGOSXCIRCULO')
       DbChangeTrigger.AddItem(PAG1:IDCIRCULO, WHO(PAG1:RECORD,WHERE(PAG1:RECORD,PAG1:IDCIRCULO)) , 'PAGOSXCIRCULO')
    END
    DbChangeTrigger.Update('PAGOSXCIRCULO')


Hide:Relate:PAGOSXCIRCULO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('PAGOSXCIRCULO')
        DbChangeTrigger.CheckChanges('PAGOSXCIRCULO',PAGOSXCIRCULO) 
     END
  RETURN ReturnValue


Hide:Relate:TIPO_CURSO.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_CURSO.Init
  SELF.Init(Access:TIPO_CURSO,1)


Hide:Access:TIPO_CURSO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_CURSO')
      DbChangeTrigger.AddThread('TIPO_CURSO')
      DbChangeTrigger.AddItem(TIP2:ID_TIPO_CURSO, WHO(TIP2:RECORD,WHERE(TIP2:RECORD,TIP2:ID_TIPO_CURSO)) , 'TIPO_CURSO')
      DbChangeTrigger.AddItem(TIP2:DESCRIPCION, WHO(TIP2:RECORD,WHERE(TIP2:RECORD,TIP2:DESCRIPCION)) , 'TIPO_CURSO')
      DbChangeTrigger.AddItem(TIP2:GRADO, WHO(TIP2:RECORD,WHERE(TIP2:RECORD,TIP2:GRADO)) , 'TIPO_CURSO')
   END
   DbChangeTrigger.Update('TIPO_CURSO')
  RETURN ReturnValue


Hide:Access:TIPO_CURSO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIP2:Record
  SELF.FileNameValue = 'TIPO_CURSO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_CURSO
  PARENT.Init
  Access:TIPO_CURSO &= SELF


Hide:Access:TIPO_CURSO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('TIPO_CURSO',TIPO_CURSO)
  RETURN ReturnValue


Hide:Access:TIPO_CURSO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_CURSO &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TIPO_CURSO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('TIPO_CURSO')
      DbChangeTrigger.AddThread('TIPO_CURSO')
      DbChangeTrigger.AddItem(TIP2:ID_TIPO_CURSO, WHO(TIP2:RECORD,WHERE(TIP2:RECORD,TIP2:ID_TIPO_CURSO)) , 'TIPO_CURSO')
      DbChangeTrigger.AddItem(TIP2:DESCRIPCION, WHO(TIP2:RECORD,WHERE(TIP2:RECORD,TIP2:DESCRIPCION)) , 'TIPO_CURSO')
      DbChangeTrigger.AddItem(TIP2:GRADO, WHO(TIP2:RECORD,WHERE(TIP2:RECORD,TIP2:GRADO)) , 'TIPO_CURSO')
   END
   DbChangeTrigger.Update('TIPO_CURSO')
  RETURN ReturnValue


Hide:Access:TIPO_CURSO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_CURSO')
      DbChangeTrigger.AddThread('TIPO_CURSO')
      DbChangeTrigger.AddItem(TIP2:ID_TIPO_CURSO, WHO(TIP2:RECORD,WHERE(TIP2:RECORD,TIP2:ID_TIPO_CURSO)) , 'TIPO_CURSO')
      DbChangeTrigger.AddItem(TIP2:DESCRIPCION, WHO(TIP2:RECORD,WHERE(TIP2:RECORD,TIP2:DESCRIPCION)) , 'TIPO_CURSO')
      DbChangeTrigger.AddItem(TIP2:GRADO, WHO(TIP2:RECORD,WHERE(TIP2:RECORD,TIP2:GRADO)) , 'TIPO_CURSO')
   END
   DbChangeTrigger.Update('TIPO_CURSO')
  RETURN ReturnValue


Hide:Access:TIPO_CURSO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('TIPO_CURSO')
       DbChangeTrigger.CheckChanges('TIPO_CURSO',TIPO_CURSO) 
    END
  RETURN ReturnValue


Hide:Access:TIPO_CURSO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TIPO_CURSO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TIP2:PK_T_CURSO,'TIP2:PK_T_CURSO',0)
    SELF.AddKey(TIP2:IDX_DESCRIPCION,'TIP2:IDX_DESCRIPCION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TIPO_CURSO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CURSO,RI:None,RI:None,CUR:FK_CURSO_TIPO_CURSO)
  SELF.AddRelationLink(TIP2:ID_TIPO_CURSO,CUR:ID_TIPO_CURSO)

  SELF.AddRelation(Relate:CV,RI:None,RI:None,CV:FK_CV_T_CURSO)
  SELF.AddRelationLink(TIP2:ID_TIPO_CURSO,CV:ID_TIPO_CURSO)


Hide:Relate:TIPO_CURSO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('TIPO_CURSO',TIPO_CURSO)
  RETURN ReturnValue


Hide:Relate:TIPO_CURSO.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_CURSO.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_CURSO &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_CURSO)                         ! destroy the file manager


Hide:Relate:TIPO_CURSO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('TIPO_CURSO')
       DbChangeTrigger.AddThread('TIPO_CURSO')
       DbChangeTrigger.AddItem(TIP2:ID_TIPO_CURSO, WHO(TIP2:RECORD,WHERE(TIP2:RECORD,TIP2:ID_TIPO_CURSO)) , 'TIPO_CURSO')
       DbChangeTrigger.AddItem(TIP2:DESCRIPCION, WHO(TIP2:RECORD,WHERE(TIP2:RECORD,TIP2:DESCRIPCION)) , 'TIPO_CURSO')
       DbChangeTrigger.AddItem(TIP2:GRADO, WHO(TIP2:RECORD,WHERE(TIP2:RECORD,TIP2:GRADO)) , 'TIPO_CURSO')
    END
    DbChangeTrigger.Update('TIPO_CURSO')


Hide:Relate:TIPO_CURSO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('TIPO_CURSO')
        DbChangeTrigger.CheckChanges('TIPO_CURSO',TIPO_CURSO) 
     END
  RETURN ReturnValue


Hide:Relate:TIPO_DOC.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_DOC.Init
  SELF.Init(Access:TIPO_DOC,1)


Hide:Access:TIPO_DOC.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_DOC')
      DbChangeTrigger.AddThread('TIPO_DOC')
      DbChangeTrigger.AddItem(TIP3:ID_TIPO_DOC, WHO(TIP3:RECORD,WHERE(TIP3:RECORD,TIP3:ID_TIPO_DOC)) , 'TIPO_DOC')
      DbChangeTrigger.AddItem(TIP3:DESCRIPCION, WHO(TIP3:RECORD,WHERE(TIP3:RECORD,TIP3:DESCRIPCION)) , 'TIPO_DOC')
   END
   DbChangeTrigger.Update('TIPO_DOC')
  RETURN ReturnValue


Hide:Access:TIPO_DOC.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIP3:Record
  SELF.FileNameValue = 'TIPO_DOC'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_DOC
  PARENT.Init
  Access:TIPO_DOC &= SELF


Hide:Access:TIPO_DOC.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('TIPO_DOC',TIPO_DOC)
  RETURN ReturnValue


Hide:Access:TIPO_DOC.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_DOC &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TIPO_DOC.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('TIPO_DOC')
      DbChangeTrigger.AddThread('TIPO_DOC')
      DbChangeTrigger.AddItem(TIP3:ID_TIPO_DOC, WHO(TIP3:RECORD,WHERE(TIP3:RECORD,TIP3:ID_TIPO_DOC)) , 'TIPO_DOC')
      DbChangeTrigger.AddItem(TIP3:DESCRIPCION, WHO(TIP3:RECORD,WHERE(TIP3:RECORD,TIP3:DESCRIPCION)) , 'TIPO_DOC')
   END
   DbChangeTrigger.Update('TIPO_DOC')
  RETURN ReturnValue


Hide:Access:TIPO_DOC.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_DOC')
      DbChangeTrigger.AddThread('TIPO_DOC')
      DbChangeTrigger.AddItem(TIP3:ID_TIPO_DOC, WHO(TIP3:RECORD,WHERE(TIP3:RECORD,TIP3:ID_TIPO_DOC)) , 'TIPO_DOC')
      DbChangeTrigger.AddItem(TIP3:DESCRIPCION, WHO(TIP3:RECORD,WHERE(TIP3:RECORD,TIP3:DESCRIPCION)) , 'TIPO_DOC')
   END
   DbChangeTrigger.Update('TIPO_DOC')
  RETURN ReturnValue


Hide:Access:TIPO_DOC.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('TIPO_DOC')
       DbChangeTrigger.CheckChanges('TIPO_DOC',TIPO_DOC) 
    END
  RETURN ReturnValue


Hide:Access:TIPO_DOC.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TIPO_DOC,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TIP3:PK_TIPO_DOC,'TIP3:PK_TIPO_DOC',0)
    SELF.AddKey(TIP3:IDX_TIPO_DOC_DESCIPCION,'TIP3:IDX_TIPO_DOC_DESCIPCION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TIPO_DOC.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_TIPO_DOC)
  SELF.AddRelationLink(TIP3:ID_TIPO_DOC,SOC:ID_TIPO_DOC)


Hide:Relate:TIPO_DOC.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('TIPO_DOC',TIPO_DOC)
  RETURN ReturnValue


Hide:Relate:TIPO_DOC.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_DOC.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_DOC &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_DOC)                           ! destroy the file manager


Hide:Relate:TIPO_DOC.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('TIPO_DOC')
       DbChangeTrigger.AddThread('TIPO_DOC')
       DbChangeTrigger.AddItem(TIP3:ID_TIPO_DOC, WHO(TIP3:RECORD,WHERE(TIP3:RECORD,TIP3:ID_TIPO_DOC)) , 'TIPO_DOC')
       DbChangeTrigger.AddItem(TIP3:DESCRIPCION, WHO(TIP3:RECORD,WHERE(TIP3:RECORD,TIP3:DESCRIPCION)) , 'TIPO_DOC')
    END
    DbChangeTrigger.Update('TIPO_DOC')


Hide:Relate:TIPO_DOC.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('TIPO_DOC')
        DbChangeTrigger.CheckChanges('TIPO_DOC',TIPO_DOC) 
     END
  RETURN ReturnValue


Hide:Relate:TIPO_INSTITUCION.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_INSTITUCION.Init
  SELF.Init(Access:TIPO_INSTITUCION,1)


Hide:Access:TIPO_INSTITUCION.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_INSTITUCION')
      DbChangeTrigger.AddThread('TIPO_INSTITUCION')
      DbChangeTrigger.AddItem(TIP4:IDTIPO_INSTITUCION, WHO(TIP4:RECORD,WHERE(TIP4:RECORD,TIP4:IDTIPO_INSTITUCION)) , 'TIPO_INSTITUCION')
      DbChangeTrigger.AddItem(TIP4:DESCRIPCION, WHO(TIP4:RECORD,WHERE(TIP4:RECORD,TIP4:DESCRIPCION)) , 'TIPO_INSTITUCION')
   END
   DbChangeTrigger.Update('TIPO_INSTITUCION')
  RETURN ReturnValue


Hide:Access:TIPO_INSTITUCION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIP4:Record
  SELF.FileNameValue = 'TIPO_INSTITUCION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_INSTITUCION
  PARENT.Init
  Access:TIPO_INSTITUCION &= SELF


Hide:Access:TIPO_INSTITUCION.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('TIPO_INSTITUCION',TIPO_INSTITUCION)
  RETURN ReturnValue


Hide:Access:TIPO_INSTITUCION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_INSTITUCION &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TIPO_INSTITUCION.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('TIPO_INSTITUCION')
      DbChangeTrigger.AddThread('TIPO_INSTITUCION')
      DbChangeTrigger.AddItem(TIP4:IDTIPO_INSTITUCION, WHO(TIP4:RECORD,WHERE(TIP4:RECORD,TIP4:IDTIPO_INSTITUCION)) , 'TIPO_INSTITUCION')
      DbChangeTrigger.AddItem(TIP4:DESCRIPCION, WHO(TIP4:RECORD,WHERE(TIP4:RECORD,TIP4:DESCRIPCION)) , 'TIPO_INSTITUCION')
   END
   DbChangeTrigger.Update('TIPO_INSTITUCION')
  RETURN ReturnValue


Hide:Access:TIPO_INSTITUCION.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_INSTITUCION')
      DbChangeTrigger.AddThread('TIPO_INSTITUCION')
      DbChangeTrigger.AddItem(TIP4:IDTIPO_INSTITUCION, WHO(TIP4:RECORD,WHERE(TIP4:RECORD,TIP4:IDTIPO_INSTITUCION)) , 'TIPO_INSTITUCION')
      DbChangeTrigger.AddItem(TIP4:DESCRIPCION, WHO(TIP4:RECORD,WHERE(TIP4:RECORD,TIP4:DESCRIPCION)) , 'TIPO_INSTITUCION')
   END
   DbChangeTrigger.Update('TIPO_INSTITUCION')
  RETURN ReturnValue


Hide:Access:TIPO_INSTITUCION.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('TIPO_INSTITUCION')
       DbChangeTrigger.CheckChanges('TIPO_INSTITUCION',TIPO_INSTITUCION) 
    END
  RETURN ReturnValue


Hide:Access:TIPO_INSTITUCION.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TIPO_INSTITUCION,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TIP4:PK_T_INSTITUCION,'TIP4:PK_T_INSTITUCION',0)
    SELF.AddKey(TIP4:IDX_T_INST_DESCRIPCION,'TIP4:IDX_T_INST_DESCRIPCION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TIPO_INSTITUCION.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:INSTITUCION,RI:None,RI:None,INS2:FK_INSTITUCION_TIPO)
  SELF.AddRelationLink(TIP4:IDTIPO_INSTITUCION,INS2:IDTIPO_INSTITUCION)


Hide:Relate:TIPO_INSTITUCION.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('TIPO_INSTITUCION',TIPO_INSTITUCION)
  RETURN ReturnValue


Hide:Relate:TIPO_INSTITUCION.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_INSTITUCION.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_INSTITUCION &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_INSTITUCION)                   ! destroy the file manager


Hide:Relate:TIPO_INSTITUCION.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('TIPO_INSTITUCION')
       DbChangeTrigger.AddThread('TIPO_INSTITUCION')
       DbChangeTrigger.AddItem(TIP4:IDTIPO_INSTITUCION, WHO(TIP4:RECORD,WHERE(TIP4:RECORD,TIP4:IDTIPO_INSTITUCION)) , 'TIPO_INSTITUCION')
       DbChangeTrigger.AddItem(TIP4:DESCRIPCION, WHO(TIP4:RECORD,WHERE(TIP4:RECORD,TIP4:DESCRIPCION)) , 'TIPO_INSTITUCION')
    END
    DbChangeTrigger.Update('TIPO_INSTITUCION')


Hide:Relate:TIPO_INSTITUCION.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('TIPO_INSTITUCION')
        DbChangeTrigger.CheckChanges('TIPO_INSTITUCION',TIPO_INSTITUCION) 
     END
  RETURN ReturnValue


Hide:Relate:LIQUIDACION_ENTREGA_BANCO.Init PROCEDURE()
  CODE
  _Hide:Access:LIQUIDACION_ENTREGA_BANCO.Init
  SELF.Init(Access:LIQUIDACION_ENTREGA_BANCO,1)


Hide:Access:LIQUIDACION_ENTREGA_BANCO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddThread('LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:IDENTREGABNCO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:IDENTREGABNCO)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:DESCRIPCION, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:DESCRIPCION)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:FECHA, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:FECHA)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:HORA, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:HORA)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:IDUSUARIO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:IDUSUARIO)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:MES, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:MES)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:ANO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:ANO)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:PERIODO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:PERIODO)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:IDOS, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:IDOS)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:SECUENCIA, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:SECUENCIA)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:TIPO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:TIPO)) , 'LIQUIDACION_ENTREGA_BANCO')
   END
   DbChangeTrigger.Update('LIQUIDACION_ENTREGA_BANCO')
  RETURN ReturnValue


Hide:Access:LIQUIDACION_ENTREGA_BANCO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= BCO:Record
  SELF.FileNameValue = 'LIQUIDACION_ENTREGA_BANCO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LIQUIDACION_ENTREGA_BANCO
  PARENT.Init
  Access:LIQUIDACION_ENTREGA_BANCO &= SELF


Hide:Access:LIQUIDACION_ENTREGA_BANCO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('LIQUIDACION_ENTREGA_BANCO',LIQUIDACION_ENTREGA_BANCO)
  RETURN ReturnValue


Hide:Access:LIQUIDACION_ENTREGA_BANCO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LIQUIDACION_ENTREGA_BANCO &= NULL                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LIQUIDACION_ENTREGA_BANCO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddThread('LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:IDENTREGABNCO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:IDENTREGABNCO)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:DESCRIPCION, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:DESCRIPCION)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:FECHA, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:FECHA)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:HORA, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:HORA)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:IDUSUARIO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:IDUSUARIO)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:MES, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:MES)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:ANO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:ANO)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:PERIODO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:PERIODO)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:IDOS, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:IDOS)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:SECUENCIA, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:SECUENCIA)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:TIPO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:TIPO)) , 'LIQUIDACION_ENTREGA_BANCO')
   END
   DbChangeTrigger.Update('LIQUIDACION_ENTREGA_BANCO')
  RETURN ReturnValue


Hide:Access:LIQUIDACION_ENTREGA_BANCO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddThread('LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:IDENTREGABNCO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:IDENTREGABNCO)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:DESCRIPCION, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:DESCRIPCION)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:FECHA, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:FECHA)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:HORA, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:HORA)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:IDUSUARIO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:IDUSUARIO)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:MES, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:MES)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:ANO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:ANO)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:PERIODO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:PERIODO)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:IDOS, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:IDOS)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:SECUENCIA, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:SECUENCIA)) , 'LIQUIDACION_ENTREGA_BANCO')
      DbChangeTrigger.AddItem(BCO:TIPO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:TIPO)) , 'LIQUIDACION_ENTREGA_BANCO')
   END
   DbChangeTrigger.Update('LIQUIDACION_ENTREGA_BANCO')
  RETURN ReturnValue


Hide:Access:LIQUIDACION_ENTREGA_BANCO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('LIQUIDACION_ENTREGA_BANCO')
       DbChangeTrigger.CheckChanges('LIQUIDACION_ENTREGA_BANCO',LIQUIDACION_ENTREGA_BANCO) 
    END
  RETURN ReturnValue


Hide:Access:LIQUIDACION_ENTREGA_BANCO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LIQUIDACION_ENTREGA_BANCO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(BCO:FK_LIQUIDACION_ENTREGA_BANCO_OS,'BCO:FK_LIQUIDACION_ENTREGA_BANCO_OS',0)
    SELF.AddKey(BCO:FK_LIQUIDACION_ENTREGA_BANCO_US,'BCO:FK_LIQUIDACION_ENTREGA_BANCO_US',0)
    SELF.AddKey(BCO:LIQUIDACION_ENTREGA_BANCO_UNIKE,'BCO:LIQUIDACION_ENTREGA_BANCO_UNIKE',0)
    SELF.AddKey(BCO:PK_LIQUIDACION_ENTREGA_BANCO,'BCO:PK_LIQUIDACION_ENTREGA_BANCO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LIQUIDACION_ENTREGA_BANCO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:USUARIO)

  SELF.AddRelation(Relate:OBRA_SOCIAL)


Hide:Relate:LIQUIDACION_ENTREGA_BANCO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('LIQUIDACION_ENTREGA_BANCO',LIQUIDACION_ENTREGA_BANCO)
  RETURN ReturnValue


Hide:Relate:LIQUIDACION_ENTREGA_BANCO.Kill PROCEDURE

  CODE
  _Hide:Access:LIQUIDACION_ENTREGA_BANCO.Kill              ! Kill the file manager
  PARENT.Kill
  Relate:LIQUIDACION_ENTREGA_BANCO &= NULL                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LIQUIDACION_ENTREGA_BANCO)          ! destroy the file manager


Hide:Relate:LIQUIDACION_ENTREGA_BANCO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('LIQUIDACION_ENTREGA_BANCO')
       DbChangeTrigger.AddThread('LIQUIDACION_ENTREGA_BANCO')
       DbChangeTrigger.AddItem(BCO:IDENTREGABNCO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:IDENTREGABNCO)) , 'LIQUIDACION_ENTREGA_BANCO')
       DbChangeTrigger.AddItem(BCO:DESCRIPCION, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:DESCRIPCION)) , 'LIQUIDACION_ENTREGA_BANCO')
       DbChangeTrigger.AddItem(BCO:FECHA, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:FECHA)) , 'LIQUIDACION_ENTREGA_BANCO')
       DbChangeTrigger.AddItem(BCO:HORA, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:HORA)) , 'LIQUIDACION_ENTREGA_BANCO')
       DbChangeTrigger.AddItem(BCO:IDUSUARIO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:IDUSUARIO)) , 'LIQUIDACION_ENTREGA_BANCO')
       DbChangeTrigger.AddItem(BCO:MES, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:MES)) , 'LIQUIDACION_ENTREGA_BANCO')
       DbChangeTrigger.AddItem(BCO:ANO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:ANO)) , 'LIQUIDACION_ENTREGA_BANCO')
       DbChangeTrigger.AddItem(BCO:PERIODO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:PERIODO)) , 'LIQUIDACION_ENTREGA_BANCO')
       DbChangeTrigger.AddItem(BCO:IDOS, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:IDOS)) , 'LIQUIDACION_ENTREGA_BANCO')
       DbChangeTrigger.AddItem(BCO:SECUENCIA, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:SECUENCIA)) , 'LIQUIDACION_ENTREGA_BANCO')
       DbChangeTrigger.AddItem(BCO:TIPO, WHO(BCO:RECORD,WHERE(BCO:RECORD,BCO:TIPO)) , 'LIQUIDACION_ENTREGA_BANCO')
    END
    DbChangeTrigger.Update('LIQUIDACION_ENTREGA_BANCO')


Hide:Relate:LIQUIDACION_ENTREGA_BANCO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('LIQUIDACION_ENTREGA_BANCO')
        DbChangeTrigger.CheckChanges('LIQUIDACION_ENTREGA_BANCO',LIQUIDACION_ENTREGA_BANCO) 
     END
  RETURN ReturnValue


Hide:Relate:USUARIO.Init PROCEDURE()
  CODE
  _Hide:Access:USUARIO.Init
  SELF.Init(Access:USUARIO,1)


Hide:Access:USUARIO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('USUARIO')
      DbChangeTrigger.AddThread('USUARIO')
      DbChangeTrigger.AddItem(USU:IDUSUARIO, WHO(USU:RECORD,WHERE(USU:RECORD,USU:IDUSUARIO)) , 'USUARIO')
      DbChangeTrigger.AddItem(USU:DESCRIPCION, WHO(USU:RECORD,WHERE(USU:RECORD,USU:DESCRIPCION)) , 'USUARIO')
      DbChangeTrigger.AddItem(USU:CONTRASENA, WHO(USU:RECORD,WHERE(USU:RECORD,USU:CONTRASENA)) , 'USUARIO')
      DbChangeTrigger.AddItem(USU:NIVEL, WHO(USU:RECORD,WHERE(USU:RECORD,USU:NIVEL)) , 'USUARIO')
      DbChangeTrigger.AddItem(USU:BAJA, WHO(USU:RECORD,WHERE(USU:RECORD,USU:BAJA)) , 'USUARIO')
   END
   DbChangeTrigger.Update('USUARIO')
  RETURN ReturnValue


Hide:Access:USUARIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= USU:Record
  SELF.FileNameValue = 'USUARIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= USUARIO
  PARENT.Init
  Access:USUARIO &= SELF


Hide:Access:USUARIO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('USUARIO',USUARIO)
  RETURN ReturnValue


Hide:Access:USUARIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:USUARIO &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:USUARIO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('USUARIO')
      DbChangeTrigger.AddThread('USUARIO')
      DbChangeTrigger.AddItem(USU:IDUSUARIO, WHO(USU:RECORD,WHERE(USU:RECORD,USU:IDUSUARIO)) , 'USUARIO')
      DbChangeTrigger.AddItem(USU:DESCRIPCION, WHO(USU:RECORD,WHERE(USU:RECORD,USU:DESCRIPCION)) , 'USUARIO')
      DbChangeTrigger.AddItem(USU:CONTRASENA, WHO(USU:RECORD,WHERE(USU:RECORD,USU:CONTRASENA)) , 'USUARIO')
      DbChangeTrigger.AddItem(USU:NIVEL, WHO(USU:RECORD,WHERE(USU:RECORD,USU:NIVEL)) , 'USUARIO')
      DbChangeTrigger.AddItem(USU:BAJA, WHO(USU:RECORD,WHERE(USU:RECORD,USU:BAJA)) , 'USUARIO')
   END
   DbChangeTrigger.Update('USUARIO')
  RETURN ReturnValue


Hide:Access:USUARIO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('USUARIO')
      DbChangeTrigger.AddThread('USUARIO')
      DbChangeTrigger.AddItem(USU:IDUSUARIO, WHO(USU:RECORD,WHERE(USU:RECORD,USU:IDUSUARIO)) , 'USUARIO')
      DbChangeTrigger.AddItem(USU:DESCRIPCION, WHO(USU:RECORD,WHERE(USU:RECORD,USU:DESCRIPCION)) , 'USUARIO')
      DbChangeTrigger.AddItem(USU:CONTRASENA, WHO(USU:RECORD,WHERE(USU:RECORD,USU:CONTRASENA)) , 'USUARIO')
      DbChangeTrigger.AddItem(USU:NIVEL, WHO(USU:RECORD,WHERE(USU:RECORD,USU:NIVEL)) , 'USUARIO')
      DbChangeTrigger.AddItem(USU:BAJA, WHO(USU:RECORD,WHERE(USU:RECORD,USU:BAJA)) , 'USUARIO')
   END
   DbChangeTrigger.Update('USUARIO')
  RETURN ReturnValue


Hide:Access:USUARIO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('USUARIO')
       DbChangeTrigger.CheckChanges('USUARIO',USUARIO) 
    END
  RETURN ReturnValue


Hide:Access:USUARIO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(USUARIO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(USU:PK_USUARIO,'USU:PK_USUARIO',0)
    SELF.AddKey(USU:USUARIO_IDX1,'USU:USUARIO_IDX1',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:USUARIO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:INFORME,RI:None,RI:None,INF:FK_INFORME_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,INF:IDUSUARIO)

  SELF.AddRelation(Relate:MS)

  SELF.AddRelation(Relate:ME,RI:None,RI:None,ME:FK_ME_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,ME:IDUSUARIO)

  SELF.AddRelation(Relate:CURSO_INSCRIPCION,RI:None,RI:None,CURI:FK_CURSO_INSCRIPCION_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,CURI:IDUSUARIO)

  SELF.AddRelation(Relate:SEGURO,RI:None,RI:None,SEG:FK_SEGURO_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,SEG:IDUSUARIO)

  SELF.AddRelation(Relate:LIQUIDACION,RI:None,RI:None,LIQ:FK_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,LIQ:IDUSUARIO)

  SELF.AddRelation(Relate:LIQUIDACION_ENTREGA_BANCO,RI:None,RI:None,BCO:FK_LIQUIDACION_ENTREGA_BANCO_US)
  SELF.AddRelationLink(USU:IDUSUARIO,BCO:IDUSUARIO)

  SELF.AddRelation(Relate:PROVEEDORES,RI:None,RI:None,PRO2:FK_PROVEEDORES_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,PRO2:IDUSUARIO)

  SELF.AddRelation(Relate:GASTOS,RI:None,RI:None,GAS:FK_GASTOS_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,GAS:IDUSUARIO)

  SELF.AddRelation(Relate:INGRESOS,RI:None,RI:None,ING:PK_INGRESOS)
  SELF.AddRelationLink(USU:IDUSUARIO,ING:IDINGRESO)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:PAGO_CONVENIO,RI:None,RI:None,PAGCON:FK_PAGO_CONVENIO_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,PAGCON:IDUSUARIO)

  SELF.AddRelation(Relate:AUDITORIA,RI:None,RI:None,AUD:FK_AUDITORIA_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,AUD:IDUSUARIO)

  SELF.AddRelation(Relate:FACTURA,RI:None,RI:None,FAC:FK_FACTURA_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,FAC:IDUSUARIO)

  SELF.AddRelation(Relate:PAGOS,RI:None,RI:None,PAG:FK_PAGOS_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,PAG:IDUSUARIO)

  SELF.AddRelation(Relate:PERIODO_FACTURA,RI:None,RI:None,PER:FK_PERIODO_FACTURA_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,PER:IDUSUARIO)

  SELF.AddRelation(Relate:RENUNCIA,RI:None,RI:None,REN:FK_RENUNCIA_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,REN:IDUSUARIO)

  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,SOC:IDUSUARIO)


Hide:Relate:USUARIO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('USUARIO',USUARIO)
  RETURN ReturnValue


Hide:Relate:USUARIO.Kill PROCEDURE

  CODE
  _Hide:Access:USUARIO.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:USUARIO &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:USUARIO)                            ! destroy the file manager


Hide:Relate:USUARIO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('USUARIO')
       DbChangeTrigger.AddThread('USUARIO')
       DbChangeTrigger.AddItem(USU:IDUSUARIO, WHO(USU:RECORD,WHERE(USU:RECORD,USU:IDUSUARIO)) , 'USUARIO')
       DbChangeTrigger.AddItem(USU:DESCRIPCION, WHO(USU:RECORD,WHERE(USU:RECORD,USU:DESCRIPCION)) , 'USUARIO')
       DbChangeTrigger.AddItem(USU:CONTRASENA, WHO(USU:RECORD,WHERE(USU:RECORD,USU:CONTRASENA)) , 'USUARIO')
       DbChangeTrigger.AddItem(USU:NIVEL, WHO(USU:RECORD,WHERE(USU:RECORD,USU:NIVEL)) , 'USUARIO')
       DbChangeTrigger.AddItem(USU:BAJA, WHO(USU:RECORD,WHERE(USU:RECORD,USU:BAJA)) , 'USUARIO')
    END
    DbChangeTrigger.Update('USUARIO')


Hide:Relate:USUARIO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('USUARIO')
        DbChangeTrigger.CheckChanges('USUARIO',USUARIO) 
     END
  RETURN ReturnValue


Hide:Relate:ZONA_VIVIENDA.Init PROCEDURE()
  CODE
  _Hide:Access:ZONA_VIVIENDA.Init
  SELF.Init(Access:ZONA_VIVIENDA,1)


Hide:Access:ZONA_VIVIENDA.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('ZONA_VIVIENDA')
      DbChangeTrigger.AddThread('ZONA_VIVIENDA')
      DbChangeTrigger.AddItem(ZON:IDZONA, WHO(ZON:RECORD,WHERE(ZON:RECORD,ZON:IDZONA)) , 'ZONA_VIVIENDA')
      DbChangeTrigger.AddItem(ZON:DESCRIPCION, WHO(ZON:RECORD,WHERE(ZON:RECORD,ZON:DESCRIPCION)) , 'ZONA_VIVIENDA')
   END
   DbChangeTrigger.Update('ZONA_VIVIENDA')
  RETURN ReturnValue


Hide:Access:ZONA_VIVIENDA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ZON:Record
  SELF.FileNameValue = 'ZONA_VIVIENDA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ZONA_VIVIENDA
  PARENT.Init
  Access:ZONA_VIVIENDA &= SELF


Hide:Access:ZONA_VIVIENDA.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('ZONA_VIVIENDA',ZONA_VIVIENDA)
  RETURN ReturnValue


Hide:Access:ZONA_VIVIENDA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ZONA_VIVIENDA &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ZONA_VIVIENDA.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('ZONA_VIVIENDA')
      DbChangeTrigger.AddThread('ZONA_VIVIENDA')
      DbChangeTrigger.AddItem(ZON:IDZONA, WHO(ZON:RECORD,WHERE(ZON:RECORD,ZON:IDZONA)) , 'ZONA_VIVIENDA')
      DbChangeTrigger.AddItem(ZON:DESCRIPCION, WHO(ZON:RECORD,WHERE(ZON:RECORD,ZON:DESCRIPCION)) , 'ZONA_VIVIENDA')
   END
   DbChangeTrigger.Update('ZONA_VIVIENDA')
  RETURN ReturnValue


Hide:Access:ZONA_VIVIENDA.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('ZONA_VIVIENDA')
      DbChangeTrigger.AddThread('ZONA_VIVIENDA')
      DbChangeTrigger.AddItem(ZON:IDZONA, WHO(ZON:RECORD,WHERE(ZON:RECORD,ZON:IDZONA)) , 'ZONA_VIVIENDA')
      DbChangeTrigger.AddItem(ZON:DESCRIPCION, WHO(ZON:RECORD,WHERE(ZON:RECORD,ZON:DESCRIPCION)) , 'ZONA_VIVIENDA')
   END
   DbChangeTrigger.Update('ZONA_VIVIENDA')
  RETURN ReturnValue


Hide:Access:ZONA_VIVIENDA.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('ZONA_VIVIENDA')
       DbChangeTrigger.CheckChanges('ZONA_VIVIENDA',ZONA_VIVIENDA) 
    END
  RETURN ReturnValue


Hide:Access:ZONA_VIVIENDA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ZONA_VIVIENDA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(ZON:PK_ZONA_VIVIENDA,'ZON:PK_ZONA_VIVIENDA',0)
    SELF.AddKey(ZON:IDX_ZONA_VIVIENDA,'ZON:IDX_ZONA_VIVIENDA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ZONA_VIVIENDA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_ZONA_VIVENDA)
  SELF.AddRelationLink(ZON:IDZONA,SOC:IDZONA)


Hide:Relate:ZONA_VIVIENDA.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('ZONA_VIVIENDA',ZONA_VIVIENDA)
  RETURN ReturnValue


Hide:Relate:ZONA_VIVIENDA.Kill PROCEDURE

  CODE
  _Hide:Access:ZONA_VIVIENDA.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:ZONA_VIVIENDA &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ZONA_VIVIENDA)                      ! destroy the file manager


Hide:Relate:ZONA_VIVIENDA.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('ZONA_VIVIENDA')
       DbChangeTrigger.AddThread('ZONA_VIVIENDA')
       DbChangeTrigger.AddItem(ZON:IDZONA, WHO(ZON:RECORD,WHERE(ZON:RECORD,ZON:IDZONA)) , 'ZONA_VIVIENDA')
       DbChangeTrigger.AddItem(ZON:DESCRIPCION, WHO(ZON:RECORD,WHERE(ZON:RECORD,ZON:DESCRIPCION)) , 'ZONA_VIVIENDA')
    END
    DbChangeTrigger.Update('ZONA_VIVIENDA')


Hide:Relate:ZONA_VIVIENDA.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('ZONA_VIVIENDA')
        DbChangeTrigger.CheckChanges('ZONA_VIVIENDA',ZONA_VIVIENDA) 
     END
  RETURN ReturnValue


Hide:Relate:CONSULTORIO_EQUIPO.Init PROCEDURE()
  CODE
  _Hide:Access:CONSULTORIO_EQUIPO.Init
  SELF.Init(Access:CONSULTORIO_EQUIPO,1)


Hide:Access:CONSULTORIO_EQUIPO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddThread('CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:IDCONSULTORIO, WHO(CON:RECORD,WHERE(CON:RECORD,CON:IDCONSULTORIO)) , 'CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:IDTIPOEQUIPO, WHO(CON:RECORD,WHERE(CON:RECORD,CON:IDTIPOEQUIPO)) , 'CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:OBSERVACION, WHO(CON:RECORD,WHERE(CON:RECORD,CON:OBSERVACION)) , 'CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:FECHA, WHO(CON:RECORD,WHERE(CON:RECORD,CON:FECHA)) , 'CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:HORA, WHO(CON:RECORD,WHERE(CON:RECORD,CON:HORA)) , 'CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:IDUSUARIO, WHO(CON:RECORD,WHERE(CON:RECORD,CON:IDUSUARIO)) , 'CONSULTORIO_EQUIPO')
   END
   DbChangeTrigger.Update('CONSULTORIO_EQUIPO')
  RETURN ReturnValue


Hide:Access:CONSULTORIO_EQUIPO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CON:Record
  SELF.FileNameValue = 'CONSULTORIO_EQUIPO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CONSULTORIO_EQUIPO
  PARENT.Init
  Access:CONSULTORIO_EQUIPO &= SELF


Hide:Access:CONSULTORIO_EQUIPO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CONSULTORIO_EQUIPO',CONSULTORIO_EQUIPO)
  RETURN ReturnValue


Hide:Access:CONSULTORIO_EQUIPO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CONSULTORIO_EQUIPO &= NULL                        ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CONSULTORIO_EQUIPO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddThread('CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:IDCONSULTORIO, WHO(CON:RECORD,WHERE(CON:RECORD,CON:IDCONSULTORIO)) , 'CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:IDTIPOEQUIPO, WHO(CON:RECORD,WHERE(CON:RECORD,CON:IDTIPOEQUIPO)) , 'CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:OBSERVACION, WHO(CON:RECORD,WHERE(CON:RECORD,CON:OBSERVACION)) , 'CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:FECHA, WHO(CON:RECORD,WHERE(CON:RECORD,CON:FECHA)) , 'CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:HORA, WHO(CON:RECORD,WHERE(CON:RECORD,CON:HORA)) , 'CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:IDUSUARIO, WHO(CON:RECORD,WHERE(CON:RECORD,CON:IDUSUARIO)) , 'CONSULTORIO_EQUIPO')
   END
   DbChangeTrigger.Update('CONSULTORIO_EQUIPO')
  RETURN ReturnValue


Hide:Access:CONSULTORIO_EQUIPO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddThread('CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:IDCONSULTORIO, WHO(CON:RECORD,WHERE(CON:RECORD,CON:IDCONSULTORIO)) , 'CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:IDTIPOEQUIPO, WHO(CON:RECORD,WHERE(CON:RECORD,CON:IDTIPOEQUIPO)) , 'CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:OBSERVACION, WHO(CON:RECORD,WHERE(CON:RECORD,CON:OBSERVACION)) , 'CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:FECHA, WHO(CON:RECORD,WHERE(CON:RECORD,CON:FECHA)) , 'CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:HORA, WHO(CON:RECORD,WHERE(CON:RECORD,CON:HORA)) , 'CONSULTORIO_EQUIPO')
      DbChangeTrigger.AddItem(CON:IDUSUARIO, WHO(CON:RECORD,WHERE(CON:RECORD,CON:IDUSUARIO)) , 'CONSULTORIO_EQUIPO')
   END
   DbChangeTrigger.Update('CONSULTORIO_EQUIPO')
  RETURN ReturnValue


Hide:Access:CONSULTORIO_EQUIPO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CONSULTORIO_EQUIPO')
       DbChangeTrigger.CheckChanges('CONSULTORIO_EQUIPO',CONSULTORIO_EQUIPO) 
    END
  RETURN ReturnValue


Hide:Access:CONSULTORIO_EQUIPO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CONSULTORIO_EQUIPO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CON:PK_CONSULTORIO_EQUIPO,'CON:PK_CONSULTORIO_EQUIPO',0)
    SELF.AddKey(CON:FK_CONSULTORIO_EQUIPO_CONS,'CON:FK_CONSULTORIO_EQUIPO_CONS',0)
    SELF.AddKey(CON:FK_CONSULTORIO_EQUIPO_EQUIP,'CON:FK_CONSULTORIO_EQUIPO_EQUIP',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CONSULTORIO_EQUIPO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:CONSULTORIO1  USHORT,AUTO
Save:TIPO_EQUIPO2  USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('CON:IDCONSULTORIO')
    Save:CONSULTORIO1 = Access:CONSULTORIO.SaveFile()
    CON2:IDCONSULTORIO = CON:IDCONSULTORIO
    ReturnValue = Access:CONSULTORIO.TryFetch(CON2:PK_CONSULTORIO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CONSULTORIO')
      END
    END
    Access:CONSULTORIO.RestoreFile(Save:CONSULTORIO1)
  OF 2
    GlobalErrors.SetField('CON:IDTIPOEQUIPO')
    Save:TIPO_EQUIPO2 = Access:TIPO_EQUIPO.SaveFile()
    TIP5:IDTIPOEQUIPO = CON:IDTIPOEQUIPO
    ReturnValue = Access:TIPO_EQUIPO.TryFetch(TIP5:PK_TIPO_EQUIPO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_EQUIPO')
      END
    END
    Access:TIPO_EQUIPO.RestoreFile(Save:TIPO_EQUIPO2)
  END
  RETURN ReturnValue


Hide:Relate:CONSULTORIO_EQUIPO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CONSULTORIO)

  SELF.AddRelation(Relate:TIPO_EQUIPO)


Hide:Relate:CONSULTORIO_EQUIPO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CONSULTORIO_EQUIPO',CONSULTORIO_EQUIPO)
  RETURN ReturnValue


Hide:Relate:CONSULTORIO_EQUIPO.Kill PROCEDURE

  CODE
  _Hide:Access:CONSULTORIO_EQUIPO.Kill                     ! Kill the file manager
  PARENT.Kill
  Relate:CONSULTORIO_EQUIPO &= NULL                        ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CONSULTORIO_EQUIPO)                 ! destroy the file manager


Hide:Relate:CONSULTORIO_EQUIPO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CONSULTORIO_EQUIPO')
       DbChangeTrigger.AddThread('CONSULTORIO_EQUIPO')
       DbChangeTrigger.AddItem(CON:IDCONSULTORIO, WHO(CON:RECORD,WHERE(CON:RECORD,CON:IDCONSULTORIO)) , 'CONSULTORIO_EQUIPO')
       DbChangeTrigger.AddItem(CON:IDTIPOEQUIPO, WHO(CON:RECORD,WHERE(CON:RECORD,CON:IDTIPOEQUIPO)) , 'CONSULTORIO_EQUIPO')
       DbChangeTrigger.AddItem(CON:OBSERVACION, WHO(CON:RECORD,WHERE(CON:RECORD,CON:OBSERVACION)) , 'CONSULTORIO_EQUIPO')
       DbChangeTrigger.AddItem(CON:FECHA, WHO(CON:RECORD,WHERE(CON:RECORD,CON:FECHA)) , 'CONSULTORIO_EQUIPO')
       DbChangeTrigger.AddItem(CON:HORA, WHO(CON:RECORD,WHERE(CON:RECORD,CON:HORA)) , 'CONSULTORIO_EQUIPO')
       DbChangeTrigger.AddItem(CON:IDUSUARIO, WHO(CON:RECORD,WHERE(CON:RECORD,CON:IDUSUARIO)) , 'CONSULTORIO_EQUIPO')
    END
    DbChangeTrigger.Update('CONSULTORIO_EQUIPO')


Hide:Relate:CONSULTORIO_EQUIPO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CONSULTORIO_EQUIPO')
        DbChangeTrigger.CheckChanges('CONSULTORIO_EQUIPO',CONSULTORIO_EQUIPO) 
     END
  RETURN ReturnValue

