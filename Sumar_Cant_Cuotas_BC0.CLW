  MEMBER('Sumar_Cant_Cuotas.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
Sumar_Cant_Cuotas_BC0:DctInit    PROCEDURE()
Sumar_Cant_Cuotas_BC0:DctKill    PROCEDURE()
Sumar_Cant_Cuotas_BC0:FilesInit  PROCEDURE()
  END

Hide:Access:CIRCULO  CLASS(FileManager),TYPE               ! FileManager for CIRCULO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CIRCULO  CLASS(RelationManager),TYPE           ! RelationManager for CIRCULO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:FONDOS   CLASS(FileManager),TYPE               ! FileManager for FONDOS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:FONDOS   CLASS(RelationManager),TYPE           ! RelationManager for FONDOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PAGO_CONVENIO CLASS(FileManager),TYPE          ! FileManager for PAGO_CONVENIO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:PAGO_CONVENIO CLASS(RelationManager),TYPE      ! RelationManager for PAGO_CONVENIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:RANKING  CLASS(FileManager),TYPE               ! FileManager for RANKING
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:RANKING  CLASS(RelationManager),TYPE           ! RelationManager for RANKING
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:COBERTURA CLASS(FileManager),TYPE              ! FileManager for COBERTURA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:COBERTURA CLASS(RelationManager),TYPE          ! RelationManager for COBERTURA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:FACTURA  CLASS(FileManager),TYPE               ! FileManager for FACTURA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:FACTURA  CLASS(RelationManager),TYPE           ! RelationManager for FACTURA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:INSTITUCION CLASS(FileManager),TYPE            ! FileManager for INSTITUCION
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:INSTITUCION CLASS(RelationManager),TYPE        ! RelationManager for INSTITUCION
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:LOCALIDAD CLASS(FileManager),TYPE              ! FileManager for LOCALIDAD
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:LOCALIDAD CLASS(RelationManager),TYPE          ! RelationManager for LOCALIDAD
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PAGOS    CLASS(FileManager),TYPE               ! FileManager for PAGOS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:PAGOS    CLASS(RelationManager),TYPE           ! RelationManager for PAGOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PAIS     CLASS(FileManager),TYPE               ! FileManager for PAIS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PAIS     CLASS(RelationManager),TYPE           ! RelationManager for PAIS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SOCIOS   CLASS(FileManager),TYPE               ! FileManager for SOCIOS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:SOCIOS   CLASS(RelationManager),TYPE           ! RelationManager for SOCIOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:TIPO_DOC CLASS(FileManager),TYPE               ! FileManager for TIPO_DOC
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_DOC CLASS(RelationManager),TYPE           ! RelationManager for TIPO_DOC
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:TIPO_INSTITUCION CLASS(FileManager),TYPE       ! FileManager for TIPO_INSTITUCION
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_INSTITUCION CLASS(RelationManager),TYPE   ! RelationManager for TIPO_INSTITUCION
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:USUARIO  CLASS(FileManager),TYPE               ! FileManager for USUARIO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:USUARIO  CLASS(RelationManager),TYPE           ! RelationManager for USUARIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ZONA_VIVIENDA CLASS(FileManager),TYPE          ! FileManager for ZONA_VIVIENDA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ZONA_VIVIENDA CLASS(RelationManager),TYPE      ! RelationManager for ZONA_VIVIENDA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CUENTAS  CLASS(FileManager),TYPE               ! FileManager for CUENTAS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CUENTAS  CLASS(RelationManager),TYPE           ! RelationManager for CUENTAS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:INGRESOS CLASS(FileManager),TYPE               ! FileManager for INGRESOS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:INGRESOS CLASS(RelationManager),TYPE           ! RelationManager for INGRESOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:LIBDIARIO CLASS(FileManager),TYPE              ! FileManager for LIBDIARIO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:LIBDIARIO CLASS(RelationManager),TYPE          ! RelationManager for LIBDIARIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SUBCUENTAS CLASS(FileManager),TYPE             ! FileManager for SUBCUENTAS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:SUBCUENTAS CLASS(RelationManager),TYPE         ! RelationManager for SUBCUENTAS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:NIVEL_FORMACION CLASS(FileManager),TYPE        ! FileManager for NIVEL_FORMACION
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:NIVEL_FORMACION CLASS(RelationManager),TYPE    ! RelationManager for NIVEL_FORMACION
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:CIRCULO &Hide:Access:CIRCULO,AUTO,THREAD
_Hide:Relate:CIRCULO &Hide:Relate:CIRCULO,AUTO,THREAD
_Hide:Access:FONDOS  &Hide:Access:FONDOS,AUTO,THREAD
_Hide:Relate:FONDOS  &Hide:Relate:FONDOS,AUTO,THREAD
_Hide:Access:PAGO_CONVENIO &Hide:Access:PAGO_CONVENIO,AUTO,THREAD
_Hide:Relate:PAGO_CONVENIO &Hide:Relate:PAGO_CONVENIO,AUTO,THREAD
_Hide:Access:RANKING &Hide:Access:RANKING,AUTO,THREAD
_Hide:Relate:RANKING &Hide:Relate:RANKING,AUTO,THREAD
_Hide:Access:COBERTURA &Hide:Access:COBERTURA,AUTO,THREAD
_Hide:Relate:COBERTURA &Hide:Relate:COBERTURA,AUTO,THREAD
_Hide:Access:FACTURA &Hide:Access:FACTURA,AUTO,THREAD
_Hide:Relate:FACTURA &Hide:Relate:FACTURA,AUTO,THREAD
_Hide:Access:INSTITUCION &Hide:Access:INSTITUCION,AUTO,THREAD
_Hide:Relate:INSTITUCION &Hide:Relate:INSTITUCION,AUTO,THREAD
_Hide:Access:LOCALIDAD &Hide:Access:LOCALIDAD,AUTO,THREAD
_Hide:Relate:LOCALIDAD &Hide:Relate:LOCALIDAD,AUTO,THREAD
_Hide:Access:PAGOS   &Hide:Access:PAGOS,AUTO,THREAD
_Hide:Relate:PAGOS   &Hide:Relate:PAGOS,AUTO,THREAD
_Hide:Access:PAIS    &Hide:Access:PAIS,AUTO,THREAD
_Hide:Relate:PAIS    &Hide:Relate:PAIS,AUTO,THREAD
_Hide:Access:SOCIOS  &Hide:Access:SOCIOS,AUTO,THREAD
_Hide:Relate:SOCIOS  &Hide:Relate:SOCIOS,AUTO,THREAD
_Hide:Access:TIPO_DOC &Hide:Access:TIPO_DOC,AUTO,THREAD
_Hide:Relate:TIPO_DOC &Hide:Relate:TIPO_DOC,AUTO,THREAD
_Hide:Access:TIPO_INSTITUCION &Hide:Access:TIPO_INSTITUCION,AUTO,THREAD
_Hide:Relate:TIPO_INSTITUCION &Hide:Relate:TIPO_INSTITUCION,AUTO,THREAD
_Hide:Access:USUARIO &Hide:Access:USUARIO,AUTO,THREAD
_Hide:Relate:USUARIO &Hide:Relate:USUARIO,AUTO,THREAD
_Hide:Access:ZONA_VIVIENDA &Hide:Access:ZONA_VIVIENDA,AUTO,THREAD
_Hide:Relate:ZONA_VIVIENDA &Hide:Relate:ZONA_VIVIENDA,AUTO,THREAD
_Hide:Access:CUENTAS &Hide:Access:CUENTAS,AUTO,THREAD
_Hide:Relate:CUENTAS &Hide:Relate:CUENTAS,AUTO,THREAD
_Hide:Access:INGRESOS &Hide:Access:INGRESOS,AUTO,THREAD
_Hide:Relate:INGRESOS &Hide:Relate:INGRESOS,AUTO,THREAD
_Hide:Access:LIBDIARIO &Hide:Access:LIBDIARIO,AUTO,THREAD
_Hide:Relate:LIBDIARIO &Hide:Relate:LIBDIARIO,AUTO,THREAD
_Hide:Access:SUBCUENTAS &Hide:Access:SUBCUENTAS,AUTO,THREAD
_Hide:Relate:SUBCUENTAS &Hide:Relate:SUBCUENTAS,AUTO,THREAD
_Hide:Access:NIVEL_FORMACION &Hide:Access:NIVEL_FORMACION,AUTO,THREAD
_Hide:Relate:NIVEL_FORMACION &Hide:Relate:NIVEL_FORMACION,AUTO,THREAD


Sumar_Cant_Cuotas_BC0:DctInit PROCEDURE()
  CODE
  _Hide:Access:CIRCULO &= NEW(Hide:Access:CIRCULO)
  _Hide:Relate:CIRCULO &= NEW(Hide:Relate:CIRCULO)
  _Hide:Access:FONDOS &= NEW(Hide:Access:FONDOS)
  _Hide:Relate:FONDOS &= NEW(Hide:Relate:FONDOS)
  _Hide:Access:PAGO_CONVENIO &= NEW(Hide:Access:PAGO_CONVENIO)
  _Hide:Relate:PAGO_CONVENIO &= NEW(Hide:Relate:PAGO_CONVENIO)
  _Hide:Access:RANKING &= NEW(Hide:Access:RANKING)
  _Hide:Relate:RANKING &= NEW(Hide:Relate:RANKING)
  _Hide:Access:COBERTURA &= NEW(Hide:Access:COBERTURA)
  _Hide:Relate:COBERTURA &= NEW(Hide:Relate:COBERTURA)
  _Hide:Access:FACTURA &= NEW(Hide:Access:FACTURA)
  _Hide:Relate:FACTURA &= NEW(Hide:Relate:FACTURA)
  _Hide:Access:INSTITUCION &= NEW(Hide:Access:INSTITUCION)
  _Hide:Relate:INSTITUCION &= NEW(Hide:Relate:INSTITUCION)
  _Hide:Access:LOCALIDAD &= NEW(Hide:Access:LOCALIDAD)
  _Hide:Relate:LOCALIDAD &= NEW(Hide:Relate:LOCALIDAD)
  _Hide:Access:PAGOS &= NEW(Hide:Access:PAGOS)
  _Hide:Relate:PAGOS &= NEW(Hide:Relate:PAGOS)
  _Hide:Access:PAIS &= NEW(Hide:Access:PAIS)
  _Hide:Relate:PAIS &= NEW(Hide:Relate:PAIS)
  _Hide:Access:SOCIOS &= NEW(Hide:Access:SOCIOS)
  _Hide:Relate:SOCIOS &= NEW(Hide:Relate:SOCIOS)
  _Hide:Access:TIPO_DOC &= NEW(Hide:Access:TIPO_DOC)
  _Hide:Relate:TIPO_DOC &= NEW(Hide:Relate:TIPO_DOC)
  _Hide:Access:TIPO_INSTITUCION &= NEW(Hide:Access:TIPO_INSTITUCION)
  _Hide:Relate:TIPO_INSTITUCION &= NEW(Hide:Relate:TIPO_INSTITUCION)
  _Hide:Access:USUARIO &= NEW(Hide:Access:USUARIO)
  _Hide:Relate:USUARIO &= NEW(Hide:Relate:USUARIO)
  _Hide:Access:ZONA_VIVIENDA &= NEW(Hide:Access:ZONA_VIVIENDA)
  _Hide:Relate:ZONA_VIVIENDA &= NEW(Hide:Relate:ZONA_VIVIENDA)
  _Hide:Access:CUENTAS &= NEW(Hide:Access:CUENTAS)
  _Hide:Relate:CUENTAS &= NEW(Hide:Relate:CUENTAS)
  _Hide:Access:INGRESOS &= NEW(Hide:Access:INGRESOS)
  _Hide:Relate:INGRESOS &= NEW(Hide:Relate:INGRESOS)
  _Hide:Access:LIBDIARIO &= NEW(Hide:Access:LIBDIARIO)
  _Hide:Relate:LIBDIARIO &= NEW(Hide:Relate:LIBDIARIO)
  _Hide:Access:SUBCUENTAS &= NEW(Hide:Access:SUBCUENTAS)
  _Hide:Relate:SUBCUENTAS &= NEW(Hide:Relate:SUBCUENTAS)
  _Hide:Access:NIVEL_FORMACION &= NEW(Hide:Access:NIVEL_FORMACION)
  _Hide:Relate:NIVEL_FORMACION &= NEW(Hide:Relate:NIVEL_FORMACION)
  Relate:CIRCULO &= _Hide:Relate:CIRCULO
  Relate:FONDOS &= _Hide:Relate:FONDOS
  Relate:PAGO_CONVENIO &= _Hide:Relate:PAGO_CONVENIO
  Relate:RANKING &= _Hide:Relate:RANKING
  Relate:COBERTURA &= _Hide:Relate:COBERTURA
  Relate:FACTURA &= _Hide:Relate:FACTURA
  Relate:INSTITUCION &= _Hide:Relate:INSTITUCION
  Relate:LOCALIDAD &= _Hide:Relate:LOCALIDAD
  Relate:PAGOS &= _Hide:Relate:PAGOS
  Relate:PAIS &= _Hide:Relate:PAIS
  Relate:SOCIOS &= _Hide:Relate:SOCIOS
  Relate:TIPO_DOC &= _Hide:Relate:TIPO_DOC
  Relate:TIPO_INSTITUCION &= _Hide:Relate:TIPO_INSTITUCION
  Relate:USUARIO &= _Hide:Relate:USUARIO
  Relate:ZONA_VIVIENDA &= _Hide:Relate:ZONA_VIVIENDA
  Relate:CUENTAS &= _Hide:Relate:CUENTAS
  Relate:INGRESOS &= _Hide:Relate:INGRESOS
  Relate:LIBDIARIO &= _Hide:Relate:LIBDIARIO
  Relate:SUBCUENTAS &= _Hide:Relate:SUBCUENTAS
  Relate:NIVEL_FORMACION &= _Hide:Relate:NIVEL_FORMACION


Sumar_Cant_Cuotas_BC0:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:CIRCULO.Init
  _Hide:Relate:FONDOS.Init
  _Hide:Relate:PAGO_CONVENIO.Init
  _Hide:Relate:RANKING.Init
  _Hide:Relate:COBERTURA.Init
  _Hide:Relate:FACTURA.Init
  _Hide:Relate:INSTITUCION.Init
  _Hide:Relate:LOCALIDAD.Init
  _Hide:Relate:PAGOS.Init
  _Hide:Relate:PAIS.Init
  _Hide:Relate:SOCIOS.Init
  _Hide:Relate:TIPO_DOC.Init
  _Hide:Relate:TIPO_INSTITUCION.Init
  _Hide:Relate:USUARIO.Init
  _Hide:Relate:ZONA_VIVIENDA.Init
  _Hide:Relate:CUENTAS.Init
  _Hide:Relate:INGRESOS.Init
  _Hide:Relate:LIBDIARIO.Init
  _Hide:Relate:SUBCUENTAS.Init
  _Hide:Relate:NIVEL_FORMACION.Init


Sumar_Cant_Cuotas_BC0:DctKill PROCEDURE()
  CODE
  _Hide:Relate:CIRCULO.Kill
  DISPOSE(_Hide:Relate:CIRCULO)
  _Hide:Relate:FONDOS.Kill
  DISPOSE(_Hide:Relate:FONDOS)
  _Hide:Relate:PAGO_CONVENIO.Kill
  DISPOSE(_Hide:Relate:PAGO_CONVENIO)
  _Hide:Relate:RANKING.Kill
  DISPOSE(_Hide:Relate:RANKING)
  _Hide:Relate:COBERTURA.Kill
  DISPOSE(_Hide:Relate:COBERTURA)
  _Hide:Relate:FACTURA.Kill
  DISPOSE(_Hide:Relate:FACTURA)
  _Hide:Relate:INSTITUCION.Kill
  DISPOSE(_Hide:Relate:INSTITUCION)
  _Hide:Relate:LOCALIDAD.Kill
  DISPOSE(_Hide:Relate:LOCALIDAD)
  _Hide:Relate:PAGOS.Kill
  DISPOSE(_Hide:Relate:PAGOS)
  _Hide:Relate:PAIS.Kill
  DISPOSE(_Hide:Relate:PAIS)
  _Hide:Relate:SOCIOS.Kill
  DISPOSE(_Hide:Relate:SOCIOS)
  _Hide:Relate:TIPO_DOC.Kill
  DISPOSE(_Hide:Relate:TIPO_DOC)
  _Hide:Relate:TIPO_INSTITUCION.Kill
  DISPOSE(_Hide:Relate:TIPO_INSTITUCION)
  _Hide:Relate:USUARIO.Kill
  DISPOSE(_Hide:Relate:USUARIO)
  _Hide:Relate:ZONA_VIVIENDA.Kill
  DISPOSE(_Hide:Relate:ZONA_VIVIENDA)
  _Hide:Relate:CUENTAS.Kill
  DISPOSE(_Hide:Relate:CUENTAS)
  _Hide:Relate:INGRESOS.Kill
  DISPOSE(_Hide:Relate:INGRESOS)
  _Hide:Relate:LIBDIARIO.Kill
  DISPOSE(_Hide:Relate:LIBDIARIO)
  _Hide:Relate:SUBCUENTAS.Kill
  DISPOSE(_Hide:Relate:SUBCUENTAS)
  _Hide:Relate:NIVEL_FORMACION.Kill
  DISPOSE(_Hide:Relate:NIVEL_FORMACION)


Hide:Relate:CIRCULO.Init PROCEDURE()
  CODE
  _Hide:Access:CIRCULO.Init
  SELF.Init(Access:CIRCULO,1)


Hide:Access:CIRCULO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CIR:Record
  SELF.FileNameValue = 'CIRCULO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CIRCULO
  PARENT.Init
  Access:CIRCULO &= SELF


Hide:Access:CIRCULO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CIRCULO &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


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
  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_CIRCULO)
  SELF.AddRelationLink(CIR:IDCIRCULO,SOC:IDCIRCULO)


Hide:Relate:CIRCULO.Kill PROCEDURE

  CODE
  _Hide:Access:CIRCULO.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:CIRCULO &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CIRCULO)                            ! destroy the file manager


Hide:Relate:FONDOS.Init PROCEDURE()
  CODE
  _Hide:Access:FONDOS.Init
  SELF.Init(Access:FONDOS,1)


Hide:Access:FONDOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FON:Record
  SELF.FileNameValue = 'FONDOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= FONDOS
  PARENT.Init
  Access:FONDOS &= SELF


Hide:Access:FONDOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:FONDOS &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:FONDOS.Kill PROCEDURE

  CODE
  _Hide:Access:FONDOS.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:FONDOS &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:FONDOS)                             ! destroy the file manager


Hide:Relate:PAGO_CONVENIO.Init PROCEDURE()
  CODE
  _Hide:Access:PAGO_CONVENIO.Init
  SELF.Init(Access:PAGO_CONVENIO,1)


Hide:Access:PAGO_CONVENIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PAGCON:Record
  SELF.FileNameValue = 'PAGO_CONVENIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PAGO_CONVENIO
  PARENT.Init
  Access:PAGO_CONVENIO &= SELF


Hide:Access:PAGO_CONVENIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PAGO_CONVENIO &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PAGO_CONVENIO.PrimeFields PROCEDURE

  CODE
  PAGCON:IDSUBCUENTA = 1                                   ! Assign initial field value
  PARENT.PrimeFields


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
  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:USUARIO)

  SELF.AddRelation(Relate:SUBCUENTAS)


Hide:Relate:PAGO_CONVENIO.Kill PROCEDURE

  CODE
  _Hide:Access:PAGO_CONVENIO.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:PAGO_CONVENIO &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PAGO_CONVENIO)                      ! destroy the file manager


Hide:Relate:RANKING.Init PROCEDURE()
  CODE
  _Hide:Access:RANKING.Init
  SELF.Init(Access:RANKING,1)


Hide:Access:RANKING.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RAN:Record
  SELF.FileNameValue = 'RANKING'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RANKING
  PARENT.Init
  Access:RANKING &= SELF


Hide:Access:RANKING.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RANKING &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:RANKING.Kill PROCEDURE

  CODE
  _Hide:Access:RANKING.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:RANKING &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RANKING)                            ! destroy the file manager


Hide:Relate:COBERTURA.Init PROCEDURE()
  CODE
  _Hide:Access:COBERTURA.Init
  SELF.Init(Access:COBERTURA,1)


Hide:Access:COBERTURA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= COB:Record
  SELF.FileNameValue = 'COBERTURA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= COBERTURA
  PARENT.Init
  Access:COBERTURA &= SELF


Hide:Access:COBERTURA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:COBERTURA &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


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
  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_COBERTURA)
  SELF.AddRelationLink(COB:IDCOBERTURA,SOC:IDCOBERTURA)


Hide:Relate:COBERTURA.Kill PROCEDURE

  CODE
  _Hide:Access:COBERTURA.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:COBERTURA &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:COBERTURA)                          ! destroy the file manager


Hide:Relate:FACTURA.Init PROCEDURE()
  CODE
  _Hide:Access:FACTURA.Init
  SELF.Init(Access:FACTURA,1)


Hide:Access:FACTURA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FAC:Record
  SELF.FileNameValue = 'FACTURA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= FACTURA
  PARENT.Init
  Access:FACTURA &= SELF


Hide:Access:FACTURA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:FACTURA &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


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
  SELF.AddRelation(Relate:PAGOS,RI:None,RI:None,PAG:FK_PAGOS_FACTURA)
  SELF.AddRelationLink(FAC:IDFACTURA,PAG:IDFACTURA)

  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:USUARIO)


Hide:Relate:FACTURA.Kill PROCEDURE

  CODE
  _Hide:Access:FACTURA.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:FACTURA &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:FACTURA)                            ! destroy the file manager


Hide:Relate:INSTITUCION.Init PROCEDURE()
  CODE
  _Hide:Access:INSTITUCION.Init
  SELF.Init(Access:INSTITUCION,1)


Hide:Access:INSTITUCION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= INS2:Record
  SELF.FileNameValue = 'INSTITUCION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= INSTITUCION
  PARENT.Init
  Access:INSTITUCION &= SELF


Hide:Access:INSTITUCION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:INSTITUCION &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


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
  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_INSTITUCION)
  SELF.AddRelationLink(INS2:IDINSTITUCION,SOC:IDINSTITUCION)

  SELF.AddRelation(Relate:LOCALIDAD)

  SELF.AddRelation(Relate:TIPO_INSTITUCION)


Hide:Relate:INSTITUCION.Kill PROCEDURE

  CODE
  _Hide:Access:INSTITUCION.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:INSTITUCION &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:INSTITUCION)                        ! destroy the file manager


Hide:Relate:LOCALIDAD.Init PROCEDURE()
  CODE
  _Hide:Access:LOCALIDAD.Init
  SELF.Init(Access:LOCALIDAD,1)


Hide:Access:LOCALIDAD.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LOC:Record
  SELF.FileNameValue = 'LOCALIDAD'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LOCALIDAD
  PARENT.Init
  Access:LOCALIDAD &= SELF


Hide:Access:LOCALIDAD.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LOCALIDAD &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


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
  SELF.AddRelation(Relate:INSTITUCION,RI:None,RI:None,INS2:FK_INSTITUCION_LOCALIDAD)
  SELF.AddRelationLink(LOC:IDLOCALIDAD,INS2:IDLOCALIDAD)

  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_LOCALIDAD)
  SELF.AddRelationLink(LOC:IDLOCALIDAD,SOC:IDLOCALIDAD)

  SELF.AddRelation(Relate:PAIS)


Hide:Relate:LOCALIDAD.Kill PROCEDURE

  CODE
  _Hide:Access:LOCALIDAD.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:LOCALIDAD &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LOCALIDAD)                          ! destroy the file manager


Hide:Relate:PAGOS.Init PROCEDURE()
  CODE
  _Hide:Access:PAGOS.Init
  SELF.Init(Access:PAGOS,1)


Hide:Access:PAGOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PAG:Record
  SELF.FileNameValue = 'PAGOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PAGOS
  PARENT.Init
  Access:PAGOS &= SELF


Hide:Access:PAGOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PAGOS &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PAGOS.PrimeFields PROCEDURE

  CODE
  PAG:IDSUBCUENTA = 1                                      ! Assign initial field value
  PARENT.PrimeFields


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


Hide:Relate:PAGOS.Kill PROCEDURE

  CODE
  _Hide:Access:PAGOS.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:PAGOS &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PAGOS)                              ! destroy the file manager


Hide:Relate:PAIS.Init PROCEDURE()
  CODE
  _Hide:Access:PAIS.Init
  SELF.Init(Access:PAIS,1)


Hide:Access:PAIS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PAI:Record
  SELF.FileNameValue = 'PAIS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PAIS
  PARENT.Init
  Access:PAIS &= SELF


Hide:Access:PAIS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PAIS &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:PAIS.Kill PROCEDURE

  CODE
  _Hide:Access:PAIS.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:PAIS &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PAIS)                               ! destroy the file manager


Hide:Relate:SOCIOS.Init PROCEDURE()
  CODE
  _Hide:Access:SOCIOS.Init
  SELF.Init(Access:SOCIOS,1)


Hide:Access:SOCIOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SOC:Record
  SELF.FileNameValue = 'SOCIOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SOCIOS
  PARENT.Init
  Access:SOCIOS &= SELF


Hide:Access:SOCIOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SOCIOS &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SOCIOS.PrimeFields PROCEDURE

  CODE
  SOC:BAJA_TEMPORARIA = 'NO'                               ! Assign initial field value
  PARENT.PrimeFields


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
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CIRCULO)

  SELF.AddRelation(Relate:COBERTURA)

  SELF.AddRelation(Relate:INSTITUCION)

  SELF.AddRelation(Relate:LOCALIDAD)

  SELF.AddRelation(Relate:PAGO_CONVENIO,RI:None,RI:None,PAGCON:FK_PAGO_CONVENIO_SOCIO)
  SELF.AddRelationLink(SOC:IDSOCIO,PAGCON:IDSOCIO)

  SELF.AddRelation(Relate:FACTURA,RI:None,RI:None,FAC:FK_FACTURA_SOCIO)
  SELF.AddRelationLink(SOC:IDSOCIO,FAC:IDSOCIO)

  SELF.AddRelation(Relate:PAGOS,RI:None,RI:None,PAG:FK_PAGOS_SOCIOS)
  SELF.AddRelationLink(SOC:IDSOCIO,PAG:IDSOCIO)

  SELF.AddRelation(Relate:TIPO_DOC)

  SELF.AddRelation(Relate:USUARIO)

  SELF.AddRelation(Relate:ZONA_VIVIENDA)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:TIPO_TITULO)

  SELF.AddRelation(Relate:TIPO_IVA)

  SELF.AddRelation(Relate:BANCO)

  SELF.AddRelation(Relate:PROVEEDORES,RI:None,RI:None,PRO2:PK_PROVEEDOR)
  SELF.AddRelationLink(SOC:IDPROVEEDOR,PRO2:IDPROVEEDOR)


Hide:Relate:SOCIOS.Kill PROCEDURE

  CODE
  _Hide:Access:SOCIOS.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:SOCIOS &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SOCIOS)                             ! destroy the file manager


Hide:Relate:TIPO_DOC.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_DOC.Init
  SELF.Init(Access:TIPO_DOC,1)


Hide:Access:TIPO_DOC.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIP3:Record
  SELF.FileNameValue = 'TIPO_DOC'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_DOC
  PARENT.Init
  Access:TIPO_DOC &= SELF


Hide:Access:TIPO_DOC.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_DOC &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:TIPO_DOC.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_DOC.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_DOC &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_DOC)                           ! destroy the file manager


Hide:Relate:TIPO_INSTITUCION.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_INSTITUCION.Init
  SELF.Init(Access:TIPO_INSTITUCION,1)


Hide:Access:TIPO_INSTITUCION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIP4:Record
  SELF.FileNameValue = 'TIPO_INSTITUCION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_INSTITUCION
  PARENT.Init
  Access:TIPO_INSTITUCION &= SELF


Hide:Access:TIPO_INSTITUCION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_INSTITUCION &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:TIPO_INSTITUCION.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_INSTITUCION.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_INSTITUCION &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_INSTITUCION)                   ! destroy the file manager


Hide:Relate:USUARIO.Init PROCEDURE()
  CODE
  _Hide:Access:USUARIO.Init
  SELF.Init(Access:USUARIO,1)


Hide:Access:USUARIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= USU:Record
  SELF.FileNameValue = 'USUARIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= USUARIO
  PARENT.Init
  Access:USUARIO &= SELF


Hide:Access:USUARIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:USUARIO &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


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
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:PROVEEDORES,RI:None,RI:None,PRO2:FK_PROVEEDORES_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,PRO2:IDUSUARIO)

  SELF.AddRelation(Relate:INGRESOS,RI:None,RI:None,ING:PK_INGRESOS)
  SELF.AddRelationLink(USU:IDUSUARIO,ING:IDINGRESO)

  SELF.AddRelation(Relate:PAGO_CONVENIO,RI:None,RI:None,PAGCON:FK_PAGO_CONVENIO_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,PAGCON:IDUSUARIO)

  SELF.AddRelation(Relate:FACTURA,RI:None,RI:None,FAC:FK_FACTURA_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,FAC:IDUSUARIO)

  SELF.AddRelation(Relate:PAGOS,RI:None,RI:None,PAG:FK_PAGOS_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,PAG:IDUSUARIO)

  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,SOC:IDUSUARIO)


Hide:Relate:USUARIO.Kill PROCEDURE

  CODE
  _Hide:Access:USUARIO.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:USUARIO &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:USUARIO)                            ! destroy the file manager


Hide:Relate:ZONA_VIVIENDA.Init PROCEDURE()
  CODE
  _Hide:Access:ZONA_VIVIENDA.Init
  SELF.Init(Access:ZONA_VIVIENDA,1)


Hide:Access:ZONA_VIVIENDA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ZON:Record
  SELF.FileNameValue = 'ZONA_VIVIENDA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ZONA_VIVIENDA
  PARENT.Init
  Access:ZONA_VIVIENDA &= SELF


Hide:Access:ZONA_VIVIENDA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ZONA_VIVIENDA &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:ZONA_VIVIENDA.Kill PROCEDURE

  CODE
  _Hide:Access:ZONA_VIVIENDA.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:ZONA_VIVIENDA &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ZONA_VIVIENDA)                      ! destroy the file manager


Hide:Relate:CUENTAS.Init PROCEDURE()
  CODE
  _Hide:Access:CUENTAS.Init
  SELF.Init(Access:CUENTAS,1)


Hide:Access:CUENTAS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CUE:Record
  SELF.FileNameValue = 'CUENTAS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CUENTAS
  PARENT.Init
  Access:CUENTAS &= SELF


Hide:Access:CUENTAS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CUENTAS &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:CUENTAS.Kill PROCEDURE

  CODE
  _Hide:Access:CUENTAS.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:CUENTAS &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CUENTAS)                            ! destroy the file manager


Hide:Relate:INGRESOS.Init PROCEDURE()
  CODE
  _Hide:Access:INGRESOS.Init
  SELF.Init(Access:INGRESOS,1)


Hide:Access:INGRESOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ING:Record
  SELF.FileNameValue = 'INGRESOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= INGRESOS
  PARENT.Init
  Access:INGRESOS &= SELF


Hide:Access:INGRESOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:INGRESOS &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:INGRESOS.Kill PROCEDURE

  CODE
  _Hide:Access:INGRESOS.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:INGRESOS &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:INGRESOS)                           ! destroy the file manager


Hide:Relate:LIBDIARIO.Init PROCEDURE()
  CODE
  _Hide:Access:LIBDIARIO.Init
  SELF.Init(Access:LIBDIARIO,1)


Hide:Access:LIBDIARIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LIB:Record
  SELF.FileNameValue = 'LIBDIARIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LIBDIARIO
  PARENT.Init
  Access:LIBDIARIO &= SELF


Hide:Access:LIBDIARIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LIBDIARIO &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:LIBDIARIO.Kill PROCEDURE

  CODE
  _Hide:Access:LIBDIARIO.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:LIBDIARIO &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LIBDIARIO)                          ! destroy the file manager


Hide:Relate:SUBCUENTAS.Init PROCEDURE()
  CODE
  _Hide:Access:SUBCUENTAS.Init
  SELF.Init(Access:SUBCUENTAS,1)


Hide:Access:SUBCUENTAS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SUB:Record
  SELF.FileNameValue = 'SUBCUENTAS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SUBCUENTAS
  PARENT.Init
  Access:SUBCUENTAS &= SELF


Hide:Access:SUBCUENTAS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SUBCUENTAS &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


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

  SELF.AddRelation(Relate:INGRESOS,RI:None,RI:None,ING:FK_INGRESOS_SUBCUENTA)
  SELF.AddRelationLink(SUB:IDSUBCUENTA,ING:IDSUBCUENTA)

  SELF.AddRelation(Relate:LIBDIARIO,RI:None,RI:None,LIB:FK_LIBDIARIO_SUBCUENTA)
  SELF.AddRelationLink(SUB:IDSUBCUENTA,LIB:IDSUBCUENTA)


Hide:Relate:SUBCUENTAS.Kill PROCEDURE

  CODE
  _Hide:Access:SUBCUENTAS.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:SUBCUENTAS &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SUBCUENTAS)                         ! destroy the file manager


Hide:Relate:NIVEL_FORMACION.Init PROCEDURE()
  CODE
  _Hide:Access:NIVEL_FORMACION.Init
  SELF.Init(Access:NIVEL_FORMACION,1)


Hide:Access:NIVEL_FORMACION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= NIV:Record
  SELF.FileNameValue = 'NIVEL_FORMACION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= NIVEL_FORMACION
  PARENT.Init
  Access:NIVEL_FORMACION &= SELF


Hide:Access:NIVEL_FORMACION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:NIVEL_FORMACION &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:NIVEL_FORMACION.Kill PROCEDURE

  CODE
  _Hide:Access:NIVEL_FORMACION.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:NIVEL_FORMACION &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:NIVEL_FORMACION)                    ! destroy the file manager

