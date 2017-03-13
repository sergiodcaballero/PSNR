  MEMBER('Gestion.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
Gestion_BC3:DctInit    PROCEDURE()
Gestion_BC3:DctKill    PROCEDURE()
Gestion_BC3:FilesInit  PROCEDURE()
  END

Hide:Access:TIPO_EQUIPO CLASS(FileManager),TYPE            ! FileManager for TIPO_EQUIPO
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_EQUIPO CLASS(RelationManager),TYPE        ! RelationManager for TIPO_EQUIPO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:FACTURAXCUPON CLASS(FileManager),TYPE          ! FileManager for FACTURAXCUPON
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


Hide:Relate:FACTURAXCUPON CLASS(RelationManager),TYPE      ! RelationManager for FACTURAXCUPON
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:LOTE     CLASS(FileManager),TYPE               ! FileManager for LOTE
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:LOTE     CLASS(RelationManager),TYPE           ! RelationManager for LOTE
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CAJA     CLASS(FileManager),TYPE               ! FileManager for CAJA
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


Hide:Relate:CAJA     CLASS(RelationManager),TYPE           ! RelationManager for CAJA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:CUENTAS  CLASS(FileManager),TYPE               ! FileManager for CUENTAS
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CUENTAS  CLASS(RelationManager),TYPE           ! RelationManager for CUENTAS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:GASTOS   CLASS(FileManager),TYPE               ! FileManager for GASTOS
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


Hide:Relate:GASTOS   CLASS(RelationManager),TYPE           ! RelationManager for GASTOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:INGRESOS CLASS(FileManager),TYPE               ! FileManager for INGRESOS
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


Hide:Relate:INGRESOS CLASS(RelationManager),TYPE           ! RelationManager for INGRESOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:LIBDIARIO CLASS(FileManager),TYPE              ! FileManager for LIBDIARIO
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


Hide:Relate:LIBDIARIO CLASS(RelationManager),TYPE          ! RelationManager for LIBDIARIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:SUBCUENTAS CLASS(FileManager),TYPE             ! FileManager for SUBCUENTAS
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


Hide:Relate:SUBCUENTAS CLASS(RelationManager),TYPE         ! RelationManager for SUBCUENTAS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:NIVEL_FORMACION CLASS(FileManager),TYPE        ! FileManager for NIVEL_FORMACION
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:NIVEL_FORMACION CLASS(RelationManager),TYPE    ! RelationManager for NIVEL_FORMACION
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:TIPO_TITULO CLASS(FileManager),TYPE            ! FileManager for TIPO_TITULO
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


Hide:Relate:TIPO_TITULO CLASS(RelationManager),TYPE        ! RelationManager for TIPO_TITULO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:SOCIOSXTRABAJO CLASS(FileManager),TYPE         ! FileManager for SOCIOSXTRABAJO
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


Hide:Relate:SOCIOSXTRABAJO CLASS(RelationManager),TYPE     ! RelationManager for SOCIOSXTRABAJO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:TRABAJO  CLASS(FileManager),TYPE               ! FileManager for TRABAJO
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


Hide:Relate:TRABAJO  CLASS(RelationManager),TYPE           ! RelationManager for TRABAJO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:PROVEEDORES CLASS(FileManager),TYPE            ! FileManager for PROVEEDORES
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


Hide:Relate:PROVEEDORES CLASS(RelationManager),TYPE        ! RelationManager for PROVEEDORES
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:TIPO_IVA CLASS(FileManager),TYPE               ! FileManager for TIPO_IVA
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_IVA CLASS(RelationManager),TYPE           ! RelationManager for TIPO_IVA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:TIPO_PROVEEDOR CLASS(FileManager),TYPE         ! FileManager for TIPO_PROVEEDOR
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_PROVEEDOR CLASS(RelationManager),TYPE     ! RelationManager for TIPO_PROVEEDOR
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:BANCO    CLASS(FileManager),TYPE               ! FileManager for BANCO
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


Hide:Relate:BANCO    CLASS(RelationManager),TYPE           ! RelationManager for BANCO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:BANCO_COD_REG CLASS(FileManager),TYPE          ! FileManager for BANCO_COD_REG
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:BANCO_COD_REG CLASS(RelationManager),TYPE      ! RelationManager for BANCO_COD_REG
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:OBRA_SOCIAL CLASS(FileManager),TYPE            ! FileManager for OBRA_SOCIAL
Fetch                  PROCEDURE(KEY K),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
SaveBuffer             PROCEDURE(),USHORT,DERIVED
TryFetch               PROCEDURE(KEY K),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:OBRA_SOCIAL CLASS(RelationManager),TYPE        ! RelationManager for OBRA_SOCIAL
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END

Hide:Access:OS_PLANES CLASS(FileManager),TYPE              ! FileManager for OS_PLANES
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


Hide:Relate:OS_PLANES CLASS(RelationManager),TYPE          ! RelationManager for OS_PLANES
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Delete                 PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
Save                   PROCEDURE(),DERIVED
Update                 PROCEDURE(BYTE FromForm=0),BYTE,PROC,DERIVED
                     END


_Hide:Access:TIPO_EQUIPO &Hide:Access:TIPO_EQUIPO,AUTO,THREAD
_Hide:Relate:TIPO_EQUIPO &Hide:Relate:TIPO_EQUIPO,AUTO,THREAD
_Hide:Access:FACTURAXCUPON &Hide:Access:FACTURAXCUPON,AUTO,THREAD
_Hide:Relate:FACTURAXCUPON &Hide:Relate:FACTURAXCUPON,AUTO,THREAD
_Hide:Access:LOTE    &Hide:Access:LOTE,AUTO,THREAD
_Hide:Relate:LOTE    &Hide:Relate:LOTE,AUTO,THREAD
_Hide:Access:CAJA    &Hide:Access:CAJA,AUTO,THREAD
_Hide:Relate:CAJA    &Hide:Relate:CAJA,AUTO,THREAD
_Hide:Access:CUENTAS &Hide:Access:CUENTAS,AUTO,THREAD
_Hide:Relate:CUENTAS &Hide:Relate:CUENTAS,AUTO,THREAD
_Hide:Access:GASTOS  &Hide:Access:GASTOS,AUTO,THREAD
_Hide:Relate:GASTOS  &Hide:Relate:GASTOS,AUTO,THREAD
_Hide:Access:INGRESOS &Hide:Access:INGRESOS,AUTO,THREAD
_Hide:Relate:INGRESOS &Hide:Relate:INGRESOS,AUTO,THREAD
_Hide:Access:LIBDIARIO &Hide:Access:LIBDIARIO,AUTO,THREAD
_Hide:Relate:LIBDIARIO &Hide:Relate:LIBDIARIO,AUTO,THREAD
_Hide:Access:SUBCUENTAS &Hide:Access:SUBCUENTAS,AUTO,THREAD
_Hide:Relate:SUBCUENTAS &Hide:Relate:SUBCUENTAS,AUTO,THREAD
_Hide:Access:NIVEL_FORMACION &Hide:Access:NIVEL_FORMACION,AUTO,THREAD
_Hide:Relate:NIVEL_FORMACION &Hide:Relate:NIVEL_FORMACION,AUTO,THREAD
_Hide:Access:TIPO_TITULO &Hide:Access:TIPO_TITULO,AUTO,THREAD
_Hide:Relate:TIPO_TITULO &Hide:Relate:TIPO_TITULO,AUTO,THREAD
_Hide:Access:SOCIOSXTRABAJO &Hide:Access:SOCIOSXTRABAJO,AUTO,THREAD
_Hide:Relate:SOCIOSXTRABAJO &Hide:Relate:SOCIOSXTRABAJO,AUTO,THREAD
_Hide:Access:TRABAJO &Hide:Access:TRABAJO,AUTO,THREAD
_Hide:Relate:TRABAJO &Hide:Relate:TRABAJO,AUTO,THREAD
_Hide:Access:PROVEEDORES &Hide:Access:PROVEEDORES,AUTO,THREAD
_Hide:Relate:PROVEEDORES &Hide:Relate:PROVEEDORES,AUTO,THREAD
_Hide:Access:TIPO_IVA &Hide:Access:TIPO_IVA,AUTO,THREAD
_Hide:Relate:TIPO_IVA &Hide:Relate:TIPO_IVA,AUTO,THREAD
_Hide:Access:TIPO_PROVEEDOR &Hide:Access:TIPO_PROVEEDOR,AUTO,THREAD
_Hide:Relate:TIPO_PROVEEDOR &Hide:Relate:TIPO_PROVEEDOR,AUTO,THREAD
_Hide:Access:BANCO   &Hide:Access:BANCO,AUTO,THREAD
_Hide:Relate:BANCO   &Hide:Relate:BANCO,AUTO,THREAD
_Hide:Access:BANCO_COD_REG &Hide:Access:BANCO_COD_REG,AUTO,THREAD
_Hide:Relate:BANCO_COD_REG &Hide:Relate:BANCO_COD_REG,AUTO,THREAD
_Hide:Access:OBRA_SOCIAL &Hide:Access:OBRA_SOCIAL,AUTO,THREAD
_Hide:Relate:OBRA_SOCIAL &Hide:Relate:OBRA_SOCIAL,AUTO,THREAD
_Hide:Access:OS_PLANES &Hide:Access:OS_PLANES,AUTO,THREAD
_Hide:Relate:OS_PLANES &Hide:Relate:OS_PLANES,AUTO,THREAD


Gestion_BC3:DctInit PROCEDURE()
  CODE
  _Hide:Access:TIPO_EQUIPO &= NEW(Hide:Access:TIPO_EQUIPO)
  _Hide:Relate:TIPO_EQUIPO &= NEW(Hide:Relate:TIPO_EQUIPO)
  _Hide:Access:FACTURAXCUPON &= NEW(Hide:Access:FACTURAXCUPON)
  _Hide:Relate:FACTURAXCUPON &= NEW(Hide:Relate:FACTURAXCUPON)
  _Hide:Access:LOTE &= NEW(Hide:Access:LOTE)
  _Hide:Relate:LOTE &= NEW(Hide:Relate:LOTE)
  _Hide:Access:CAJA &= NEW(Hide:Access:CAJA)
  _Hide:Relate:CAJA &= NEW(Hide:Relate:CAJA)
  _Hide:Access:CUENTAS &= NEW(Hide:Access:CUENTAS)
  _Hide:Relate:CUENTAS &= NEW(Hide:Relate:CUENTAS)
  _Hide:Access:GASTOS &= NEW(Hide:Access:GASTOS)
  _Hide:Relate:GASTOS &= NEW(Hide:Relate:GASTOS)
  _Hide:Access:INGRESOS &= NEW(Hide:Access:INGRESOS)
  _Hide:Relate:INGRESOS &= NEW(Hide:Relate:INGRESOS)
  _Hide:Access:LIBDIARIO &= NEW(Hide:Access:LIBDIARIO)
  _Hide:Relate:LIBDIARIO &= NEW(Hide:Relate:LIBDIARIO)
  _Hide:Access:SUBCUENTAS &= NEW(Hide:Access:SUBCUENTAS)
  _Hide:Relate:SUBCUENTAS &= NEW(Hide:Relate:SUBCUENTAS)
  _Hide:Access:NIVEL_FORMACION &= NEW(Hide:Access:NIVEL_FORMACION)
  _Hide:Relate:NIVEL_FORMACION &= NEW(Hide:Relate:NIVEL_FORMACION)
  _Hide:Access:TIPO_TITULO &= NEW(Hide:Access:TIPO_TITULO)
  _Hide:Relate:TIPO_TITULO &= NEW(Hide:Relate:TIPO_TITULO)
  _Hide:Access:SOCIOSXTRABAJO &= NEW(Hide:Access:SOCIOSXTRABAJO)
  _Hide:Relate:SOCIOSXTRABAJO &= NEW(Hide:Relate:SOCIOSXTRABAJO)
  _Hide:Access:TRABAJO &= NEW(Hide:Access:TRABAJO)
  _Hide:Relate:TRABAJO &= NEW(Hide:Relate:TRABAJO)
  _Hide:Access:PROVEEDORES &= NEW(Hide:Access:PROVEEDORES)
  _Hide:Relate:PROVEEDORES &= NEW(Hide:Relate:PROVEEDORES)
  _Hide:Access:TIPO_IVA &= NEW(Hide:Access:TIPO_IVA)
  _Hide:Relate:TIPO_IVA &= NEW(Hide:Relate:TIPO_IVA)
  _Hide:Access:TIPO_PROVEEDOR &= NEW(Hide:Access:TIPO_PROVEEDOR)
  _Hide:Relate:TIPO_PROVEEDOR &= NEW(Hide:Relate:TIPO_PROVEEDOR)
  _Hide:Access:BANCO &= NEW(Hide:Access:BANCO)
  _Hide:Relate:BANCO &= NEW(Hide:Relate:BANCO)
  _Hide:Access:BANCO_COD_REG &= NEW(Hide:Access:BANCO_COD_REG)
  _Hide:Relate:BANCO_COD_REG &= NEW(Hide:Relate:BANCO_COD_REG)
  _Hide:Access:OBRA_SOCIAL &= NEW(Hide:Access:OBRA_SOCIAL)
  _Hide:Relate:OBRA_SOCIAL &= NEW(Hide:Relate:OBRA_SOCIAL)
  _Hide:Access:OS_PLANES &= NEW(Hide:Access:OS_PLANES)
  _Hide:Relate:OS_PLANES &= NEW(Hide:Relate:OS_PLANES)
  Relate:TIPO_EQUIPO &= _Hide:Relate:TIPO_EQUIPO
  Relate:FACTURAXCUPON &= _Hide:Relate:FACTURAXCUPON
  Relate:LOTE &= _Hide:Relate:LOTE
  Relate:CAJA &= _Hide:Relate:CAJA
  Relate:CUENTAS &= _Hide:Relate:CUENTAS
  Relate:GASTOS &= _Hide:Relate:GASTOS
  Relate:INGRESOS &= _Hide:Relate:INGRESOS
  Relate:LIBDIARIO &= _Hide:Relate:LIBDIARIO
  Relate:SUBCUENTAS &= _Hide:Relate:SUBCUENTAS
  Relate:NIVEL_FORMACION &= _Hide:Relate:NIVEL_FORMACION
  Relate:TIPO_TITULO &= _Hide:Relate:TIPO_TITULO
  Relate:SOCIOSXTRABAJO &= _Hide:Relate:SOCIOSXTRABAJO
  Relate:TRABAJO &= _Hide:Relate:TRABAJO
  Relate:PROVEEDORES &= _Hide:Relate:PROVEEDORES
  Relate:TIPO_IVA &= _Hide:Relate:TIPO_IVA
  Relate:TIPO_PROVEEDOR &= _Hide:Relate:TIPO_PROVEEDOR
  Relate:BANCO &= _Hide:Relate:BANCO
  Relate:BANCO_COD_REG &= _Hide:Relate:BANCO_COD_REG
  Relate:OBRA_SOCIAL &= _Hide:Relate:OBRA_SOCIAL
  Relate:OS_PLANES &= _Hide:Relate:OS_PLANES


Gestion_BC3:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:TIPO_EQUIPO.Init
  _Hide:Relate:FACTURAXCUPON.Init
  _Hide:Relate:LOTE.Init
  _Hide:Relate:CAJA.Init
  _Hide:Relate:CUENTAS.Init
  _Hide:Relate:GASTOS.Init
  _Hide:Relate:INGRESOS.Init
  _Hide:Relate:LIBDIARIO.Init
  _Hide:Relate:SUBCUENTAS.Init
  _Hide:Relate:NIVEL_FORMACION.Init
  _Hide:Relate:TIPO_TITULO.Init
  _Hide:Relate:SOCIOSXTRABAJO.Init
  _Hide:Relate:TRABAJO.Init
  _Hide:Relate:PROVEEDORES.Init
  _Hide:Relate:TIPO_IVA.Init
  _Hide:Relate:TIPO_PROVEEDOR.Init
  _Hide:Relate:BANCO.Init
  _Hide:Relate:BANCO_COD_REG.Init
  _Hide:Relate:OBRA_SOCIAL.Init
  _Hide:Relate:OS_PLANES.Init


Gestion_BC3:DctKill PROCEDURE()
  CODE
  _Hide:Relate:TIPO_EQUIPO.Kill
  DISPOSE(_Hide:Relate:TIPO_EQUIPO)
  _Hide:Relate:FACTURAXCUPON.Kill
  DISPOSE(_Hide:Relate:FACTURAXCUPON)
  _Hide:Relate:LOTE.Kill
  DISPOSE(_Hide:Relate:LOTE)
  _Hide:Relate:CAJA.Kill
  DISPOSE(_Hide:Relate:CAJA)
  _Hide:Relate:CUENTAS.Kill
  DISPOSE(_Hide:Relate:CUENTAS)
  _Hide:Relate:GASTOS.Kill
  DISPOSE(_Hide:Relate:GASTOS)
  _Hide:Relate:INGRESOS.Kill
  DISPOSE(_Hide:Relate:INGRESOS)
  _Hide:Relate:LIBDIARIO.Kill
  DISPOSE(_Hide:Relate:LIBDIARIO)
  _Hide:Relate:SUBCUENTAS.Kill
  DISPOSE(_Hide:Relate:SUBCUENTAS)
  _Hide:Relate:NIVEL_FORMACION.Kill
  DISPOSE(_Hide:Relate:NIVEL_FORMACION)
  _Hide:Relate:TIPO_TITULO.Kill
  DISPOSE(_Hide:Relate:TIPO_TITULO)
  _Hide:Relate:SOCIOSXTRABAJO.Kill
  DISPOSE(_Hide:Relate:SOCIOSXTRABAJO)
  _Hide:Relate:TRABAJO.Kill
  DISPOSE(_Hide:Relate:TRABAJO)
  _Hide:Relate:PROVEEDORES.Kill
  DISPOSE(_Hide:Relate:PROVEEDORES)
  _Hide:Relate:TIPO_IVA.Kill
  DISPOSE(_Hide:Relate:TIPO_IVA)
  _Hide:Relate:TIPO_PROVEEDOR.Kill
  DISPOSE(_Hide:Relate:TIPO_PROVEEDOR)
  _Hide:Relate:BANCO.Kill
  DISPOSE(_Hide:Relate:BANCO)
  _Hide:Relate:BANCO_COD_REG.Kill
  DISPOSE(_Hide:Relate:BANCO_COD_REG)
  _Hide:Relate:OBRA_SOCIAL.Kill
  DISPOSE(_Hide:Relate:OBRA_SOCIAL)
  _Hide:Relate:OS_PLANES.Kill
  DISPOSE(_Hide:Relate:OS_PLANES)


Hide:Relate:TIPO_EQUIPO.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_EQUIPO.Init
  SELF.Init(Access:TIPO_EQUIPO,1)


Hide:Access:TIPO_EQUIPO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_EQUIPO')
      DbChangeTrigger.AddThread('TIPO_EQUIPO')
      DbChangeTrigger.AddItem(TIP5:IDTIPOEQUIPO, WHO(TIP5:RECORD,WHERE(TIP5:RECORD,TIP5:IDTIPOEQUIPO)) , 'TIPO_EQUIPO')
      DbChangeTrigger.AddItem(TIP5:DESCRIPCION, WHO(TIP5:RECORD,WHERE(TIP5:RECORD,TIP5:DESCRIPCION)) , 'TIPO_EQUIPO')
   END
   DbChangeTrigger.Update('TIPO_EQUIPO')
  RETURN ReturnValue


Hide:Access:TIPO_EQUIPO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIP5:Record
  SELF.FileNameValue = 'TIPO_EQUIPO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_EQUIPO
  PARENT.Init
  Access:TIPO_EQUIPO &= SELF


Hide:Access:TIPO_EQUIPO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('TIPO_EQUIPO',TIPO_EQUIPO)
  RETURN ReturnValue


Hide:Access:TIPO_EQUIPO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_EQUIPO &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TIPO_EQUIPO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('TIPO_EQUIPO')
      DbChangeTrigger.AddThread('TIPO_EQUIPO')
      DbChangeTrigger.AddItem(TIP5:IDTIPOEQUIPO, WHO(TIP5:RECORD,WHERE(TIP5:RECORD,TIP5:IDTIPOEQUIPO)) , 'TIPO_EQUIPO')
      DbChangeTrigger.AddItem(TIP5:DESCRIPCION, WHO(TIP5:RECORD,WHERE(TIP5:RECORD,TIP5:DESCRIPCION)) , 'TIPO_EQUIPO')
   END
   DbChangeTrigger.Update('TIPO_EQUIPO')
  RETURN ReturnValue


Hide:Access:TIPO_EQUIPO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_EQUIPO')
      DbChangeTrigger.AddThread('TIPO_EQUIPO')
      DbChangeTrigger.AddItem(TIP5:IDTIPOEQUIPO, WHO(TIP5:RECORD,WHERE(TIP5:RECORD,TIP5:IDTIPOEQUIPO)) , 'TIPO_EQUIPO')
      DbChangeTrigger.AddItem(TIP5:DESCRIPCION, WHO(TIP5:RECORD,WHERE(TIP5:RECORD,TIP5:DESCRIPCION)) , 'TIPO_EQUIPO')
   END
   DbChangeTrigger.Update('TIPO_EQUIPO')
  RETURN ReturnValue


Hide:Access:TIPO_EQUIPO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('TIPO_EQUIPO')
       DbChangeTrigger.CheckChanges('TIPO_EQUIPO',TIPO_EQUIPO) 
    END
  RETURN ReturnValue


Hide:Access:TIPO_EQUIPO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TIPO_EQUIPO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TIP5:PK_TIPO_EQUIPO,'TIP5:PK_TIPO_EQUIPO',0)
    SELF.AddKey(TIP5:IDX_TIPO_EQUIPO_DESCRIPCION,'TIP5:IDX_TIPO_EQUIPO_DESCRIPCION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TIPO_EQUIPO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CONSULTORIO_EQUIPO,RI:None,RI:None,CON:FK_CONSULTORIO_EQUIPO_EQUIP)
  SELF.AddRelationLink(TIP5:IDTIPOEQUIPO,CON:IDTIPOEQUIPO)


Hide:Relate:TIPO_EQUIPO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('TIPO_EQUIPO',TIPO_EQUIPO)
  RETURN ReturnValue


Hide:Relate:TIPO_EQUIPO.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_EQUIPO.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_EQUIPO &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_EQUIPO)                        ! destroy the file manager


Hide:Relate:TIPO_EQUIPO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('TIPO_EQUIPO')
       DbChangeTrigger.AddThread('TIPO_EQUIPO')
       DbChangeTrigger.AddItem(TIP5:IDTIPOEQUIPO, WHO(TIP5:RECORD,WHERE(TIP5:RECORD,TIP5:IDTIPOEQUIPO)) , 'TIPO_EQUIPO')
       DbChangeTrigger.AddItem(TIP5:DESCRIPCION, WHO(TIP5:RECORD,WHERE(TIP5:RECORD,TIP5:DESCRIPCION)) , 'TIPO_EQUIPO')
    END
    DbChangeTrigger.Update('TIPO_EQUIPO')


Hide:Relate:TIPO_EQUIPO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('TIPO_EQUIPO')
        DbChangeTrigger.CheckChanges('TIPO_EQUIPO',TIPO_EQUIPO) 
     END
  RETURN ReturnValue


Hide:Relate:FACTURAXCUPON.Init PROCEDURE()
  CODE
  _Hide:Access:FACTURAXCUPON.Init
  SELF.Init(Access:FACTURAXCUPON,1)


Hide:Access:FACTURAXCUPON.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('FACTURAXCUPON')
      DbChangeTrigger.AddThread('FACTURAXCUPON')
      DbChangeTrigger.AddItem(FAC2:IDFACTURA, WHO(FAC2:RECORD,WHERE(FAC2:RECORD,FAC2:IDFACTURA)) , 'FACTURAXCUPON')
      DbChangeTrigger.AddItem(FAC2:IDSOCIO, WHO(FAC2:RECORD,WHERE(FAC2:RECORD,FAC2:IDSOCIO)) , 'FACTURAXCUPON')
      DbChangeTrigger.AddItem(FAC2:IDLOTE, WHO(FAC2:RECORD,WHERE(FAC2:RECORD,FAC2:IDLOTE)) , 'FACTURAXCUPON')
   END
   DbChangeTrigger.Update('FACTURAXCUPON')
  RETURN ReturnValue


Hide:Access:FACTURAXCUPON.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FAC2:Record
  SELF.FileNameValue = 'FACTURAXCUPON'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= FACTURAXCUPON
  PARENT.Init
  Access:FACTURAXCUPON &= SELF


Hide:Access:FACTURAXCUPON.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('FACTURAXCUPON',FACTURAXCUPON)
  RETURN ReturnValue


Hide:Access:FACTURAXCUPON.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:FACTURAXCUPON &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:FACTURAXCUPON.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('FACTURAXCUPON')
      DbChangeTrigger.AddThread('FACTURAXCUPON')
      DbChangeTrigger.AddItem(FAC2:IDFACTURA, WHO(FAC2:RECORD,WHERE(FAC2:RECORD,FAC2:IDFACTURA)) , 'FACTURAXCUPON')
      DbChangeTrigger.AddItem(FAC2:IDSOCIO, WHO(FAC2:RECORD,WHERE(FAC2:RECORD,FAC2:IDSOCIO)) , 'FACTURAXCUPON')
      DbChangeTrigger.AddItem(FAC2:IDLOTE, WHO(FAC2:RECORD,WHERE(FAC2:RECORD,FAC2:IDLOTE)) , 'FACTURAXCUPON')
   END
   DbChangeTrigger.Update('FACTURAXCUPON')
  RETURN ReturnValue


Hide:Access:FACTURAXCUPON.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('FACTURAXCUPON')
      DbChangeTrigger.AddThread('FACTURAXCUPON')
      DbChangeTrigger.AddItem(FAC2:IDFACTURA, WHO(FAC2:RECORD,WHERE(FAC2:RECORD,FAC2:IDFACTURA)) , 'FACTURAXCUPON')
      DbChangeTrigger.AddItem(FAC2:IDSOCIO, WHO(FAC2:RECORD,WHERE(FAC2:RECORD,FAC2:IDSOCIO)) , 'FACTURAXCUPON')
      DbChangeTrigger.AddItem(FAC2:IDLOTE, WHO(FAC2:RECORD,WHERE(FAC2:RECORD,FAC2:IDLOTE)) , 'FACTURAXCUPON')
   END
   DbChangeTrigger.Update('FACTURAXCUPON')
  RETURN ReturnValue


Hide:Access:FACTURAXCUPON.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('FACTURAXCUPON')
       DbChangeTrigger.CheckChanges('FACTURAXCUPON',FACTURAXCUPON) 
    END
  RETURN ReturnValue


Hide:Access:FACTURAXCUPON.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(FACTURAXCUPON,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(FAC2:PK_FACTURAXCUPON,'FAC2:PK_FACTURAXCUPON',0)
    SELF.AddKey(FAC2:IDX_FACTURAXCUPON_SOCIO_LOTE,'FAC2:IDX_FACTURAXCUPON_SOCIO_LOTE',0)
    SELF.AddKey(FAC2:FK_FACTURAXCUPON_LOTE,'FAC2:FK_FACTURAXCUPON_LOTE',0)
    SELF.AddKey(FAC2:FK_FACTURAXCUPON_SOCIO,'FAC2:FK_FACTURAXCUPON_SOCIO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:FACTURAXCUPON.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:LOTE3         USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('FAC2:IDLOTE')
    Save:LOTE3 = Access:LOTE.SaveFile()
    LOT:IDLOTE = FAC2:IDLOTE
    ReturnValue = Access:LOTE.TryFetch(LOT:PK_LOTE)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'LOTE')
      END
    END
    Access:LOTE.RestoreFile(Save:LOTE3)
  END
  RETURN ReturnValue


Hide:Relate:FACTURAXCUPON.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:FACTURA)

  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:LOTE)


Hide:Relate:FACTURAXCUPON.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('FACTURAXCUPON',FACTURAXCUPON)
  RETURN ReturnValue


Hide:Relate:FACTURAXCUPON.Kill PROCEDURE

  CODE
  _Hide:Access:FACTURAXCUPON.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:FACTURAXCUPON &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:FACTURAXCUPON)                      ! destroy the file manager


Hide:Relate:FACTURAXCUPON.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('FACTURAXCUPON')
       DbChangeTrigger.AddThread('FACTURAXCUPON')
       DbChangeTrigger.AddItem(FAC2:IDFACTURA, WHO(FAC2:RECORD,WHERE(FAC2:RECORD,FAC2:IDFACTURA)) , 'FACTURAXCUPON')
       DbChangeTrigger.AddItem(FAC2:IDSOCIO, WHO(FAC2:RECORD,WHERE(FAC2:RECORD,FAC2:IDSOCIO)) , 'FACTURAXCUPON')
       DbChangeTrigger.AddItem(FAC2:IDLOTE, WHO(FAC2:RECORD,WHERE(FAC2:RECORD,FAC2:IDLOTE)) , 'FACTURAXCUPON')
    END
    DbChangeTrigger.Update('FACTURAXCUPON')


Hide:Relate:FACTURAXCUPON.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('FACTURAXCUPON')
        DbChangeTrigger.CheckChanges('FACTURAXCUPON',FACTURAXCUPON) 
     END
  RETURN ReturnValue


Hide:Relate:LOTE.Init PROCEDURE()
  CODE
  _Hide:Access:LOTE.Init
  SELF.Init(Access:LOTE,1)


Hide:Access:LOTE.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('LOTE')
      DbChangeTrigger.AddThread('LOTE')
      DbChangeTrigger.AddItem(LOT:IDLOTE, WHO(LOT:RECORD,WHERE(LOT:RECORD,LOT:IDLOTE)) , 'LOTE')
      DbChangeTrigger.AddItem(LOT:FECHA, WHO(LOT:RECORD,WHERE(LOT:RECORD,LOT:FECHA)) , 'LOTE')
      DbChangeTrigger.AddItem(LOT:HORA, WHO(LOT:RECORD,WHERE(LOT:RECORD,LOT:HORA)) , 'LOTE')
      DbChangeTrigger.AddItem(LOT:IDUSUARIO, WHO(LOT:RECORD,WHERE(LOT:RECORD,LOT:IDUSUARIO)) , 'LOTE')
   END
   DbChangeTrigger.Update('LOTE')
  RETURN ReturnValue


Hide:Access:LOTE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LOT:Record
  SELF.FileNameValue = 'LOTE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LOTE
  PARENT.Init
  Access:LOTE &= SELF


Hide:Access:LOTE.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('LOTE',LOTE)
  RETURN ReturnValue


Hide:Access:LOTE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LOTE &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LOTE.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('LOTE')
      DbChangeTrigger.AddThread('LOTE')
      DbChangeTrigger.AddItem(LOT:IDLOTE, WHO(LOT:RECORD,WHERE(LOT:RECORD,LOT:IDLOTE)) , 'LOTE')
      DbChangeTrigger.AddItem(LOT:FECHA, WHO(LOT:RECORD,WHERE(LOT:RECORD,LOT:FECHA)) , 'LOTE')
      DbChangeTrigger.AddItem(LOT:HORA, WHO(LOT:RECORD,WHERE(LOT:RECORD,LOT:HORA)) , 'LOTE')
      DbChangeTrigger.AddItem(LOT:IDUSUARIO, WHO(LOT:RECORD,WHERE(LOT:RECORD,LOT:IDUSUARIO)) , 'LOTE')
   END
   DbChangeTrigger.Update('LOTE')
  RETURN ReturnValue


Hide:Access:LOTE.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('LOTE')
      DbChangeTrigger.AddThread('LOTE')
      DbChangeTrigger.AddItem(LOT:IDLOTE, WHO(LOT:RECORD,WHERE(LOT:RECORD,LOT:IDLOTE)) , 'LOTE')
      DbChangeTrigger.AddItem(LOT:FECHA, WHO(LOT:RECORD,WHERE(LOT:RECORD,LOT:FECHA)) , 'LOTE')
      DbChangeTrigger.AddItem(LOT:HORA, WHO(LOT:RECORD,WHERE(LOT:RECORD,LOT:HORA)) , 'LOTE')
      DbChangeTrigger.AddItem(LOT:IDUSUARIO, WHO(LOT:RECORD,WHERE(LOT:RECORD,LOT:IDUSUARIO)) , 'LOTE')
   END
   DbChangeTrigger.Update('LOTE')
  RETURN ReturnValue


Hide:Access:LOTE.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('LOTE')
       DbChangeTrigger.CheckChanges('LOTE',LOTE) 
    END
  RETURN ReturnValue


Hide:Access:LOTE.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LOTE,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(LOT:PK_LOTE,'LOT:PK_LOTE',0)
    SELF.AddKey(LOT:FK_LOTE_USUARIO,'LOT:FK_LOTE_USUARIO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LOTE.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:FACTURAXCUPON,RI:None,RI:None,FAC2:FK_FACTURAXCUPON_LOTE)
  SELF.AddRelationLink(LOT:IDLOTE,FAC2:IDLOTE)


Hide:Relate:LOTE.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('LOTE',LOTE)
  RETURN ReturnValue


Hide:Relate:LOTE.Kill PROCEDURE

  CODE
  _Hide:Access:LOTE.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:LOTE &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LOTE)                               ! destroy the file manager


Hide:Relate:LOTE.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('LOTE')
       DbChangeTrigger.AddThread('LOTE')
       DbChangeTrigger.AddItem(LOT:IDLOTE, WHO(LOT:RECORD,WHERE(LOT:RECORD,LOT:IDLOTE)) , 'LOTE')
       DbChangeTrigger.AddItem(LOT:FECHA, WHO(LOT:RECORD,WHERE(LOT:RECORD,LOT:FECHA)) , 'LOTE')
       DbChangeTrigger.AddItem(LOT:HORA, WHO(LOT:RECORD,WHERE(LOT:RECORD,LOT:HORA)) , 'LOTE')
       DbChangeTrigger.AddItem(LOT:IDUSUARIO, WHO(LOT:RECORD,WHERE(LOT:RECORD,LOT:IDUSUARIO)) , 'LOTE')
    END
    DbChangeTrigger.Update('LOTE')


Hide:Relate:LOTE.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('LOTE')
        DbChangeTrigger.CheckChanges('LOTE',LOTE) 
     END
  RETURN ReturnValue


Hide:Relate:CAJA.Init PROCEDURE()
  CODE
  _Hide:Access:CAJA.Init
  SELF.Init(Access:CAJA,1)


Hide:Access:CAJA.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CAJA')
      DbChangeTrigger.AddThread('CAJA')
      DbChangeTrigger.AddItem(CAJ:IDCAJA, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:IDCAJA)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:IDSUBCUENTA, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:IDSUBCUENTA)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:IDUSUARIO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:IDUSUARIO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:DEBE, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:DEBE)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:HABER, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:HABER)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:MONTO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:MONTO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:OBSERVACION, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:OBSERVACION)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:FECHA, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:FECHA)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:MES, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:MES)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:ANO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:ANO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:PERIODO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:PERIODO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:SUCURSAL, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:SUCURSAL)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:RECIBO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:RECIBO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:TIPO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:TIPO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:IDTRANSACCION, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:IDTRANSACCION)) , 'CAJA')
   END
   DbChangeTrigger.Update('CAJA')
  RETURN ReturnValue


Hide:Access:CAJA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CAJ:Record
  SELF.FileNameValue = 'CAJA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CAJA
  PARENT.Init
  Access:CAJA &= SELF


Hide:Access:CAJA.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CAJA',CAJA)
  RETURN ReturnValue


Hide:Access:CAJA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CAJA &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CAJA.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CAJA')
      DbChangeTrigger.AddThread('CAJA')
      DbChangeTrigger.AddItem(CAJ:IDCAJA, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:IDCAJA)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:IDSUBCUENTA, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:IDSUBCUENTA)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:IDUSUARIO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:IDUSUARIO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:DEBE, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:DEBE)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:HABER, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:HABER)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:MONTO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:MONTO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:OBSERVACION, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:OBSERVACION)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:FECHA, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:FECHA)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:MES, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:MES)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:ANO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:ANO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:PERIODO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:PERIODO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:SUCURSAL, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:SUCURSAL)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:RECIBO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:RECIBO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:TIPO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:TIPO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:IDTRANSACCION, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:IDTRANSACCION)) , 'CAJA')
   END
   DbChangeTrigger.Update('CAJA')
  RETURN ReturnValue


Hide:Access:CAJA.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CAJA')
      DbChangeTrigger.AddThread('CAJA')
      DbChangeTrigger.AddItem(CAJ:IDCAJA, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:IDCAJA)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:IDSUBCUENTA, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:IDSUBCUENTA)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:IDUSUARIO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:IDUSUARIO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:DEBE, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:DEBE)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:HABER, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:HABER)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:MONTO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:MONTO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:OBSERVACION, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:OBSERVACION)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:FECHA, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:FECHA)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:MES, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:MES)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:ANO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:ANO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:PERIODO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:PERIODO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:SUCURSAL, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:SUCURSAL)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:RECIBO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:RECIBO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:TIPO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:TIPO)) , 'CAJA')
      DbChangeTrigger.AddItem(CAJ:IDTRANSACCION, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:IDTRANSACCION)) , 'CAJA')
   END
   DbChangeTrigger.Update('CAJA')
  RETURN ReturnValue


Hide:Access:CAJA.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CAJA')
       DbChangeTrigger.CheckChanges('CAJA',CAJA) 
    END
  RETURN ReturnValue


Hide:Access:CAJA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CAJA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CAJ:PK_CAJA,'CAJ:PK_CAJA',0)
    SELF.AddKey(CAJ:FK_CAJA_USUARIOS,'CAJ:FK_CAJA_USUARIOS',0)
    SELF.AddKey(CAJ:FK_CAJA_SUBCUENTA,'CAJ:FK_CAJA_SUBCUENTA',0)
    SELF.AddKey(CAJ:IDX_CAJA_FECHA,'CAJ:IDX_CAJA_FECHA',0)
    SELF.AddKey(CAJ:IDX_CAJA_MES,'CAJ:IDX_CAJA_MES',0)
    SELF.AddKey(CAJ:IDX_CAJA_ANO,'CAJ:IDX_CAJA_ANO',0)
    SELF.AddKey(CAJ:IDX_CAJA_PERIODO,'CAJ:IDX_CAJA_PERIODO',0)
    SELF.AddKey(CAJ:IDX_CAJA_TRANSACCION,'CAJ:IDX_CAJA_TRANSACCION',0)
    SELF.AddKey(CAJ:IDX_UNIQUE_TRANSAC,'CAJ:IDX_UNIQUE_TRANSAC',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CAJA.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SUBCUENTAS2   USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('CAJ:IDSUBCUENTA')
    Save:SUBCUENTAS2 = Access:SUBCUENTAS.SaveFile()
    SUB:IDSUBCUENTA = CAJ:IDSUBCUENTA
    ReturnValue = Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUBCUENTAS')
      END
    END
    Access:SUBCUENTAS.RestoreFile(Save:SUBCUENTAS2)
  END
  RETURN ReturnValue


Hide:Relate:CAJA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SUBCUENTAS)


Hide:Relate:CAJA.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CAJA',CAJA)
  RETURN ReturnValue


Hide:Relate:CAJA.Kill PROCEDURE

  CODE
  _Hide:Access:CAJA.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:CAJA &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CAJA)                               ! destroy the file manager


Hide:Relate:CAJA.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CAJA')
       DbChangeTrigger.AddThread('CAJA')
       DbChangeTrigger.AddItem(CAJ:IDCAJA, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:IDCAJA)) , 'CAJA')
       DbChangeTrigger.AddItem(CAJ:IDSUBCUENTA, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:IDSUBCUENTA)) , 'CAJA')
       DbChangeTrigger.AddItem(CAJ:IDUSUARIO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:IDUSUARIO)) , 'CAJA')
       DbChangeTrigger.AddItem(CAJ:DEBE, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:DEBE)) , 'CAJA')
       DbChangeTrigger.AddItem(CAJ:HABER, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:HABER)) , 'CAJA')
       DbChangeTrigger.AddItem(CAJ:MONTO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:MONTO)) , 'CAJA')
       DbChangeTrigger.AddItem(CAJ:OBSERVACION, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:OBSERVACION)) , 'CAJA')
       DbChangeTrigger.AddItem(CAJ:FECHA, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:FECHA)) , 'CAJA')
       DbChangeTrigger.AddItem(CAJ:MES, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:MES)) , 'CAJA')
       DbChangeTrigger.AddItem(CAJ:ANO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:ANO)) , 'CAJA')
       DbChangeTrigger.AddItem(CAJ:PERIODO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:PERIODO)) , 'CAJA')
       DbChangeTrigger.AddItem(CAJ:SUCURSAL, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:SUCURSAL)) , 'CAJA')
       DbChangeTrigger.AddItem(CAJ:RECIBO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:RECIBO)) , 'CAJA')
       DbChangeTrigger.AddItem(CAJ:TIPO, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:TIPO)) , 'CAJA')
       DbChangeTrigger.AddItem(CAJ:IDTRANSACCION, WHO(CAJ:RECORD,WHERE(CAJ:RECORD,CAJ:IDTRANSACCION)) , 'CAJA')
    END
    DbChangeTrigger.Update('CAJA')


Hide:Relate:CAJA.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CAJA')
        DbChangeTrigger.CheckChanges('CAJA',CAJA) 
     END
  RETURN ReturnValue


Hide:Relate:CUENTAS.Init PROCEDURE()
  CODE
  _Hide:Access:CUENTAS.Init
  SELF.Init(Access:CUENTAS,1)


Hide:Access:CUENTAS.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('CUENTAS')
      DbChangeTrigger.AddThread('CUENTAS')
      DbChangeTrigger.AddItem(CUE:IDCUENTA, WHO(CUE:RECORD,WHERE(CUE:RECORD,CUE:IDCUENTA)) , 'CUENTAS')
      DbChangeTrigger.AddItem(CUE:DESCRIPCION, WHO(CUE:RECORD,WHERE(CUE:RECORD,CUE:DESCRIPCION)) , 'CUENTAS')
      DbChangeTrigger.AddItem(CUE:TIPO, WHO(CUE:RECORD,WHERE(CUE:RECORD,CUE:TIPO)) , 'CUENTAS')
   END
   DbChangeTrigger.Update('CUENTAS')
  RETURN ReturnValue


Hide:Access:CUENTAS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CUE:Record
  SELF.FileNameValue = 'CUENTAS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CUENTAS
  PARENT.Init
  Access:CUENTAS &= SELF


Hide:Access:CUENTAS.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('CUENTAS',CUENTAS)
  RETURN ReturnValue


Hide:Access:CUENTAS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CUENTAS &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CUENTAS.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('CUENTAS')
      DbChangeTrigger.AddThread('CUENTAS')
      DbChangeTrigger.AddItem(CUE:IDCUENTA, WHO(CUE:RECORD,WHERE(CUE:RECORD,CUE:IDCUENTA)) , 'CUENTAS')
      DbChangeTrigger.AddItem(CUE:DESCRIPCION, WHO(CUE:RECORD,WHERE(CUE:RECORD,CUE:DESCRIPCION)) , 'CUENTAS')
      DbChangeTrigger.AddItem(CUE:TIPO, WHO(CUE:RECORD,WHERE(CUE:RECORD,CUE:TIPO)) , 'CUENTAS')
   END
   DbChangeTrigger.Update('CUENTAS')
  RETURN ReturnValue


Hide:Access:CUENTAS.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('CUENTAS')
      DbChangeTrigger.AddThread('CUENTAS')
      DbChangeTrigger.AddItem(CUE:IDCUENTA, WHO(CUE:RECORD,WHERE(CUE:RECORD,CUE:IDCUENTA)) , 'CUENTAS')
      DbChangeTrigger.AddItem(CUE:DESCRIPCION, WHO(CUE:RECORD,WHERE(CUE:RECORD,CUE:DESCRIPCION)) , 'CUENTAS')
      DbChangeTrigger.AddItem(CUE:TIPO, WHO(CUE:RECORD,WHERE(CUE:RECORD,CUE:TIPO)) , 'CUENTAS')
   END
   DbChangeTrigger.Update('CUENTAS')
  RETURN ReturnValue


Hide:Access:CUENTAS.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('CUENTAS')
       DbChangeTrigger.CheckChanges('CUENTAS',CUENTAS) 
    END
  RETURN ReturnValue


Hide:Access:CUENTAS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CUENTAS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CUE:PK_CUENTAS,'CUE:PK_CUENTAS',0)
    SELF.AddKey(CUE:IDX_TIPO,'CUE:IDX_TIPO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CUENTAS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SUBCUENTAS,RI:None,RI:None,SUB:FK_SUBCUENTAS)
  SELF.AddRelationLink(CUE:IDCUENTA,SUB:IDCUENTA)


Hide:Relate:CUENTAS.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('CUENTAS',CUENTAS)
  RETURN ReturnValue


Hide:Relate:CUENTAS.Kill PROCEDURE

  CODE
  _Hide:Access:CUENTAS.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:CUENTAS &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CUENTAS)                            ! destroy the file manager


Hide:Relate:CUENTAS.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('CUENTAS')
       DbChangeTrigger.AddThread('CUENTAS')
       DbChangeTrigger.AddItem(CUE:IDCUENTA, WHO(CUE:RECORD,WHERE(CUE:RECORD,CUE:IDCUENTA)) , 'CUENTAS')
       DbChangeTrigger.AddItem(CUE:DESCRIPCION, WHO(CUE:RECORD,WHERE(CUE:RECORD,CUE:DESCRIPCION)) , 'CUENTAS')
       DbChangeTrigger.AddItem(CUE:TIPO, WHO(CUE:RECORD,WHERE(CUE:RECORD,CUE:TIPO)) , 'CUENTAS')
    END
    DbChangeTrigger.Update('CUENTAS')


Hide:Relate:CUENTAS.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('CUENTAS')
        DbChangeTrigger.CheckChanges('CUENTAS',CUENTAS) 
     END
  RETURN ReturnValue


Hide:Relate:GASTOS.Init PROCEDURE()
  CODE
  _Hide:Access:GASTOS.Init
  SELF.Init(Access:GASTOS,1)


Hide:Access:GASTOS.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('GASTOS')
      DbChangeTrigger.AddThread('GASTOS')
      DbChangeTrigger.AddItem(GAS:IDGASTOS, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDGASTOS)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:IDUSUARIO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDUSUARIO)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:IDSUBCUENTA, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDSUBCUENTA)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:OBSERVACION, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:OBSERVACION)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:MONTO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:MONTO)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:FECHA, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:FECHA)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:HORA, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:HORA)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:MES, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:MES)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:ANO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:ANO)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:PERIODO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:PERIODO)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:IDPROVEEDOR, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDPROVEEDOR)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:SUCURSAL, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:SUCURSAL)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:IDRECIBO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDRECIBO)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:IDTIPO_COMPROBANTE, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDTIPO_COMPROBANTE)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:LETRA, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:LETRA)) , 'GASTOS')
   END
   DbChangeTrigger.Update('GASTOS')
  RETURN ReturnValue


Hide:Access:GASTOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GAS:Record
  SELF.FileNameValue = 'GASTOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GASTOS
  PARENT.Init
  Access:GASTOS &= SELF


Hide:Access:GASTOS.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('GASTOS',GASTOS)
  RETURN ReturnValue


Hide:Access:GASTOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GASTOS &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GASTOS.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('GASTOS')
      DbChangeTrigger.AddThread('GASTOS')
      DbChangeTrigger.AddItem(GAS:IDGASTOS, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDGASTOS)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:IDUSUARIO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDUSUARIO)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:IDSUBCUENTA, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDSUBCUENTA)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:OBSERVACION, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:OBSERVACION)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:MONTO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:MONTO)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:FECHA, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:FECHA)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:HORA, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:HORA)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:MES, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:MES)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:ANO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:ANO)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:PERIODO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:PERIODO)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:IDPROVEEDOR, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDPROVEEDOR)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:SUCURSAL, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:SUCURSAL)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:IDRECIBO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDRECIBO)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:IDTIPO_COMPROBANTE, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDTIPO_COMPROBANTE)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:LETRA, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:LETRA)) , 'GASTOS')
   END
   DbChangeTrigger.Update('GASTOS')
  RETURN ReturnValue


Hide:Access:GASTOS.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('GASTOS')
      DbChangeTrigger.AddThread('GASTOS')
      DbChangeTrigger.AddItem(GAS:IDGASTOS, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDGASTOS)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:IDUSUARIO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDUSUARIO)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:IDSUBCUENTA, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDSUBCUENTA)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:OBSERVACION, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:OBSERVACION)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:MONTO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:MONTO)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:FECHA, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:FECHA)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:HORA, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:HORA)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:MES, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:MES)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:ANO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:ANO)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:PERIODO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:PERIODO)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:IDPROVEEDOR, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDPROVEEDOR)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:SUCURSAL, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:SUCURSAL)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:IDRECIBO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDRECIBO)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:IDTIPO_COMPROBANTE, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDTIPO_COMPROBANTE)) , 'GASTOS')
      DbChangeTrigger.AddItem(GAS:LETRA, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:LETRA)) , 'GASTOS')
   END
   DbChangeTrigger.Update('GASTOS')
  RETURN ReturnValue


Hide:Access:GASTOS.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('GASTOS')
       DbChangeTrigger.CheckChanges('GASTOS',GASTOS) 
    END
  RETURN ReturnValue


Hide:Access:GASTOS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GASTOS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(GAS:PK_GASTOS,'GAS:PK_GASTOS',0)
    SELF.AddKey(GAS:FK_GASTOS_SUBCUENTA,'GAS:FK_GASTOS_SUBCUENTA',0)
    SELF.AddKey(GAS:FK_GASTOS_USUARIO,'GAS:FK_GASTOS_USUARIO',0)
    SELF.AddKey(GAS:IDX_GASTOS_FECHA,'GAS:IDX_GASTOS_FECHA',0)
    SELF.AddKey(GAS:IDX_GASTOS_UNIQUE,'GAS:IDX_GASTOS_UNIQUE',0)
    SELF.AddKey(GAS:FK_GASTOS1,'GAS:FK_GASTOS1',0)
    SELF.AddKey(GAS:FK_GASTOS_TIPO_COMPROBANTE,'GAS:FK_GASTOS_TIPO_COMPROBANTE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:GASTOS.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SUBCUENTAS3   USHORT,AUTO
Save:TIPO_COMPROBANTE14 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('GAS:IDSUBCUENTA')
    Save:SUBCUENTAS3 = Access:SUBCUENTAS.SaveFile()
    SUB:IDSUBCUENTA = GAS:IDSUBCUENTA
    ReturnValue = Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUBCUENTAS')
      END
    END
    Access:SUBCUENTAS.RestoreFile(Save:SUBCUENTAS3)
  OF 14
    GlobalErrors.SetField('GAS:IDTIPO_COMPROBANTE')
    Save:TIPO_COMPROBANTE14 = Access:TIPO_COMPROBANTE.SaveFile()
    TIPCOM:IDTIPO_COMPROBANTE = GAS:IDTIPO_COMPROBANTE
    ReturnValue = Access:TIPO_COMPROBANTE.TryFetch(TIPCOM:PK_TIPO_COMPROBANTE)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_COMPROBANTE')
      END
    END
    Access:TIPO_COMPROBANTE.RestoreFile(Save:TIPO_COMPROBANTE14)
  END
  RETURN ReturnValue


Hide:Relate:GASTOS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TIPO_COMPROBANTE)

  SELF.AddRelation(Relate:USUARIO)

  SELF.AddRelation(Relate:SUBCUENTAS)

  SELF.AddRelation(Relate:PROVEEDORES)


Hide:Relate:GASTOS.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('GASTOS',GASTOS)
  RETURN ReturnValue


Hide:Relate:GASTOS.Kill PROCEDURE

  CODE
  _Hide:Access:GASTOS.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:GASTOS &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GASTOS)                             ! destroy the file manager


Hide:Relate:GASTOS.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('GASTOS')
       DbChangeTrigger.AddThread('GASTOS')
       DbChangeTrigger.AddItem(GAS:IDGASTOS, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDGASTOS)) , 'GASTOS')
       DbChangeTrigger.AddItem(GAS:IDUSUARIO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDUSUARIO)) , 'GASTOS')
       DbChangeTrigger.AddItem(GAS:IDSUBCUENTA, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDSUBCUENTA)) , 'GASTOS')
       DbChangeTrigger.AddItem(GAS:OBSERVACION, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:OBSERVACION)) , 'GASTOS')
       DbChangeTrigger.AddItem(GAS:MONTO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:MONTO)) , 'GASTOS')
       DbChangeTrigger.AddItem(GAS:FECHA, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:FECHA)) , 'GASTOS')
       DbChangeTrigger.AddItem(GAS:HORA, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:HORA)) , 'GASTOS')
       DbChangeTrigger.AddItem(GAS:MES, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:MES)) , 'GASTOS')
       DbChangeTrigger.AddItem(GAS:ANO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:ANO)) , 'GASTOS')
       DbChangeTrigger.AddItem(GAS:PERIODO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:PERIODO)) , 'GASTOS')
       DbChangeTrigger.AddItem(GAS:IDPROVEEDOR, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDPROVEEDOR)) , 'GASTOS')
       DbChangeTrigger.AddItem(GAS:SUCURSAL, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:SUCURSAL)) , 'GASTOS')
       DbChangeTrigger.AddItem(GAS:IDRECIBO, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDRECIBO)) , 'GASTOS')
       DbChangeTrigger.AddItem(GAS:IDTIPO_COMPROBANTE, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:IDTIPO_COMPROBANTE)) , 'GASTOS')
       DbChangeTrigger.AddItem(GAS:LETRA, WHO(GAS:RECORD,WHERE(GAS:RECORD,GAS:LETRA)) , 'GASTOS')
    END
    DbChangeTrigger.Update('GASTOS')


Hide:Relate:GASTOS.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('GASTOS')
        DbChangeTrigger.CheckChanges('GASTOS',GASTOS) 
     END
  RETURN ReturnValue


Hide:Relate:INGRESOS.Init PROCEDURE()
  CODE
  _Hide:Access:INGRESOS.Init
  SELF.Init(Access:INGRESOS,1)


Hide:Access:INGRESOS.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('INGRESOS')
      DbChangeTrigger.AddThread('INGRESOS')
      DbChangeTrigger.AddItem(ING:IDINGRESO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDINGRESO)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:IDUSUARIO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDUSUARIO)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:IDSUBCUENTA, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDSUBCUENTA)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:OBSERVACION, WHO(ING:RECORD,WHERE(ING:RECORD,ING:OBSERVACION)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:MONTO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:MONTO)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:FECHA, WHO(ING:RECORD,WHERE(ING:RECORD,ING:FECHA)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:HORA, WHO(ING:RECORD,WHERE(ING:RECORD,ING:HORA)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:MES, WHO(ING:RECORD,WHERE(ING:RECORD,ING:MES)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:ANO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:ANO)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:PERIODO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:PERIODO)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:IDPROVEEDOR, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDPROVEEDOR)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:SUCURSAL, WHO(ING:RECORD,WHERE(ING:RECORD,ING:SUCURSAL)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:IDRECIBO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDRECIBO)) , 'INGRESOS')
   END
   DbChangeTrigger.Update('INGRESOS')
  RETURN ReturnValue


Hide:Access:INGRESOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ING:Record
  SELF.FileNameValue = 'INGRESOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= INGRESOS
  PARENT.Init
  Access:INGRESOS &= SELF


Hide:Access:INGRESOS.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('INGRESOS',INGRESOS)
  RETURN ReturnValue


Hide:Access:INGRESOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:INGRESOS &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:INGRESOS.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('INGRESOS')
      DbChangeTrigger.AddThread('INGRESOS')
      DbChangeTrigger.AddItem(ING:IDINGRESO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDINGRESO)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:IDUSUARIO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDUSUARIO)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:IDSUBCUENTA, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDSUBCUENTA)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:OBSERVACION, WHO(ING:RECORD,WHERE(ING:RECORD,ING:OBSERVACION)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:MONTO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:MONTO)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:FECHA, WHO(ING:RECORD,WHERE(ING:RECORD,ING:FECHA)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:HORA, WHO(ING:RECORD,WHERE(ING:RECORD,ING:HORA)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:MES, WHO(ING:RECORD,WHERE(ING:RECORD,ING:MES)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:ANO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:ANO)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:PERIODO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:PERIODO)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:IDPROVEEDOR, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDPROVEEDOR)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:SUCURSAL, WHO(ING:RECORD,WHERE(ING:RECORD,ING:SUCURSAL)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:IDRECIBO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDRECIBO)) , 'INGRESOS')
   END
   DbChangeTrigger.Update('INGRESOS')
  RETURN ReturnValue


Hide:Access:INGRESOS.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('INGRESOS')
      DbChangeTrigger.AddThread('INGRESOS')
      DbChangeTrigger.AddItem(ING:IDINGRESO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDINGRESO)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:IDUSUARIO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDUSUARIO)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:IDSUBCUENTA, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDSUBCUENTA)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:OBSERVACION, WHO(ING:RECORD,WHERE(ING:RECORD,ING:OBSERVACION)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:MONTO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:MONTO)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:FECHA, WHO(ING:RECORD,WHERE(ING:RECORD,ING:FECHA)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:HORA, WHO(ING:RECORD,WHERE(ING:RECORD,ING:HORA)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:MES, WHO(ING:RECORD,WHERE(ING:RECORD,ING:MES)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:ANO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:ANO)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:PERIODO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:PERIODO)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:IDPROVEEDOR, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDPROVEEDOR)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:SUCURSAL, WHO(ING:RECORD,WHERE(ING:RECORD,ING:SUCURSAL)) , 'INGRESOS')
      DbChangeTrigger.AddItem(ING:IDRECIBO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDRECIBO)) , 'INGRESOS')
   END
   DbChangeTrigger.Update('INGRESOS')
  RETURN ReturnValue


Hide:Access:INGRESOS.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('INGRESOS')
       DbChangeTrigger.CheckChanges('INGRESOS',INGRESOS) 
    END
  RETURN ReturnValue


Hide:Access:INGRESOS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(INGRESOS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(ING:PK_INGRESOS,'ING:PK_INGRESOS',0)
    SELF.AddKey(ING:FK_INGRESOS_SUBCUENTA,'ING:FK_INGRESOS_SUBCUENTA',0)
    SELF.AddKey(ING:FK_INGRESOS_USUARIOS,'ING:FK_INGRESOS_USUARIOS',0)
    SELF.AddKey(ING:IDX_INGRESOS_FECHA,'ING:IDX_INGRESOS_FECHA',0)
    SELF.AddKey(ING:IDX_INGRESOS_UNIQUE,'ING:IDX_INGRESOS_UNIQUE',0)
    SELF.AddKey(ING:FK_INGRESOS_PROVEEDOR,'ING:FK_INGRESOS_PROVEEDOR',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:INGRESOS.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SUBCUENTAS3   USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('ING:IDSUBCUENTA')
    Save:SUBCUENTAS3 = Access:SUBCUENTAS.SaveFile()
    SUB:IDSUBCUENTA = ING:IDSUBCUENTA
    ReturnValue = Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUBCUENTAS')
      END
    END
    Access:SUBCUENTAS.RestoreFile(Save:SUBCUENTAS3)
  END
  RETURN ReturnValue


Hide:Relate:INGRESOS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:USUARIO)

  SELF.AddRelation(Relate:SUBCUENTAS)

  SELF.AddRelation(Relate:PROVEEDORES)


Hide:Relate:INGRESOS.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('INGRESOS',INGRESOS)
  RETURN ReturnValue


Hide:Relate:INGRESOS.Kill PROCEDURE

  CODE
  _Hide:Access:INGRESOS.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:INGRESOS &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:INGRESOS)                           ! destroy the file manager


Hide:Relate:INGRESOS.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('INGRESOS')
       DbChangeTrigger.AddThread('INGRESOS')
       DbChangeTrigger.AddItem(ING:IDINGRESO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDINGRESO)) , 'INGRESOS')
       DbChangeTrigger.AddItem(ING:IDUSUARIO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDUSUARIO)) , 'INGRESOS')
       DbChangeTrigger.AddItem(ING:IDSUBCUENTA, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDSUBCUENTA)) , 'INGRESOS')
       DbChangeTrigger.AddItem(ING:OBSERVACION, WHO(ING:RECORD,WHERE(ING:RECORD,ING:OBSERVACION)) , 'INGRESOS')
       DbChangeTrigger.AddItem(ING:MONTO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:MONTO)) , 'INGRESOS')
       DbChangeTrigger.AddItem(ING:FECHA, WHO(ING:RECORD,WHERE(ING:RECORD,ING:FECHA)) , 'INGRESOS')
       DbChangeTrigger.AddItem(ING:HORA, WHO(ING:RECORD,WHERE(ING:RECORD,ING:HORA)) , 'INGRESOS')
       DbChangeTrigger.AddItem(ING:MES, WHO(ING:RECORD,WHERE(ING:RECORD,ING:MES)) , 'INGRESOS')
       DbChangeTrigger.AddItem(ING:ANO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:ANO)) , 'INGRESOS')
       DbChangeTrigger.AddItem(ING:PERIODO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:PERIODO)) , 'INGRESOS')
       DbChangeTrigger.AddItem(ING:IDPROVEEDOR, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDPROVEEDOR)) , 'INGRESOS')
       DbChangeTrigger.AddItem(ING:SUCURSAL, WHO(ING:RECORD,WHERE(ING:RECORD,ING:SUCURSAL)) , 'INGRESOS')
       DbChangeTrigger.AddItem(ING:IDRECIBO, WHO(ING:RECORD,WHERE(ING:RECORD,ING:IDRECIBO)) , 'INGRESOS')
    END
    DbChangeTrigger.Update('INGRESOS')


Hide:Relate:INGRESOS.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('INGRESOS')
        DbChangeTrigger.CheckChanges('INGRESOS',INGRESOS) 
     END
  RETURN ReturnValue


Hide:Relate:LIBDIARIO.Init PROCEDURE()
  CODE
  _Hide:Access:LIBDIARIO.Init
  SELF.Init(Access:LIBDIARIO,1)


Hide:Access:LIBDIARIO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('LIBDIARIO')
      DbChangeTrigger.AddThread('LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:IDLIBDIARIO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:IDLIBDIARIO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:IDSUBCUENTA, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:IDSUBCUENTA)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:DEBE, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:DEBE)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:HABER, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:HABER)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:OBSERVACION, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:OBSERVACION)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:FECHA, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:FECHA)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:HORA, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:HORA)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:MES, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:MES)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:ANO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:ANO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:PERIODO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:PERIODO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:FONDO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:FONDO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:SUCURSAL, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:SUCURSAL)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:RECIBO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:RECIBO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:IDPROVEEDOR, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:IDPROVEEDOR)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:TIPO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:TIPO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:IDTRANSACCION, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:IDTRANSACCION)) , 'LIBDIARIO')
   END
   DbChangeTrigger.Update('LIBDIARIO')
  RETURN ReturnValue


Hide:Access:LIBDIARIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LIB:Record
  SELF.FileNameValue = 'LIBDIARIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LIBDIARIO
  PARENT.Init
  Access:LIBDIARIO &= SELF


Hide:Access:LIBDIARIO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('LIBDIARIO',LIBDIARIO)
  RETURN ReturnValue


Hide:Access:LIBDIARIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LIBDIARIO &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LIBDIARIO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('LIBDIARIO')
      DbChangeTrigger.AddThread('LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:IDLIBDIARIO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:IDLIBDIARIO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:IDSUBCUENTA, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:IDSUBCUENTA)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:DEBE, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:DEBE)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:HABER, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:HABER)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:OBSERVACION, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:OBSERVACION)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:FECHA, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:FECHA)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:HORA, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:HORA)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:MES, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:MES)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:ANO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:ANO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:PERIODO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:PERIODO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:FONDO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:FONDO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:SUCURSAL, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:SUCURSAL)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:RECIBO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:RECIBO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:IDPROVEEDOR, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:IDPROVEEDOR)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:TIPO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:TIPO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:IDTRANSACCION, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:IDTRANSACCION)) , 'LIBDIARIO')
   END
   DbChangeTrigger.Update('LIBDIARIO')
  RETURN ReturnValue


Hide:Access:LIBDIARIO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('LIBDIARIO')
      DbChangeTrigger.AddThread('LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:IDLIBDIARIO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:IDLIBDIARIO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:IDSUBCUENTA, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:IDSUBCUENTA)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:DEBE, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:DEBE)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:HABER, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:HABER)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:OBSERVACION, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:OBSERVACION)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:FECHA, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:FECHA)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:HORA, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:HORA)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:MES, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:MES)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:ANO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:ANO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:PERIODO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:PERIODO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:FONDO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:FONDO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:SUCURSAL, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:SUCURSAL)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:RECIBO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:RECIBO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:IDPROVEEDOR, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:IDPROVEEDOR)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:TIPO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:TIPO)) , 'LIBDIARIO')
      DbChangeTrigger.AddItem(LIB:IDTRANSACCION, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:IDTRANSACCION)) , 'LIBDIARIO')
   END
   DbChangeTrigger.Update('LIBDIARIO')
  RETURN ReturnValue


Hide:Access:LIBDIARIO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('LIBDIARIO')
       DbChangeTrigger.CheckChanges('LIBDIARIO',LIBDIARIO) 
    END
  RETURN ReturnValue


Hide:Access:LIBDIARIO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LIBDIARIO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(LIB:PK_LIBDIARIO,'LIB:PK_LIBDIARIO',0)
    SELF.AddKey(LIB:FK_LIBDIARIO_SUBCUENTA,'LIB:FK_LIBDIARIO_SUBCUENTA',0)
    SELF.AddKey(LIB:IDX_LIBDIARIO_FECHA,'LIB:IDX_LIBDIARIO_FECHA',0)
    SELF.AddKey(LIB:IDX_LIBDIARIO_MES,'LIB:IDX_LIBDIARIO_MES',0)
    SELF.AddKey(LIB:IDX_LIBDIARIO_ANO,'LIB:IDX_LIBDIARIO_ANO',0)
    SELF.AddKey(LIB:IDX_LIBDIARIO_PERIODO,'LIB:IDX_LIBDIARIO_PERIODO',0)
    SELF.AddKey(LIB:IDX_LIBDIARIO_TRANSACCION,'LIB:IDX_LIBDIARIO_TRANSACCION',0)
    SELF.AddKey(LIB:IDX_LIBDIARIO_UNIQUE_TRANSAC,'LIB:IDX_LIBDIARIO_UNIQUE_TRANSAC',0)
    SELF.AddKey(LIB:IDX_LIBDIARIO_RECIBO,'LIB:IDX_LIBDIARIO_RECIBO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:LIBDIARIO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SUBCUENTAS2   USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('LIB:IDSUBCUENTA')
    Save:SUBCUENTAS2 = Access:SUBCUENTAS.SaveFile()
    SUB:IDSUBCUENTA = LIB:IDSUBCUENTA
    ReturnValue = Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUBCUENTAS')
      END
    END
    Access:SUBCUENTAS.RestoreFile(Save:SUBCUENTAS2)
  END
  RETURN ReturnValue


Hide:Relate:LIBDIARIO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SUBCUENTAS)


Hide:Relate:LIBDIARIO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('LIBDIARIO',LIBDIARIO)
  RETURN ReturnValue


Hide:Relate:LIBDIARIO.Kill PROCEDURE

  CODE
  _Hide:Access:LIBDIARIO.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:LIBDIARIO &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LIBDIARIO)                          ! destroy the file manager


Hide:Relate:LIBDIARIO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('LIBDIARIO')
       DbChangeTrigger.AddThread('LIBDIARIO')
       DbChangeTrigger.AddItem(LIB:IDLIBDIARIO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:IDLIBDIARIO)) , 'LIBDIARIO')
       DbChangeTrigger.AddItem(LIB:IDSUBCUENTA, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:IDSUBCUENTA)) , 'LIBDIARIO')
       DbChangeTrigger.AddItem(LIB:DEBE, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:DEBE)) , 'LIBDIARIO')
       DbChangeTrigger.AddItem(LIB:HABER, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:HABER)) , 'LIBDIARIO')
       DbChangeTrigger.AddItem(LIB:OBSERVACION, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:OBSERVACION)) , 'LIBDIARIO')
       DbChangeTrigger.AddItem(LIB:FECHA, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:FECHA)) , 'LIBDIARIO')
       DbChangeTrigger.AddItem(LIB:HORA, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:HORA)) , 'LIBDIARIO')
       DbChangeTrigger.AddItem(LIB:MES, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:MES)) , 'LIBDIARIO')
       DbChangeTrigger.AddItem(LIB:ANO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:ANO)) , 'LIBDIARIO')
       DbChangeTrigger.AddItem(LIB:PERIODO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:PERIODO)) , 'LIBDIARIO')
       DbChangeTrigger.AddItem(LIB:FONDO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:FONDO)) , 'LIBDIARIO')
       DbChangeTrigger.AddItem(LIB:SUCURSAL, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:SUCURSAL)) , 'LIBDIARIO')
       DbChangeTrigger.AddItem(LIB:RECIBO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:RECIBO)) , 'LIBDIARIO')
       DbChangeTrigger.AddItem(LIB:IDPROVEEDOR, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:IDPROVEEDOR)) , 'LIBDIARIO')
       DbChangeTrigger.AddItem(LIB:TIPO, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:TIPO)) , 'LIBDIARIO')
       DbChangeTrigger.AddItem(LIB:IDTRANSACCION, WHO(LIB:RECORD,WHERE(LIB:RECORD,LIB:IDTRANSACCION)) , 'LIBDIARIO')
    END
    DbChangeTrigger.Update('LIBDIARIO')


Hide:Relate:LIBDIARIO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('LIBDIARIO')
        DbChangeTrigger.CheckChanges('LIBDIARIO',LIBDIARIO) 
     END
  RETURN ReturnValue


Hide:Relate:SUBCUENTAS.Init PROCEDURE()
  CODE
  _Hide:Access:SUBCUENTAS.Init
  SELF.Init(Access:SUBCUENTAS,1)


Hide:Access:SUBCUENTAS.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('SUBCUENTAS')
      DbChangeTrigger.AddThread('SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:IDSUBCUENTA, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:IDSUBCUENTA)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:IDCUENTA, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:IDCUENTA)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:DESCRIPCION, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:DESCRIPCION)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:CAJA, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:CAJA)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:CONTABLE, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:CONTABLE)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:IDFONDO, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:IDFONDO)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:INFORME, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:INFORME)) , 'SUBCUENTAS')
   END
   DbChangeTrigger.Update('SUBCUENTAS')
  RETURN ReturnValue


Hide:Access:SUBCUENTAS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SUB:Record
  SELF.FileNameValue = 'SUBCUENTAS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SUBCUENTAS
  PARENT.Init
  Access:SUBCUENTAS &= SELF


Hide:Access:SUBCUENTAS.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('SUBCUENTAS',SUBCUENTAS)
  RETURN ReturnValue


Hide:Access:SUBCUENTAS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SUBCUENTAS &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SUBCUENTAS.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('SUBCUENTAS')
      DbChangeTrigger.AddThread('SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:IDSUBCUENTA, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:IDSUBCUENTA)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:IDCUENTA, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:IDCUENTA)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:DESCRIPCION, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:DESCRIPCION)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:CAJA, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:CAJA)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:CONTABLE, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:CONTABLE)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:IDFONDO, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:IDFONDO)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:INFORME, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:INFORME)) , 'SUBCUENTAS')
   END
   DbChangeTrigger.Update('SUBCUENTAS')
  RETURN ReturnValue


Hide:Access:SUBCUENTAS.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('SUBCUENTAS')
      DbChangeTrigger.AddThread('SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:IDSUBCUENTA, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:IDSUBCUENTA)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:IDCUENTA, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:IDCUENTA)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:DESCRIPCION, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:DESCRIPCION)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:CAJA, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:CAJA)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:CONTABLE, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:CONTABLE)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:IDFONDO, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:IDFONDO)) , 'SUBCUENTAS')
      DbChangeTrigger.AddItem(SUB:INFORME, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:INFORME)) , 'SUBCUENTAS')
   END
   DbChangeTrigger.Update('SUBCUENTAS')
  RETURN ReturnValue


Hide:Access:SUBCUENTAS.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('SUBCUENTAS')
       DbChangeTrigger.CheckChanges('SUBCUENTAS',SUBCUENTAS) 
    END
  RETURN ReturnValue


Hide:Access:SUBCUENTAS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SUBCUENTAS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SUB:INTEG_113,'SUB:INTEG_113',0)
    SELF.AddKey(SUB:FK_SUBCUENTAS,'SUB:FK_SUBCUENTAS',0)
    SELF.AddKey(SUB:IDX_SUBCUENTAS_CONTABLE,'SUB:IDX_SUBCUENTAS_CONTABLE',0)
    SELF.AddKey(SUB:FK_SUBCUENTAS_FONDOS,'SUB:FK_SUBCUENTAS_FONDOS',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:SUBCUENTAS.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:CUENTAS2      USHORT,AUTO
Save:FONDOS6       USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('SUB:IDCUENTA')
    Save:CUENTAS2 = Access:CUENTAS.SaveFile()
    CUE:IDCUENTA = SUB:IDCUENTA
    ReturnValue = Access:CUENTAS.TryFetch(CUE:PK_CUENTAS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CUENTAS')
      END
    END
    Access:CUENTAS.RestoreFile(Save:CUENTAS2)
  OF 6
    GlobalErrors.SetField('SUB:IDFONDO')
    Save:FONDOS6 = Access:FONDOS.SaveFile()
    FON:IDFONDO = SUB:IDFONDO
    ReturnValue = Access:FONDOS.TryFetch(FON:PK_FONDOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'FONDOS')
      END
    END
    Access:FONDOS.RestoreFile(Save:FONDOS6)
  END
  RETURN ReturnValue


Hide:Relate:SUBCUENTAS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:FONDOS)

  SELF.AddRelation(Relate:CUENTAS)

  SELF.AddRelation(Relate:PAGOS,RI:None,RI:None,PAG:FK_PAGOS_SUBCUENTA)
  SELF.AddRelationLink(SUB:IDSUBCUENTA,PAG:IDSUBCUENTA)

  SELF.AddRelation(Relate:PAGO_CONVENIO,RI:None,RI:None,PAGCON:FK_PAGO_CONVENIO_SUBCUENTA)
  SELF.AddRelationLink(SUB:IDSUBCUENTA,PAGCON:IDSUBCUENTA)

  SELF.AddRelation(Relate:CAJA,RI:None,RI:None,CAJ:FK_CAJA_SUBCUENTA)
  SELF.AddRelationLink(SUB:IDSUBCUENTA,CAJ:IDSUBCUENTA)

  SELF.AddRelation(Relate:GASTOS,RI:None,RI:None,GAS:FK_GASTOS_SUBCUENTA)
  SELF.AddRelationLink(SUB:IDSUBCUENTA,GAS:IDSUBCUENTA)

  SELF.AddRelation(Relate:INGRESOS,RI:None,RI:None,ING:FK_INGRESOS_SUBCUENTA)
  SELF.AddRelationLink(SUB:IDSUBCUENTA,ING:IDSUBCUENTA)

  SELF.AddRelation(Relate:LIBDIARIO,RI:None,RI:None,LIB:FK_LIBDIARIO_SUBCUENTA)
  SELF.AddRelationLink(SUB:IDSUBCUENTA,LIB:IDSUBCUENTA)


Hide:Relate:SUBCUENTAS.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('SUBCUENTAS',SUBCUENTAS)
  RETURN ReturnValue


Hide:Relate:SUBCUENTAS.Kill PROCEDURE

  CODE
  _Hide:Access:SUBCUENTAS.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:SUBCUENTAS &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SUBCUENTAS)                         ! destroy the file manager


Hide:Relate:SUBCUENTAS.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('SUBCUENTAS')
       DbChangeTrigger.AddThread('SUBCUENTAS')
       DbChangeTrigger.AddItem(SUB:IDSUBCUENTA, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:IDSUBCUENTA)) , 'SUBCUENTAS')
       DbChangeTrigger.AddItem(SUB:IDCUENTA, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:IDCUENTA)) , 'SUBCUENTAS')
       DbChangeTrigger.AddItem(SUB:DESCRIPCION, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:DESCRIPCION)) , 'SUBCUENTAS')
       DbChangeTrigger.AddItem(SUB:CAJA, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:CAJA)) , 'SUBCUENTAS')
       DbChangeTrigger.AddItem(SUB:CONTABLE, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:CONTABLE)) , 'SUBCUENTAS')
       DbChangeTrigger.AddItem(SUB:IDFONDO, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:IDFONDO)) , 'SUBCUENTAS')
       DbChangeTrigger.AddItem(SUB:INFORME, WHO(SUB:RECORD,WHERE(SUB:RECORD,SUB:INFORME)) , 'SUBCUENTAS')
    END
    DbChangeTrigger.Update('SUBCUENTAS')


Hide:Relate:SUBCUENTAS.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('SUBCUENTAS')
        DbChangeTrigger.CheckChanges('SUBCUENTAS',SUBCUENTAS) 
     END
  RETURN ReturnValue


Hide:Relate:NIVEL_FORMACION.Init PROCEDURE()
  CODE
  _Hide:Access:NIVEL_FORMACION.Init
  SELF.Init(Access:NIVEL_FORMACION,1)


Hide:Access:NIVEL_FORMACION.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('NIVEL_FORMACION')
      DbChangeTrigger.AddThread('NIVEL_FORMACION')
      DbChangeTrigger.AddItem(NIV:IDNIVELFOMACION, WHO(NIV:RECORD,WHERE(NIV:RECORD,NIV:IDNIVELFOMACION)) , 'NIVEL_FORMACION')
      DbChangeTrigger.AddItem(NIV:DESCRIPCION, WHO(NIV:RECORD,WHERE(NIV:RECORD,NIV:DESCRIPCION)) , 'NIVEL_FORMACION')
      DbChangeTrigger.AddItem(NIV:GRADO, WHO(NIV:RECORD,WHERE(NIV:RECORD,NIV:GRADO)) , 'NIVEL_FORMACION')
   END
   DbChangeTrigger.Update('NIVEL_FORMACION')
  RETURN ReturnValue


Hide:Access:NIVEL_FORMACION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= NIV:Record
  SELF.FileNameValue = 'NIVEL_FORMACION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= NIVEL_FORMACION
  PARENT.Init
  Access:NIVEL_FORMACION &= SELF


Hide:Access:NIVEL_FORMACION.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('NIVEL_FORMACION',NIVEL_FORMACION)
  RETURN ReturnValue


Hide:Access:NIVEL_FORMACION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:NIVEL_FORMACION &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:NIVEL_FORMACION.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('NIVEL_FORMACION')
      DbChangeTrigger.AddThread('NIVEL_FORMACION')
      DbChangeTrigger.AddItem(NIV:IDNIVELFOMACION, WHO(NIV:RECORD,WHERE(NIV:RECORD,NIV:IDNIVELFOMACION)) , 'NIVEL_FORMACION')
      DbChangeTrigger.AddItem(NIV:DESCRIPCION, WHO(NIV:RECORD,WHERE(NIV:RECORD,NIV:DESCRIPCION)) , 'NIVEL_FORMACION')
      DbChangeTrigger.AddItem(NIV:GRADO, WHO(NIV:RECORD,WHERE(NIV:RECORD,NIV:GRADO)) , 'NIVEL_FORMACION')
   END
   DbChangeTrigger.Update('NIVEL_FORMACION')
  RETURN ReturnValue


Hide:Access:NIVEL_FORMACION.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('NIVEL_FORMACION')
      DbChangeTrigger.AddThread('NIVEL_FORMACION')
      DbChangeTrigger.AddItem(NIV:IDNIVELFOMACION, WHO(NIV:RECORD,WHERE(NIV:RECORD,NIV:IDNIVELFOMACION)) , 'NIVEL_FORMACION')
      DbChangeTrigger.AddItem(NIV:DESCRIPCION, WHO(NIV:RECORD,WHERE(NIV:RECORD,NIV:DESCRIPCION)) , 'NIVEL_FORMACION')
      DbChangeTrigger.AddItem(NIV:GRADO, WHO(NIV:RECORD,WHERE(NIV:RECORD,NIV:GRADO)) , 'NIVEL_FORMACION')
   END
   DbChangeTrigger.Update('NIVEL_FORMACION')
  RETURN ReturnValue


Hide:Access:NIVEL_FORMACION.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('NIVEL_FORMACION')
       DbChangeTrigger.CheckChanges('NIVEL_FORMACION',NIVEL_FORMACION) 
    END
  RETURN ReturnValue


Hide:Access:NIVEL_FORMACION.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(NIVEL_FORMACION,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(NIV:PK_NIVEL_FORMACION,'NIV:PK_NIVEL_FORMACION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:NIVEL_FORMACION.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TIPO_TITULO,RI:None,RI:None,TIP6:FK_TIPO_TITULO_NIVEL_FORMACION)
  SELF.AddRelationLink(NIV:IDNIVELFOMACION,TIP6:IDNIVELFORMACION)


Hide:Relate:NIVEL_FORMACION.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('NIVEL_FORMACION',NIVEL_FORMACION)
  RETURN ReturnValue


Hide:Relate:NIVEL_FORMACION.Kill PROCEDURE

  CODE
  _Hide:Access:NIVEL_FORMACION.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:NIVEL_FORMACION &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:NIVEL_FORMACION)                    ! destroy the file manager


Hide:Relate:NIVEL_FORMACION.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('NIVEL_FORMACION')
       DbChangeTrigger.AddThread('NIVEL_FORMACION')
       DbChangeTrigger.AddItem(NIV:IDNIVELFOMACION, WHO(NIV:RECORD,WHERE(NIV:RECORD,NIV:IDNIVELFOMACION)) , 'NIVEL_FORMACION')
       DbChangeTrigger.AddItem(NIV:DESCRIPCION, WHO(NIV:RECORD,WHERE(NIV:RECORD,NIV:DESCRIPCION)) , 'NIVEL_FORMACION')
       DbChangeTrigger.AddItem(NIV:GRADO, WHO(NIV:RECORD,WHERE(NIV:RECORD,NIV:GRADO)) , 'NIVEL_FORMACION')
    END
    DbChangeTrigger.Update('NIVEL_FORMACION')


Hide:Relate:NIVEL_FORMACION.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('NIVEL_FORMACION')
        DbChangeTrigger.CheckChanges('NIVEL_FORMACION',NIVEL_FORMACION) 
     END
  RETURN ReturnValue


Hide:Relate:TIPO_TITULO.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_TITULO.Init
  SELF.Init(Access:TIPO_TITULO,1)


Hide:Access:TIPO_TITULO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_TITULO')
      DbChangeTrigger.AddThread('TIPO_TITULO')
      DbChangeTrigger.AddItem(TIP6:IDTIPOTITULO, WHO(TIP6:RECORD,WHERE(TIP6:RECORD,TIP6:IDTIPOTITULO)) , 'TIPO_TITULO')
      DbChangeTrigger.AddItem(TIP6:DESCRIPCION, WHO(TIP6:RECORD,WHERE(TIP6:RECORD,TIP6:DESCRIPCION)) , 'TIPO_TITULO')
      DbChangeTrigger.AddItem(TIP6:CORTO, WHO(TIP6:RECORD,WHERE(TIP6:RECORD,TIP6:CORTO)) , 'TIPO_TITULO')
      DbChangeTrigger.AddItem(TIP6:IDNIVELFORMACION, WHO(TIP6:RECORD,WHERE(TIP6:RECORD,TIP6:IDNIVELFORMACION)) , 'TIPO_TITULO')
   END
   DbChangeTrigger.Update('TIPO_TITULO')
  RETURN ReturnValue


Hide:Access:TIPO_TITULO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIP6:Record
  SELF.FileNameValue = 'TIPO_TITULO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_TITULO
  PARENT.Init
  Access:TIPO_TITULO &= SELF


Hide:Access:TIPO_TITULO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('TIPO_TITULO',TIPO_TITULO)
  RETURN ReturnValue


Hide:Access:TIPO_TITULO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_TITULO &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TIPO_TITULO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('TIPO_TITULO')
      DbChangeTrigger.AddThread('TIPO_TITULO')
      DbChangeTrigger.AddItem(TIP6:IDTIPOTITULO, WHO(TIP6:RECORD,WHERE(TIP6:RECORD,TIP6:IDTIPOTITULO)) , 'TIPO_TITULO')
      DbChangeTrigger.AddItem(TIP6:DESCRIPCION, WHO(TIP6:RECORD,WHERE(TIP6:RECORD,TIP6:DESCRIPCION)) , 'TIPO_TITULO')
      DbChangeTrigger.AddItem(TIP6:CORTO, WHO(TIP6:RECORD,WHERE(TIP6:RECORD,TIP6:CORTO)) , 'TIPO_TITULO')
      DbChangeTrigger.AddItem(TIP6:IDNIVELFORMACION, WHO(TIP6:RECORD,WHERE(TIP6:RECORD,TIP6:IDNIVELFORMACION)) , 'TIPO_TITULO')
   END
   DbChangeTrigger.Update('TIPO_TITULO')
  RETURN ReturnValue


Hide:Access:TIPO_TITULO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_TITULO')
      DbChangeTrigger.AddThread('TIPO_TITULO')
      DbChangeTrigger.AddItem(TIP6:IDTIPOTITULO, WHO(TIP6:RECORD,WHERE(TIP6:RECORD,TIP6:IDTIPOTITULO)) , 'TIPO_TITULO')
      DbChangeTrigger.AddItem(TIP6:DESCRIPCION, WHO(TIP6:RECORD,WHERE(TIP6:RECORD,TIP6:DESCRIPCION)) , 'TIPO_TITULO')
      DbChangeTrigger.AddItem(TIP6:CORTO, WHO(TIP6:RECORD,WHERE(TIP6:RECORD,TIP6:CORTO)) , 'TIPO_TITULO')
      DbChangeTrigger.AddItem(TIP6:IDNIVELFORMACION, WHO(TIP6:RECORD,WHERE(TIP6:RECORD,TIP6:IDNIVELFORMACION)) , 'TIPO_TITULO')
   END
   DbChangeTrigger.Update('TIPO_TITULO')
  RETURN ReturnValue


Hide:Access:TIPO_TITULO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('TIPO_TITULO')
       DbChangeTrigger.CheckChanges('TIPO_TITULO',TIPO_TITULO) 
    END
  RETURN ReturnValue


Hide:Access:TIPO_TITULO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TIPO_TITULO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TIP6:PK_TIPO_TITULO,'TIP6:PK_TIPO_TITULO',0)
    SELF.AddKey(TIP6:FK_TIPO_TITULO_NIVEL_FORMACION,'TIP6:FK_TIPO_TITULO_NIVEL_FORMACION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:TIPO_TITULO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:NIVEL_FORMACION4 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 4
    GlobalErrors.SetField('TIP6:IDNIVELFORMACION')
    Save:NIVEL_FORMACION4 = Access:NIVEL_FORMACION.SaveFile()
    NIV:IDNIVELFOMACION = TIP6:IDNIVELFORMACION
    ReturnValue = Access:NIVEL_FORMACION.TryFetch(NIV:PK_NIVEL_FORMACION)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'NIVEL_FORMACION')
      END
    END
    Access:NIVEL_FORMACION.RestoreFile(Save:NIVEL_FORMACION4)
  END
  RETURN ReturnValue


Hide:Relate:TIPO_TITULO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:NIVEL_FORMACION)

  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_TIPO_TITULO)
  SELF.AddRelationLink(TIP6:IDTIPOTITULO,SOC:IDTIPOTITULO)


Hide:Relate:TIPO_TITULO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('TIPO_TITULO',TIPO_TITULO)
  RETURN ReturnValue


Hide:Relate:TIPO_TITULO.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_TITULO.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_TITULO &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_TITULO)                        ! destroy the file manager


Hide:Relate:TIPO_TITULO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('TIPO_TITULO')
       DbChangeTrigger.AddThread('TIPO_TITULO')
       DbChangeTrigger.AddItem(TIP6:IDTIPOTITULO, WHO(TIP6:RECORD,WHERE(TIP6:RECORD,TIP6:IDTIPOTITULO)) , 'TIPO_TITULO')
       DbChangeTrigger.AddItem(TIP6:DESCRIPCION, WHO(TIP6:RECORD,WHERE(TIP6:RECORD,TIP6:DESCRIPCION)) , 'TIPO_TITULO')
       DbChangeTrigger.AddItem(TIP6:CORTO, WHO(TIP6:RECORD,WHERE(TIP6:RECORD,TIP6:CORTO)) , 'TIPO_TITULO')
       DbChangeTrigger.AddItem(TIP6:IDNIVELFORMACION, WHO(TIP6:RECORD,WHERE(TIP6:RECORD,TIP6:IDNIVELFORMACION)) , 'TIPO_TITULO')
    END
    DbChangeTrigger.Update('TIPO_TITULO')


Hide:Relate:TIPO_TITULO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('TIPO_TITULO')
        DbChangeTrigger.CheckChanges('TIPO_TITULO',TIPO_TITULO) 
     END
  RETURN ReturnValue


Hide:Relate:SOCIOSXTRABAJO.Init PROCEDURE()
  CODE
  _Hide:Access:SOCIOSXTRABAJO.Init
  SELF.Init(Access:SOCIOSXTRABAJO,1)


Hide:Access:SOCIOSXTRABAJO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('SOCIOSXTRABAJO')
      DbChangeTrigger.AddThread('SOCIOSXTRABAJO')
      DbChangeTrigger.AddItem(SOC2:IDSOCIOS, WHO(SOC2:RECORD,WHERE(SOC2:RECORD,SOC2:IDSOCIOS)) , 'SOCIOSXTRABAJO')
      DbChangeTrigger.AddItem(SOC2:IDTRABAJO, WHO(SOC2:RECORD,WHERE(SOC2:RECORD,SOC2:IDTRABAJO)) , 'SOCIOSXTRABAJO')
      DbChangeTrigger.AddItem(SOC2:FECHA, WHO(SOC2:RECORD,WHERE(SOC2:RECORD,SOC2:FECHA)) , 'SOCIOSXTRABAJO')
   END
   DbChangeTrigger.Update('SOCIOSXTRABAJO')
  RETURN ReturnValue


Hide:Access:SOCIOSXTRABAJO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SOC2:Record
  SELF.FileNameValue = 'SOCIOSXTRABAJO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SOCIOSXTRABAJO
  PARENT.Init
  Access:SOCIOSXTRABAJO &= SELF


Hide:Access:SOCIOSXTRABAJO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('SOCIOSXTRABAJO',SOCIOSXTRABAJO)
  RETURN ReturnValue


Hide:Access:SOCIOSXTRABAJO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SOCIOSXTRABAJO &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SOCIOSXTRABAJO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('SOCIOSXTRABAJO')
      DbChangeTrigger.AddThread('SOCIOSXTRABAJO')
      DbChangeTrigger.AddItem(SOC2:IDSOCIOS, WHO(SOC2:RECORD,WHERE(SOC2:RECORD,SOC2:IDSOCIOS)) , 'SOCIOSXTRABAJO')
      DbChangeTrigger.AddItem(SOC2:IDTRABAJO, WHO(SOC2:RECORD,WHERE(SOC2:RECORD,SOC2:IDTRABAJO)) , 'SOCIOSXTRABAJO')
      DbChangeTrigger.AddItem(SOC2:FECHA, WHO(SOC2:RECORD,WHERE(SOC2:RECORD,SOC2:FECHA)) , 'SOCIOSXTRABAJO')
   END
   DbChangeTrigger.Update('SOCIOSXTRABAJO')
  RETURN ReturnValue


Hide:Access:SOCIOSXTRABAJO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('SOCIOSXTRABAJO')
      DbChangeTrigger.AddThread('SOCIOSXTRABAJO')
      DbChangeTrigger.AddItem(SOC2:IDSOCIOS, WHO(SOC2:RECORD,WHERE(SOC2:RECORD,SOC2:IDSOCIOS)) , 'SOCIOSXTRABAJO')
      DbChangeTrigger.AddItem(SOC2:IDTRABAJO, WHO(SOC2:RECORD,WHERE(SOC2:RECORD,SOC2:IDTRABAJO)) , 'SOCIOSXTRABAJO')
      DbChangeTrigger.AddItem(SOC2:FECHA, WHO(SOC2:RECORD,WHERE(SOC2:RECORD,SOC2:FECHA)) , 'SOCIOSXTRABAJO')
   END
   DbChangeTrigger.Update('SOCIOSXTRABAJO')
  RETURN ReturnValue


Hide:Access:SOCIOSXTRABAJO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('SOCIOSXTRABAJO')
       DbChangeTrigger.CheckChanges('SOCIOSXTRABAJO',SOCIOSXTRABAJO) 
    END
  RETURN ReturnValue


Hide:Access:SOCIOSXTRABAJO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SOCIOSXTRABAJO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SOC2:PK_SOCIOSXTRABAJO,'SOC2:PK_SOCIOSXTRABAJO',0)
    SELF.AddKey(SOC2:FK_SOCIOSXTRABAJO_TRABAJO,'SOC2:FK_SOCIOSXTRABAJO_TRABAJO',0)
    SELF.AddKey(SOC2:FK_SOCIOSXTRABAJO_SOCIOS,'SOC2:FK_SOCIOSXTRABAJO_SOCIOS',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:SOCIOSXTRABAJO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SOCIOS1       USHORT,AUTO
Save:TRABAJO2      USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('SOC2:IDSOCIOS')
    Save:SOCIOS1 = Access:SOCIOS.SaveFile()
    SOC:IDSOCIO = SOC2:IDSOCIOS
    ReturnValue = Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SOCIOS')
      END
    END
    Access:SOCIOS.RestoreFile(Save:SOCIOS1)
  OF 2
    GlobalErrors.SetField('SOC2:IDTRABAJO')
    Save:TRABAJO2 = Access:TRABAJO.SaveFile()
    TRA:IDTRABAJO = SOC2:IDTRABAJO
    ReturnValue = Access:TRABAJO.TryFetch(TRA:PK_TRABAJO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TRABAJO')
      END
    END
    Access:TRABAJO.RestoreFile(Save:TRABAJO2)
  END
  RETURN ReturnValue


Hide:Relate:SOCIOSXTRABAJO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:TRABAJO)


Hide:Relate:SOCIOSXTRABAJO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('SOCIOSXTRABAJO',SOCIOSXTRABAJO)
  RETURN ReturnValue


Hide:Relate:SOCIOSXTRABAJO.Kill PROCEDURE

  CODE
  _Hide:Access:SOCIOSXTRABAJO.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:SOCIOSXTRABAJO &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SOCIOSXTRABAJO)                     ! destroy the file manager


Hide:Relate:SOCIOSXTRABAJO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('SOCIOSXTRABAJO')
       DbChangeTrigger.AddThread('SOCIOSXTRABAJO')
       DbChangeTrigger.AddItem(SOC2:IDSOCIOS, WHO(SOC2:RECORD,WHERE(SOC2:RECORD,SOC2:IDSOCIOS)) , 'SOCIOSXTRABAJO')
       DbChangeTrigger.AddItem(SOC2:IDTRABAJO, WHO(SOC2:RECORD,WHERE(SOC2:RECORD,SOC2:IDTRABAJO)) , 'SOCIOSXTRABAJO')
       DbChangeTrigger.AddItem(SOC2:FECHA, WHO(SOC2:RECORD,WHERE(SOC2:RECORD,SOC2:FECHA)) , 'SOCIOSXTRABAJO')
    END
    DbChangeTrigger.Update('SOCIOSXTRABAJO')


Hide:Relate:SOCIOSXTRABAJO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('SOCIOSXTRABAJO')
        DbChangeTrigger.CheckChanges('SOCIOSXTRABAJO',SOCIOSXTRABAJO) 
     END
  RETURN ReturnValue


Hide:Relate:TRABAJO.Init PROCEDURE()
  CODE
  _Hide:Access:TRABAJO.Init
  SELF.Init(Access:TRABAJO,1)


Hide:Access:TRABAJO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('TRABAJO')
      DbChangeTrigger.AddThread('TRABAJO')
      DbChangeTrigger.AddItem(TRA:IDTRABAJO, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:IDTRABAJO)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:DESCRIPCION, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:DESCRIPCION)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:DIRECCION, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:DIRECCION)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:IDLOCALIDAD, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:IDLOCALIDAD)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:TELEFONO, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:TELEFONO)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:EMAIL, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:EMAIL)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:OBSERVACION, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:OBSERVACION)) , 'TRABAJO')
   END
   DbChangeTrigger.Update('TRABAJO')
  RETURN ReturnValue


Hide:Access:TRABAJO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TRA:Record
  SELF.FileNameValue = 'TRABAJO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TRABAJO
  PARENT.Init
  Access:TRABAJO &= SELF


Hide:Access:TRABAJO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('TRABAJO',TRABAJO)
  RETURN ReturnValue


Hide:Access:TRABAJO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TRABAJO &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TRABAJO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('TRABAJO')
      DbChangeTrigger.AddThread('TRABAJO')
      DbChangeTrigger.AddItem(TRA:IDTRABAJO, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:IDTRABAJO)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:DESCRIPCION, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:DESCRIPCION)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:DIRECCION, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:DIRECCION)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:IDLOCALIDAD, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:IDLOCALIDAD)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:TELEFONO, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:TELEFONO)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:EMAIL, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:EMAIL)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:OBSERVACION, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:OBSERVACION)) , 'TRABAJO')
   END
   DbChangeTrigger.Update('TRABAJO')
  RETURN ReturnValue


Hide:Access:TRABAJO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('TRABAJO')
      DbChangeTrigger.AddThread('TRABAJO')
      DbChangeTrigger.AddItem(TRA:IDTRABAJO, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:IDTRABAJO)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:DESCRIPCION, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:DESCRIPCION)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:DIRECCION, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:DIRECCION)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:IDLOCALIDAD, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:IDLOCALIDAD)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:TELEFONO, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:TELEFONO)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:EMAIL, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:EMAIL)) , 'TRABAJO')
      DbChangeTrigger.AddItem(TRA:OBSERVACION, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:OBSERVACION)) , 'TRABAJO')
   END
   DbChangeTrigger.Update('TRABAJO')
  RETURN ReturnValue


Hide:Access:TRABAJO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('TRABAJO')
       DbChangeTrigger.CheckChanges('TRABAJO',TRABAJO) 
    END
  RETURN ReturnValue


Hide:Access:TRABAJO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TRABAJO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TRA:PK_TRABAJO,'TRA:PK_TRABAJO',0)
    SELF.AddKey(TRA:IDX_TRABAJO_DESCRIPCION,'TRA:IDX_TRABAJO_DESCRIPCION',0)
    SELF.AddKey(TRA:FK_TRABAJO_LOCALIDAD,'TRA:FK_TRABAJO_LOCALIDAD',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:TRABAJO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:LOCALIDAD4    USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 4
    GlobalErrors.SetField('TRA:IDLOCALIDAD')
    Save:LOCALIDAD4 = Access:LOCALIDAD.SaveFile()
    LOC:IDLOCALIDAD = TRA:IDLOCALIDAD
    ReturnValue = Access:LOCALIDAD.TryFetch(LOC:PK_LOCALIDAD)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'LOCALIDAD')
      END
    END
    Access:LOCALIDAD.RestoreFile(Save:LOCALIDAD4)
  END
  RETURN ReturnValue


Hide:Relate:TRABAJO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:LOCALIDAD)

  SELF.AddRelation(Relate:SOCIOSXTRABAJO,RI:None,RI:None,SOC2:FK_SOCIOSXTRABAJO_TRABAJO)
  SELF.AddRelationLink(TRA:IDTRABAJO,SOC2:IDTRABAJO)


Hide:Relate:TRABAJO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('TRABAJO',TRABAJO)
  RETURN ReturnValue


Hide:Relate:TRABAJO.Kill PROCEDURE

  CODE
  _Hide:Access:TRABAJO.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:TRABAJO &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TRABAJO)                            ! destroy the file manager


Hide:Relate:TRABAJO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('TRABAJO')
       DbChangeTrigger.AddThread('TRABAJO')
       DbChangeTrigger.AddItem(TRA:IDTRABAJO, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:IDTRABAJO)) , 'TRABAJO')
       DbChangeTrigger.AddItem(TRA:DESCRIPCION, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:DESCRIPCION)) , 'TRABAJO')
       DbChangeTrigger.AddItem(TRA:DIRECCION, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:DIRECCION)) , 'TRABAJO')
       DbChangeTrigger.AddItem(TRA:IDLOCALIDAD, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:IDLOCALIDAD)) , 'TRABAJO')
       DbChangeTrigger.AddItem(TRA:TELEFONO, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:TELEFONO)) , 'TRABAJO')
       DbChangeTrigger.AddItem(TRA:EMAIL, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:EMAIL)) , 'TRABAJO')
       DbChangeTrigger.AddItem(TRA:OBSERVACION, WHO(TRA:RECORD,WHERE(TRA:RECORD,TRA:OBSERVACION)) , 'TRABAJO')
    END
    DbChangeTrigger.Update('TRABAJO')


Hide:Relate:TRABAJO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('TRABAJO')
        DbChangeTrigger.CheckChanges('TRABAJO',TRABAJO) 
     END
  RETURN ReturnValue


Hide:Relate:PROVEEDORES.Init PROCEDURE()
  CODE
  _Hide:Access:PROVEEDORES.Init
  SELF.Init(Access:PROVEEDORES,1)


Hide:Access:PROVEEDORES.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('PROVEEDORES')
      DbChangeTrigger.AddThread('PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:IDPROVEEDOR, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:IDPROVEEDOR)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:DESCRIPCION, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:DESCRIPCION)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:DIRECCION, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:DIRECCION)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:TELEFONO, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:TELEFONO)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:EMAIL, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:EMAIL)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:CUIT, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:CUIT)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:FECHA, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:FECHA)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:HORA, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:HORA)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:IDUSUARIO, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:IDUSUARIO)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:IDTIPOIVA, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:IDTIPOIVA)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:FECHA_BAJA, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:FECHA_BAJA)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:OBSERVACION, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:OBSERVACION)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:IDTIPO_PROVEEDOR, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:IDTIPO_PROVEEDOR)) , 'PROVEEDORES')
   END
   DbChangeTrigger.Update('PROVEEDORES')
  RETURN ReturnValue


Hide:Access:PROVEEDORES.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PRO2:Record
  SELF.FileNameValue = 'PROVEEDORES'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PROVEEDORES
  PARENT.Init
  Access:PROVEEDORES &= SELF


Hide:Access:PROVEEDORES.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('PROVEEDORES',PROVEEDORES)
  RETURN ReturnValue


Hide:Access:PROVEEDORES.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PROVEEDORES &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PROVEEDORES.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('PROVEEDORES')
      DbChangeTrigger.AddThread('PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:IDPROVEEDOR, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:IDPROVEEDOR)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:DESCRIPCION, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:DESCRIPCION)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:DIRECCION, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:DIRECCION)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:TELEFONO, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:TELEFONO)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:EMAIL, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:EMAIL)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:CUIT, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:CUIT)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:FECHA, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:FECHA)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:HORA, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:HORA)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:IDUSUARIO, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:IDUSUARIO)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:IDTIPOIVA, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:IDTIPOIVA)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:FECHA_BAJA, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:FECHA_BAJA)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:OBSERVACION, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:OBSERVACION)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:IDTIPO_PROVEEDOR, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:IDTIPO_PROVEEDOR)) , 'PROVEEDORES')
   END
   DbChangeTrigger.Update('PROVEEDORES')
  RETURN ReturnValue


Hide:Access:PROVEEDORES.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('PROVEEDORES')
      DbChangeTrigger.AddThread('PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:IDPROVEEDOR, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:IDPROVEEDOR)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:DESCRIPCION, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:DESCRIPCION)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:DIRECCION, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:DIRECCION)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:TELEFONO, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:TELEFONO)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:EMAIL, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:EMAIL)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:CUIT, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:CUIT)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:FECHA, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:FECHA)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:HORA, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:HORA)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:IDUSUARIO, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:IDUSUARIO)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:IDTIPOIVA, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:IDTIPOIVA)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:FECHA_BAJA, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:FECHA_BAJA)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:OBSERVACION, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:OBSERVACION)) , 'PROVEEDORES')
      DbChangeTrigger.AddItem(PRO2:IDTIPO_PROVEEDOR, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:IDTIPO_PROVEEDOR)) , 'PROVEEDORES')
   END
   DbChangeTrigger.Update('PROVEEDORES')
  RETURN ReturnValue


Hide:Access:PROVEEDORES.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('PROVEEDORES')
       DbChangeTrigger.CheckChanges('PROVEEDORES',PROVEEDORES) 
    END
  RETURN ReturnValue


Hide:Access:PROVEEDORES.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PROVEEDORES,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PRO2:PK_PROVEEDOR,'PRO2:PK_PROVEEDOR',0)
    SELF.AddKey(PRO2:FK_PROVEEDORES_TIPOIVA,'PRO2:FK_PROVEEDORES_TIPOIVA',0)
    SELF.AddKey(PRO2:FK_PROVEEDORES_TIPO_PROVEEDOR,'PRO2:FK_PROVEEDORES_TIPO_PROVEEDOR',0)
    SELF.AddKey(PRO2:FK_PROVEEDORES_USUARIO,'PRO2:FK_PROVEEDORES_USUARIO',0)
    SELF.AddKey(PRO2:IDX_PROVEEDORES_CUIT,'PRO2:IDX_PROVEEDORES_CUIT',0)
    SELF.AddKey(PRO2:IDX_PROVEEDORES_DESCRIPCION,'PRO2:IDX_PROVEEDORES_DESCRIPCION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:PROVEEDORES.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:TIPO_IVA10    USHORT,AUTO
Save:TIPO_PROVEEDOR13 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 10
    GlobalErrors.SetField('PRO2:IDTIPOIVA')
    Save:TIPO_IVA10 = Access:TIPO_IVA.SaveFile()
    TIP7:IDTIPOIVA = PRO2:IDTIPOIVA
    ReturnValue = Access:TIPO_IVA.TryFetch(TIP7:PK_TIPO_IVA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_IVA')
      END
    END
    Access:TIPO_IVA.RestoreFile(Save:TIPO_IVA10)
  OF 13
    GlobalErrors.SetField('PRO2:IDTIPO_PROVEEDOR')
    Save:TIPO_PROVEEDOR13 = Access:TIPO_PROVEEDOR.SaveFile()
    TIPP:IDTIPO_PROVEEDOR = PRO2:IDTIPO_PROVEEDOR
    ReturnValue = Access:TIPO_PROVEEDOR.TryFetch(TIPP:PK_TIPO_PROVEEDOR)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_PROVEEDOR')
      END
    END
    Access:TIPO_PROVEEDOR.RestoreFile(Save:TIPO_PROVEEDOR13)
  END
  RETURN ReturnValue


Hide:Relate:PROVEEDORES.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:USUARIO)

  SELF.AddRelation(Relate:CURSO_INSCRIPCION,RI:None,RI:None,CURI:FK_CURSO_INSCRIPCION_PROVEEDOR)
  SELF.AddRelationLink(PRO2:IDPROVEEDOR,CURI:ID_PROVEEDOR)

  SELF.AddRelation(Relate:GASTOS,RI:None,RI:None,GAS:FK_GASTOS1)
  SELF.AddRelationLink(PRO2:IDPROVEEDOR,GAS:IDPROVEEDOR)

  SELF.AddRelation(Relate:INGRESOS,RI:None,RI:None,ING:FK_INGRESOS_PROVEEDOR)
  SELF.AddRelationLink(PRO2:IDPROVEEDOR,ING:IDPROVEEDOR)

  SELF.AddRelation(Relate:TIPO_IVA)

  SELF.AddRelation(Relate:TIPO_PROVEEDOR)

  SELF.AddRelation(Relate:SOCIOS)


Hide:Relate:PROVEEDORES.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('PROVEEDORES',PROVEEDORES)
  RETURN ReturnValue


Hide:Relate:PROVEEDORES.Kill PROCEDURE

  CODE
  _Hide:Access:PROVEEDORES.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:PROVEEDORES &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PROVEEDORES)                        ! destroy the file manager


Hide:Relate:PROVEEDORES.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('PROVEEDORES')
       DbChangeTrigger.AddThread('PROVEEDORES')
       DbChangeTrigger.AddItem(PRO2:IDPROVEEDOR, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:IDPROVEEDOR)) , 'PROVEEDORES')
       DbChangeTrigger.AddItem(PRO2:DESCRIPCION, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:DESCRIPCION)) , 'PROVEEDORES')
       DbChangeTrigger.AddItem(PRO2:DIRECCION, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:DIRECCION)) , 'PROVEEDORES')
       DbChangeTrigger.AddItem(PRO2:TELEFONO, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:TELEFONO)) , 'PROVEEDORES')
       DbChangeTrigger.AddItem(PRO2:EMAIL, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:EMAIL)) , 'PROVEEDORES')
       DbChangeTrigger.AddItem(PRO2:CUIT, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:CUIT)) , 'PROVEEDORES')
       DbChangeTrigger.AddItem(PRO2:FECHA, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:FECHA)) , 'PROVEEDORES')
       DbChangeTrigger.AddItem(PRO2:HORA, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:HORA)) , 'PROVEEDORES')
       DbChangeTrigger.AddItem(PRO2:IDUSUARIO, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:IDUSUARIO)) , 'PROVEEDORES')
       DbChangeTrigger.AddItem(PRO2:IDTIPOIVA, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:IDTIPOIVA)) , 'PROVEEDORES')
       DbChangeTrigger.AddItem(PRO2:FECHA_BAJA, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:FECHA_BAJA)) , 'PROVEEDORES')
       DbChangeTrigger.AddItem(PRO2:OBSERVACION, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:OBSERVACION)) , 'PROVEEDORES')
       DbChangeTrigger.AddItem(PRO2:IDTIPO_PROVEEDOR, WHO(PRO2:RECORD,WHERE(PRO2:RECORD,PRO2:IDTIPO_PROVEEDOR)) , 'PROVEEDORES')
    END
    DbChangeTrigger.Update('PROVEEDORES')


Hide:Relate:PROVEEDORES.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('PROVEEDORES')
        DbChangeTrigger.CheckChanges('PROVEEDORES',PROVEEDORES) 
     END
  RETURN ReturnValue


Hide:Relate:TIPO_IVA.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_IVA.Init
  SELF.Init(Access:TIPO_IVA,1)


Hide:Access:TIPO_IVA.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_IVA')
      DbChangeTrigger.AddThread('TIPO_IVA')
      DbChangeTrigger.AddItem(TIP7:IDTIPOIVA, WHO(TIP7:RECORD,WHERE(TIP7:RECORD,TIP7:IDTIPOIVA)) , 'TIPO_IVA')
      DbChangeTrigger.AddItem(TIP7:DECRIPCION, WHO(TIP7:RECORD,WHERE(TIP7:RECORD,TIP7:DECRIPCION)) , 'TIPO_IVA')
      DbChangeTrigger.AddItem(TIP7:RETENCION, WHO(TIP7:RECORD,WHERE(TIP7:RECORD,TIP7:RETENCION)) , 'TIPO_IVA')
   END
   DbChangeTrigger.Update('TIPO_IVA')
  RETURN ReturnValue


Hide:Access:TIPO_IVA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIP7:Record
  SELF.FileNameValue = 'TIPO_IVA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_IVA
  PARENT.Init
  Access:TIPO_IVA &= SELF


Hide:Access:TIPO_IVA.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('TIPO_IVA',TIPO_IVA)
  RETURN ReturnValue


Hide:Access:TIPO_IVA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_IVA &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TIPO_IVA.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('TIPO_IVA')
      DbChangeTrigger.AddThread('TIPO_IVA')
      DbChangeTrigger.AddItem(TIP7:IDTIPOIVA, WHO(TIP7:RECORD,WHERE(TIP7:RECORD,TIP7:IDTIPOIVA)) , 'TIPO_IVA')
      DbChangeTrigger.AddItem(TIP7:DECRIPCION, WHO(TIP7:RECORD,WHERE(TIP7:RECORD,TIP7:DECRIPCION)) , 'TIPO_IVA')
      DbChangeTrigger.AddItem(TIP7:RETENCION, WHO(TIP7:RECORD,WHERE(TIP7:RECORD,TIP7:RETENCION)) , 'TIPO_IVA')
   END
   DbChangeTrigger.Update('TIPO_IVA')
  RETURN ReturnValue


Hide:Access:TIPO_IVA.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_IVA')
      DbChangeTrigger.AddThread('TIPO_IVA')
      DbChangeTrigger.AddItem(TIP7:IDTIPOIVA, WHO(TIP7:RECORD,WHERE(TIP7:RECORD,TIP7:IDTIPOIVA)) , 'TIPO_IVA')
      DbChangeTrigger.AddItem(TIP7:DECRIPCION, WHO(TIP7:RECORD,WHERE(TIP7:RECORD,TIP7:DECRIPCION)) , 'TIPO_IVA')
      DbChangeTrigger.AddItem(TIP7:RETENCION, WHO(TIP7:RECORD,WHERE(TIP7:RECORD,TIP7:RETENCION)) , 'TIPO_IVA')
   END
   DbChangeTrigger.Update('TIPO_IVA')
  RETURN ReturnValue


Hide:Access:TIPO_IVA.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('TIPO_IVA')
       DbChangeTrigger.CheckChanges('TIPO_IVA',TIPO_IVA) 
    END
  RETURN ReturnValue


Hide:Access:TIPO_IVA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TIPO_IVA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TIP7:PK_TIPO_IVA,'TIP7:PK_TIPO_IVA',0)
    SELF.AddKey(TIP7:IDX_TIPOIVA_DESCRIPCION,'TIP7:IDX_TIPOIVA_DESCRIPCION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TIPO_IVA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_TIPO_IVA)
  SELF.AddRelationLink(TIP7:IDTIPOIVA,SOC:TIPOIVA)

  SELF.AddRelation(Relate:PROVEEDORES,RI:None,RI:None,PRO2:FK_PROVEEDORES_TIPOIVA)
  SELF.AddRelationLink(TIP7:IDTIPOIVA,PRO2:IDTIPOIVA)


Hide:Relate:TIPO_IVA.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('TIPO_IVA',TIPO_IVA)
  RETURN ReturnValue


Hide:Relate:TIPO_IVA.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_IVA.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_IVA &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_IVA)                           ! destroy the file manager


Hide:Relate:TIPO_IVA.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('TIPO_IVA')
       DbChangeTrigger.AddThread('TIPO_IVA')
       DbChangeTrigger.AddItem(TIP7:IDTIPOIVA, WHO(TIP7:RECORD,WHERE(TIP7:RECORD,TIP7:IDTIPOIVA)) , 'TIPO_IVA')
       DbChangeTrigger.AddItem(TIP7:DECRIPCION, WHO(TIP7:RECORD,WHERE(TIP7:RECORD,TIP7:DECRIPCION)) , 'TIPO_IVA')
       DbChangeTrigger.AddItem(TIP7:RETENCION, WHO(TIP7:RECORD,WHERE(TIP7:RECORD,TIP7:RETENCION)) , 'TIPO_IVA')
    END
    DbChangeTrigger.Update('TIPO_IVA')


Hide:Relate:TIPO_IVA.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('TIPO_IVA')
        DbChangeTrigger.CheckChanges('TIPO_IVA',TIPO_IVA) 
     END
  RETURN ReturnValue


Hide:Relate:TIPO_PROVEEDOR.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_PROVEEDOR.Init
  SELF.Init(Access:TIPO_PROVEEDOR,1)


Hide:Access:TIPO_PROVEEDOR.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_PROVEEDOR')
      DbChangeTrigger.AddThread('TIPO_PROVEEDOR')
      DbChangeTrigger.AddItem(TIPP:IDTIPO_PROVEEDOR, WHO(TIPP:RECORD,WHERE(TIPP:RECORD,TIPP:IDTIPO_PROVEEDOR)) , 'TIPO_PROVEEDOR')
      DbChangeTrigger.AddItem(TIPP:DESCRIPCION, WHO(TIPP:RECORD,WHERE(TIPP:RECORD,TIPP:DESCRIPCION)) , 'TIPO_PROVEEDOR')
   END
   DbChangeTrigger.Update('TIPO_PROVEEDOR')
  RETURN ReturnValue


Hide:Access:TIPO_PROVEEDOR.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIPP:Record
  SELF.FileNameValue = 'TIPO_PROVEEDOR'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_PROVEEDOR
  PARENT.Init
  Access:TIPO_PROVEEDOR &= SELF


Hide:Access:TIPO_PROVEEDOR.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('TIPO_PROVEEDOR',TIPO_PROVEEDOR)
  RETURN ReturnValue


Hide:Access:TIPO_PROVEEDOR.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_PROVEEDOR &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TIPO_PROVEEDOR.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('TIPO_PROVEEDOR')
      DbChangeTrigger.AddThread('TIPO_PROVEEDOR')
      DbChangeTrigger.AddItem(TIPP:IDTIPO_PROVEEDOR, WHO(TIPP:RECORD,WHERE(TIPP:RECORD,TIPP:IDTIPO_PROVEEDOR)) , 'TIPO_PROVEEDOR')
      DbChangeTrigger.AddItem(TIPP:DESCRIPCION, WHO(TIPP:RECORD,WHERE(TIPP:RECORD,TIPP:DESCRIPCION)) , 'TIPO_PROVEEDOR')
   END
   DbChangeTrigger.Update('TIPO_PROVEEDOR')
  RETURN ReturnValue


Hide:Access:TIPO_PROVEEDOR.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('TIPO_PROVEEDOR')
      DbChangeTrigger.AddThread('TIPO_PROVEEDOR')
      DbChangeTrigger.AddItem(TIPP:IDTIPO_PROVEEDOR, WHO(TIPP:RECORD,WHERE(TIPP:RECORD,TIPP:IDTIPO_PROVEEDOR)) , 'TIPO_PROVEEDOR')
      DbChangeTrigger.AddItem(TIPP:DESCRIPCION, WHO(TIPP:RECORD,WHERE(TIPP:RECORD,TIPP:DESCRIPCION)) , 'TIPO_PROVEEDOR')
   END
   DbChangeTrigger.Update('TIPO_PROVEEDOR')
  RETURN ReturnValue


Hide:Access:TIPO_PROVEEDOR.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('TIPO_PROVEEDOR')
       DbChangeTrigger.CheckChanges('TIPO_PROVEEDOR',TIPO_PROVEEDOR) 
    END
  RETURN ReturnValue


Hide:Access:TIPO_PROVEEDOR.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TIPO_PROVEEDOR,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TIPP:PK_TIPO_PROVEEDOR,'TIPP:PK_TIPO_PROVEEDOR',0)
    SELF.AddKey(TIPP:IDX_TIPO_PROVEEDOR_DESCRIPCION,'TIPP:IDX_TIPO_PROVEEDOR_DESCRIPCION',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TIPO_PROVEEDOR.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:PROVEEDORES,RI:None,RI:None,PRO2:FK_PROVEEDORES_TIPO_PROVEEDOR)
  SELF.AddRelationLink(TIPP:IDTIPO_PROVEEDOR,PRO2:IDTIPO_PROVEEDOR)


Hide:Relate:TIPO_PROVEEDOR.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('TIPO_PROVEEDOR',TIPO_PROVEEDOR)
  RETURN ReturnValue


Hide:Relate:TIPO_PROVEEDOR.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_PROVEEDOR.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_PROVEEDOR &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_PROVEEDOR)                     ! destroy the file manager


Hide:Relate:TIPO_PROVEEDOR.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('TIPO_PROVEEDOR')
       DbChangeTrigger.AddThread('TIPO_PROVEEDOR')
       DbChangeTrigger.AddItem(TIPP:IDTIPO_PROVEEDOR, WHO(TIPP:RECORD,WHERE(TIPP:RECORD,TIPP:IDTIPO_PROVEEDOR)) , 'TIPO_PROVEEDOR')
       DbChangeTrigger.AddItem(TIPP:DESCRIPCION, WHO(TIPP:RECORD,WHERE(TIPP:RECORD,TIPP:DESCRIPCION)) , 'TIPO_PROVEEDOR')
    END
    DbChangeTrigger.Update('TIPO_PROVEEDOR')


Hide:Relate:TIPO_PROVEEDOR.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('TIPO_PROVEEDOR')
        DbChangeTrigger.CheckChanges('TIPO_PROVEEDOR',TIPO_PROVEEDOR) 
     END
  RETURN ReturnValue


Hide:Relate:BANCO.Init PROCEDURE()
  CODE
  _Hide:Access:BANCO.Init
  SELF.Init(Access:BANCO,1)


Hide:Access:BANCO.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('BANCO')
      DbChangeTrigger.AddThread('BANCO')
      DbChangeTrigger.AddItem(BAN2:IDBANCO, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:IDBANCO)) , 'BANCO')
      DbChangeTrigger.AddItem(BAN2:DESCRIPCION, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:DESCRIPCION)) , 'BANCO')
      DbChangeTrigger.AddItem(BAN2:CODIGO_BANCO, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:CODIGO_BANCO)) , 'BANCO')
      DbChangeTrigger.AddItem(BAN2:ID_REGISTRO, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:ID_REGISTRO)) , 'BANCO')
      DbChangeTrigger.AddItem(BAN2:CBU_BLOQUE_1, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:CBU_BLOQUE_1)) , 'BANCO')
      DbChangeTrigger.AddItem(BAN2:SUBEMPRESA, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:SUBEMPRESA)) , 'BANCO')
   END
   DbChangeTrigger.Update('BANCO')
  RETURN ReturnValue


Hide:Access:BANCO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= BAN2:Record
  SELF.FileNameValue = 'BANCO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= BANCO
  PARENT.Init
  Access:BANCO &= SELF


Hide:Access:BANCO.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('BANCO',BANCO)
  RETURN ReturnValue


Hide:Access:BANCO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:BANCO &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:BANCO.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('BANCO')
      DbChangeTrigger.AddThread('BANCO')
      DbChangeTrigger.AddItem(BAN2:IDBANCO, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:IDBANCO)) , 'BANCO')
      DbChangeTrigger.AddItem(BAN2:DESCRIPCION, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:DESCRIPCION)) , 'BANCO')
      DbChangeTrigger.AddItem(BAN2:CODIGO_BANCO, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:CODIGO_BANCO)) , 'BANCO')
      DbChangeTrigger.AddItem(BAN2:ID_REGISTRO, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:ID_REGISTRO)) , 'BANCO')
      DbChangeTrigger.AddItem(BAN2:CBU_BLOQUE_1, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:CBU_BLOQUE_1)) , 'BANCO')
      DbChangeTrigger.AddItem(BAN2:SUBEMPRESA, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:SUBEMPRESA)) , 'BANCO')
   END
   DbChangeTrigger.Update('BANCO')
  RETURN ReturnValue


Hide:Access:BANCO.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('BANCO')
      DbChangeTrigger.AddThread('BANCO')
      DbChangeTrigger.AddItem(BAN2:IDBANCO, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:IDBANCO)) , 'BANCO')
      DbChangeTrigger.AddItem(BAN2:DESCRIPCION, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:DESCRIPCION)) , 'BANCO')
      DbChangeTrigger.AddItem(BAN2:CODIGO_BANCO, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:CODIGO_BANCO)) , 'BANCO')
      DbChangeTrigger.AddItem(BAN2:ID_REGISTRO, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:ID_REGISTRO)) , 'BANCO')
      DbChangeTrigger.AddItem(BAN2:CBU_BLOQUE_1, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:CBU_BLOQUE_1)) , 'BANCO')
      DbChangeTrigger.AddItem(BAN2:SUBEMPRESA, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:SUBEMPRESA)) , 'BANCO')
   END
   DbChangeTrigger.Update('BANCO')
  RETURN ReturnValue


Hide:Access:BANCO.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('BANCO')
       DbChangeTrigger.CheckChanges('BANCO',BANCO) 
    END
  RETURN ReturnValue


Hide:Access:BANCO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(BANCO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(BAN2:PK_BANCO,'BAN2:PK_BANCO',0)
    SELF.AddKey(BAN2:FK_BANCO_COD_RESGISTRO,'BAN2:FK_BANCO_COD_RESGISTRO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:BANCO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:BANCO_COD_REG4 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 4
    GlobalErrors.SetField('BAN2:ID_REGISTRO')
    Save:BANCO_COD_REG4 = Access:BANCO_COD_REG.SaveFile()
    BAN3:ID_REGISTRO = BAN2:ID_REGISTRO
    ReturnValue = Access:BANCO_COD_REG.TryFetch(BAN3:PK_BANCO_COD_REG)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'BANCO_COD_REG')
      END
    END
    Access:BANCO_COD_REG.RestoreFile(Save:BANCO_COD_REG4)
  END
  RETURN ReturnValue


Hide:Relate:BANCO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_BANCO)
  SELF.AddRelationLink(BAN2:IDBANCO,SOC:IDBANCO)

  SELF.AddRelation(Relate:BANCO_COD_REG)


Hide:Relate:BANCO.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('BANCO',BANCO)
  RETURN ReturnValue


Hide:Relate:BANCO.Kill PROCEDURE

  CODE
  _Hide:Access:BANCO.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:BANCO &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:BANCO)                              ! destroy the file manager


Hide:Relate:BANCO.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('BANCO')
       DbChangeTrigger.AddThread('BANCO')
       DbChangeTrigger.AddItem(BAN2:IDBANCO, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:IDBANCO)) , 'BANCO')
       DbChangeTrigger.AddItem(BAN2:DESCRIPCION, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:DESCRIPCION)) , 'BANCO')
       DbChangeTrigger.AddItem(BAN2:CODIGO_BANCO, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:CODIGO_BANCO)) , 'BANCO')
       DbChangeTrigger.AddItem(BAN2:ID_REGISTRO, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:ID_REGISTRO)) , 'BANCO')
       DbChangeTrigger.AddItem(BAN2:CBU_BLOQUE_1, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:CBU_BLOQUE_1)) , 'BANCO')
       DbChangeTrigger.AddItem(BAN2:SUBEMPRESA, WHO(BAN2:RECORD,WHERE(BAN2:RECORD,BAN2:SUBEMPRESA)) , 'BANCO')
    END
    DbChangeTrigger.Update('BANCO')


Hide:Relate:BANCO.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('BANCO')
        DbChangeTrigger.CheckChanges('BANCO',BANCO) 
     END
  RETURN ReturnValue


Hide:Relate:BANCO_COD_REG.Init PROCEDURE()
  CODE
  _Hide:Access:BANCO_COD_REG.Init
  SELF.Init(Access:BANCO_COD_REG,1)


Hide:Access:BANCO_COD_REG.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('BANCO_COD_REG')
      DbChangeTrigger.AddThread('BANCO_COD_REG')
      DbChangeTrigger.AddItem(BAN3:ID_REGISTRO, WHO(BAN3:RECORD,WHERE(BAN3:RECORD,BAN3:ID_REGISTRO)) , 'BANCO_COD_REG')
      DbChangeTrigger.AddItem(BAN3:DESCRIPCION, WHO(BAN3:RECORD,WHERE(BAN3:RECORD,BAN3:DESCRIPCION)) , 'BANCO_COD_REG')
      DbChangeTrigger.AddItem(BAN3:COD_REGISTRO, WHO(BAN3:RECORD,WHERE(BAN3:RECORD,BAN3:COD_REGISTRO)) , 'BANCO_COD_REG')
   END
   DbChangeTrigger.Update('BANCO_COD_REG')
  RETURN ReturnValue


Hide:Access:BANCO_COD_REG.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= BAN3:Record
  SELF.FileNameValue = 'BANCO_COD_REG'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= BANCO_COD_REG
  PARENT.Init
  Access:BANCO_COD_REG &= SELF


Hide:Access:BANCO_COD_REG.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('BANCO_COD_REG',BANCO_COD_REG)
  RETURN ReturnValue


Hide:Access:BANCO_COD_REG.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:BANCO_COD_REG &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:BANCO_COD_REG.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('BANCO_COD_REG')
      DbChangeTrigger.AddThread('BANCO_COD_REG')
      DbChangeTrigger.AddItem(BAN3:ID_REGISTRO, WHO(BAN3:RECORD,WHERE(BAN3:RECORD,BAN3:ID_REGISTRO)) , 'BANCO_COD_REG')
      DbChangeTrigger.AddItem(BAN3:DESCRIPCION, WHO(BAN3:RECORD,WHERE(BAN3:RECORD,BAN3:DESCRIPCION)) , 'BANCO_COD_REG')
      DbChangeTrigger.AddItem(BAN3:COD_REGISTRO, WHO(BAN3:RECORD,WHERE(BAN3:RECORD,BAN3:COD_REGISTRO)) , 'BANCO_COD_REG')
   END
   DbChangeTrigger.Update('BANCO_COD_REG')
  RETURN ReturnValue


Hide:Access:BANCO_COD_REG.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('BANCO_COD_REG')
      DbChangeTrigger.AddThread('BANCO_COD_REG')
      DbChangeTrigger.AddItem(BAN3:ID_REGISTRO, WHO(BAN3:RECORD,WHERE(BAN3:RECORD,BAN3:ID_REGISTRO)) , 'BANCO_COD_REG')
      DbChangeTrigger.AddItem(BAN3:DESCRIPCION, WHO(BAN3:RECORD,WHERE(BAN3:RECORD,BAN3:DESCRIPCION)) , 'BANCO_COD_REG')
      DbChangeTrigger.AddItem(BAN3:COD_REGISTRO, WHO(BAN3:RECORD,WHERE(BAN3:RECORD,BAN3:COD_REGISTRO)) , 'BANCO_COD_REG')
   END
   DbChangeTrigger.Update('BANCO_COD_REG')
  RETURN ReturnValue


Hide:Access:BANCO_COD_REG.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('BANCO_COD_REG')
       DbChangeTrigger.CheckChanges('BANCO_COD_REG',BANCO_COD_REG) 
    END
  RETURN ReturnValue


Hide:Access:BANCO_COD_REG.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(BANCO_COD_REG,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(BAN3:PK_BANCO_COD_REG,'BAN3:PK_BANCO_COD_REG',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:BANCO_COD_REG.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:BANCO,RI:None,RI:None,BAN2:FK_BANCO_COD_RESGISTRO)
  SELF.AddRelationLink(BAN3:ID_REGISTRO,BAN2:ID_REGISTRO)


Hide:Relate:BANCO_COD_REG.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('BANCO_COD_REG',BANCO_COD_REG)
  RETURN ReturnValue


Hide:Relate:BANCO_COD_REG.Kill PROCEDURE

  CODE
  _Hide:Access:BANCO_COD_REG.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:BANCO_COD_REG &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:BANCO_COD_REG)                      ! destroy the file manager


Hide:Relate:BANCO_COD_REG.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('BANCO_COD_REG')
       DbChangeTrigger.AddThread('BANCO_COD_REG')
       DbChangeTrigger.AddItem(BAN3:ID_REGISTRO, WHO(BAN3:RECORD,WHERE(BAN3:RECORD,BAN3:ID_REGISTRO)) , 'BANCO_COD_REG')
       DbChangeTrigger.AddItem(BAN3:DESCRIPCION, WHO(BAN3:RECORD,WHERE(BAN3:RECORD,BAN3:DESCRIPCION)) , 'BANCO_COD_REG')
       DbChangeTrigger.AddItem(BAN3:COD_REGISTRO, WHO(BAN3:RECORD,WHERE(BAN3:RECORD,BAN3:COD_REGISTRO)) , 'BANCO_COD_REG')
    END
    DbChangeTrigger.Update('BANCO_COD_REG')


Hide:Relate:BANCO_COD_REG.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('BANCO_COD_REG')
        DbChangeTrigger.CheckChanges('BANCO_COD_REG',BANCO_COD_REG) 
     END
  RETURN ReturnValue


Hide:Relate:OBRA_SOCIAL.Init PROCEDURE()
  CODE
  _Hide:Access:OBRA_SOCIAL.Init
  SELF.Init(Access:OBRA_SOCIAL,1)


Hide:Access:OBRA_SOCIAL.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('OBRA_SOCIAL')
      DbChangeTrigger.AddThread('OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:IDOS, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:IDOS)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:NOMBRE, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:NOMBRE)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:NOMPRE_CORTO, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:NOMPRE_CORTO)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:DIRECCION, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:DIRECCION)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:TELEFONO, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:TELEFONO)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:CUIT, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:CUIT)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:EMAIL, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:EMAIL)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:IDLOCALIDAD, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:IDLOCALIDAD)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:PRONTO_PAGO, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:PRONTO_PAGO)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:FECHA_BAJA, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:FECHA_BAJA)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:OBSERVACION, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:OBSERVACION)) , 'OBRA_SOCIAL')
   END
   DbChangeTrigger.Update('OBRA_SOCIAL')
  RETURN ReturnValue


Hide:Access:OBRA_SOCIAL.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OBR:Record
  SELF.FileNameValue = 'OBRA_SOCIAL'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OBRA_SOCIAL
  PARENT.Init
  Access:OBRA_SOCIAL &= SELF


Hide:Access:OBRA_SOCIAL.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('OBRA_SOCIAL',OBRA_SOCIAL)
  RETURN ReturnValue


Hide:Access:OBRA_SOCIAL.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OBRA_SOCIAL &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OBRA_SOCIAL.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('OBRA_SOCIAL')
      DbChangeTrigger.AddThread('OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:IDOS, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:IDOS)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:NOMBRE, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:NOMBRE)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:NOMPRE_CORTO, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:NOMPRE_CORTO)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:DIRECCION, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:DIRECCION)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:TELEFONO, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:TELEFONO)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:CUIT, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:CUIT)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:EMAIL, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:EMAIL)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:IDLOCALIDAD, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:IDLOCALIDAD)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:PRONTO_PAGO, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:PRONTO_PAGO)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:FECHA_BAJA, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:FECHA_BAJA)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:OBSERVACION, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:OBSERVACION)) , 'OBRA_SOCIAL')
   END
   DbChangeTrigger.Update('OBRA_SOCIAL')
  RETURN ReturnValue


Hide:Access:OBRA_SOCIAL.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('OBRA_SOCIAL')
      DbChangeTrigger.AddThread('OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:IDOS, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:IDOS)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:NOMBRE, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:NOMBRE)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:NOMPRE_CORTO, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:NOMPRE_CORTO)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:DIRECCION, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:DIRECCION)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:TELEFONO, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:TELEFONO)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:CUIT, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:CUIT)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:EMAIL, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:EMAIL)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:IDLOCALIDAD, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:IDLOCALIDAD)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:PRONTO_PAGO, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:PRONTO_PAGO)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:FECHA_BAJA, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:FECHA_BAJA)) , 'OBRA_SOCIAL')
      DbChangeTrigger.AddItem(OBR:OBSERVACION, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:OBSERVACION)) , 'OBRA_SOCIAL')
   END
   DbChangeTrigger.Update('OBRA_SOCIAL')
  RETURN ReturnValue


Hide:Access:OBRA_SOCIAL.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('OBRA_SOCIAL')
       DbChangeTrigger.CheckChanges('OBRA_SOCIAL',OBRA_SOCIAL) 
    END
  RETURN ReturnValue


Hide:Access:OBRA_SOCIAL.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OBRA_SOCIAL,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(OBR:IDX_OBRA_SOCIAL_NOMBRE,'OBR:IDX_OBRA_SOCIAL_NOMBRE',0)
    SELF.AddKey(OBR:IDX_OBRA_SOCIAL_NOM_CORTO,'OBR:IDX_OBRA_SOCIAL_NOM_CORTO',0)
    SELF.AddKey(OBR:FK_OBRA_SOCIAL_LOCALIDAD,'OBR:FK_OBRA_SOCIAL_LOCALIDAD',0)
    SELF.AddKey(OBR:PK_OBRA_SOCIAL,'OBR:PK_OBRA_SOCIAL',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OBRA_SOCIAL.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:NOMENCLADORXOS,RI:None,RI:None,NOM2:FK_NOMENCLADORXOS_OS)
  SELF.AddRelationLink(OBR:IDOS,NOM2:IDOS)

  SELF.AddRelation(Relate:LIQUIDACION_ENTREGA_BANCO,RI:None,RI:None,BCO:FK_LIQUIDACION_ENTREGA_BANCO_OS)
  SELF.AddRelationLink(OBR:IDOS,BCO:IDOS)

  SELF.AddRelation(Relate:LIQUIDACION,RI:None,RI:None,LIQ:FK_LIQUIDACION_OS)
  SELF.AddRelationLink(OBR:IDOS,LIQ:IDOS)

  SELF.AddRelation(Relate:OS_PLANES,RI:None,RI:None,OS_:FK_OS_PLANES_OS)
  SELF.AddRelationLink(OBR:IDOS,OS_:IDOS)

  SELF.AddRelation(Relate:SOCIOSXOS,RI:None,RI:None,SOC3:FK_SOCIOSXOS_OS)
  SELF.AddRelationLink(OBR:IDOS,SOC3:IDOS)


Hide:Relate:OBRA_SOCIAL.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('OBRA_SOCIAL',OBRA_SOCIAL)
  RETURN ReturnValue


Hide:Relate:OBRA_SOCIAL.Kill PROCEDURE

  CODE
  _Hide:Access:OBRA_SOCIAL.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:OBRA_SOCIAL &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OBRA_SOCIAL)                        ! destroy the file manager


Hide:Relate:OBRA_SOCIAL.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('OBRA_SOCIAL')
       DbChangeTrigger.AddThread('OBRA_SOCIAL')
       DbChangeTrigger.AddItem(OBR:IDOS, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:IDOS)) , 'OBRA_SOCIAL')
       DbChangeTrigger.AddItem(OBR:NOMBRE, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:NOMBRE)) , 'OBRA_SOCIAL')
       DbChangeTrigger.AddItem(OBR:NOMPRE_CORTO, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:NOMPRE_CORTO)) , 'OBRA_SOCIAL')
       DbChangeTrigger.AddItem(OBR:DIRECCION, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:DIRECCION)) , 'OBRA_SOCIAL')
       DbChangeTrigger.AddItem(OBR:TELEFONO, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:TELEFONO)) , 'OBRA_SOCIAL')
       DbChangeTrigger.AddItem(OBR:CUIT, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:CUIT)) , 'OBRA_SOCIAL')
       DbChangeTrigger.AddItem(OBR:EMAIL, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:EMAIL)) , 'OBRA_SOCIAL')
       DbChangeTrigger.AddItem(OBR:IDLOCALIDAD, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:IDLOCALIDAD)) , 'OBRA_SOCIAL')
       DbChangeTrigger.AddItem(OBR:PRONTO_PAGO, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:PRONTO_PAGO)) , 'OBRA_SOCIAL')
       DbChangeTrigger.AddItem(OBR:FECHA_BAJA, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:FECHA_BAJA)) , 'OBRA_SOCIAL')
       DbChangeTrigger.AddItem(OBR:OBSERVACION, WHO(OBR:RECORD,WHERE(OBR:RECORD,OBR:OBSERVACION)) , 'OBRA_SOCIAL')
    END
    DbChangeTrigger.Update('OBRA_SOCIAL')


Hide:Relate:OBRA_SOCIAL.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('OBRA_SOCIAL')
        DbChangeTrigger.CheckChanges('OBRA_SOCIAL',OBRA_SOCIAL) 
     END
  RETURN ReturnValue


Hide:Relate:OS_PLANES.Init PROCEDURE()
  CODE
  _Hide:Access:OS_PLANES.Init
  SELF.Init(Access:OS_PLANES,1)


Hide:Access:OS_PLANES.Fetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Fetch(K)
   IF NOT DbChangeTrigger.SetThread('OS_PLANES')
      DbChangeTrigger.AddThread('OS_PLANES')
      DbChangeTrigger.AddItem(OS_:IDOS, WHO(OS_:RECORD,WHERE(OS_:RECORD,OS_:IDOS)) , 'OS_PLANES')
      DbChangeTrigger.AddItem(OS_:IDPLAN_OS, WHO(OS_:RECORD,WHERE(OS_:RECORD,OS_:IDPLAN_OS)) , 'OS_PLANES')
      DbChangeTrigger.AddItem(OS_:PORCENTAJE, WHO(OS_:RECORD,WHERE(OS_:RECORD,OS_:PORCENTAJE)) , 'OS_PLANES')
   END
   DbChangeTrigger.Update('OS_PLANES')
  RETURN ReturnValue


Hide:Access:OS_PLANES.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OS_:Record
  SELF.FileNameValue = 'OS_PLANES'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OS_PLANES
  PARENT.Init
  Access:OS_PLANES &= SELF


Hide:Access:OS_PLANES.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Insert()
  DbAudit.OnInsert('OS_PLANES',OS_PLANES)
  RETURN ReturnValue


Hide:Access:OS_PLANES.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OS_PLANES &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OS_PLANES.SaveBuffer PROCEDURE

ReturnValue          USHORT,AUTO

  CODE
  ReturnValue = PARENT.SaveBuffer()
   IF NOT DbChangeTrigger.SetThread('OS_PLANES')
      DbChangeTrigger.AddThread('OS_PLANES')
      DbChangeTrigger.AddItem(OS_:IDOS, WHO(OS_:RECORD,WHERE(OS_:RECORD,OS_:IDOS)) , 'OS_PLANES')
      DbChangeTrigger.AddItem(OS_:IDPLAN_OS, WHO(OS_:RECORD,WHERE(OS_:RECORD,OS_:IDPLAN_OS)) , 'OS_PLANES')
      DbChangeTrigger.AddItem(OS_:PORCENTAJE, WHO(OS_:RECORD,WHERE(OS_:RECORD,OS_:PORCENTAJE)) , 'OS_PLANES')
   END
   DbChangeTrigger.Update('OS_PLANES')
  RETURN ReturnValue


Hide:Access:OS_PLANES.TryFetch PROCEDURE(KEY K)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TryFetch(K)
   IF NOT DbChangeTrigger.SetThread('OS_PLANES')
      DbChangeTrigger.AddThread('OS_PLANES')
      DbChangeTrigger.AddItem(OS_:IDOS, WHO(OS_:RECORD,WHERE(OS_:RECORD,OS_:IDOS)) , 'OS_PLANES')
      DbChangeTrigger.AddItem(OS_:IDPLAN_OS, WHO(OS_:RECORD,WHERE(OS_:RECORD,OS_:IDPLAN_OS)) , 'OS_PLANES')
      DbChangeTrigger.AddItem(OS_:PORCENTAJE, WHO(OS_:RECORD,WHERE(OS_:RECORD,OS_:PORCENTAJE)) , 'OS_PLANES')
   END
   DbChangeTrigger.Update('OS_PLANES')
  RETURN ReturnValue


Hide:Access:OS_PLANES.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update()
    IF NOT DbChangeTrigger.Equal('OS_PLANES')
       DbChangeTrigger.CheckChanges('OS_PLANES',OS_PLANES) 
    END
  RETURN ReturnValue


Hide:Access:OS_PLANES.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OS_PLANES,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(OS_:FK_OS_PLANES_OS,'OS_:FK_OS_PLANES_OS',0)
    SELF.AddKey(OS_:PK_OS_PLANES,'OS_:PK_OS_PLANES',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:OS_PLANES.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:OBRA_SOCIAL1  USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('OS_:IDOS')
    Save:OBRA_SOCIAL1 = Access:OBRA_SOCIAL.SaveFile()
    OBR:IDOS = OS_:IDOS
    ReturnValue = Access:OBRA_SOCIAL.TryFetch(OBR:PK_OBRA_SOCIAL)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'OBRA_SOCIAL')
      END
    END
    Access:OBRA_SOCIAL.RestoreFile(Save:OBRA_SOCIAL1)
  END
  RETURN ReturnValue


Hide:Relate:OS_PLANES.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OBRA_SOCIAL)


Hide:Relate:OS_PLANES.Delete PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Delete(Query)
  DbAudit.OnDelete('OS_PLANES',OS_PLANES)
  RETURN ReturnValue


Hide:Relate:OS_PLANES.Kill PROCEDURE

  CODE
  _Hide:Access:OS_PLANES.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:OS_PLANES &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OS_PLANES)                          ! destroy the file manager


Hide:Relate:OS_PLANES.Save PROCEDURE

  CODE
  PARENT.Save
    IF NOT DbChangeTrigger.SetThread('OS_PLANES')
       DbChangeTrigger.AddThread('OS_PLANES')
       DbChangeTrigger.AddItem(OS_:IDOS, WHO(OS_:RECORD,WHERE(OS_:RECORD,OS_:IDOS)) , 'OS_PLANES')
       DbChangeTrigger.AddItem(OS_:IDPLAN_OS, WHO(OS_:RECORD,WHERE(OS_:RECORD,OS_:IDPLAN_OS)) , 'OS_PLANES')
       DbChangeTrigger.AddItem(OS_:PORCENTAJE, WHO(OS_:RECORD,WHERE(OS_:RECORD,OS_:PORCENTAJE)) , 'OS_PLANES')
    END
    DbChangeTrigger.Update('OS_PLANES')


Hide:Relate:OS_PLANES.Update PROCEDURE(BYTE FromForm=0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Update(FromForm)
     IF NOT DbChangeTrigger.Equal('OS_PLANES')
        DbChangeTrigger.CheckChanges('OS_PLANES',OS_PLANES) 
     END
  RETURN ReturnValue

