  MEMBER('Deuda2.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
Deuda2_BC0:DctInit    PROCEDURE()
Deuda2_BC0:DctKill    PROCEDURE()
Deuda2_BC0:FilesInit  PROCEDURE()
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

Hide:Access:DEUDA    CLASS(FileManager),TYPE               ! FileManager for DEUDA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:DEUDA    CLASS(RelationManager),TYPE           ! RelationManager for DEUDA
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:TIPO_COBERTURA CLASS(FileManager),TYPE         ! FileManager for TIPO_COBERTURA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_COBERTURA CLASS(RelationManager),TYPE     ! RelationManager for TIPO_COBERTURA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
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

Hide:Access:CONTROL_FACTURA CLASS(FileManager),TYPE        ! FileManager for CONTROL_FACTURA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:CONTROL_FACTURA CLASS(RelationManager),TYPE    ! RelationManager for CONTROL_FACTURA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CONVENIO CLASS(FileManager),TYPE               ! FileManager for CONVENIO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:CONVENIO CLASS(RelationManager),TYPE           ! RelationManager for CONVENIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CONVENIO_DETALLE CLASS(FileManager),TYPE       ! FileManager for CONVENIO_DETALLE
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:CONVENIO_DETALLE CLASS(RelationManager),TYPE   ! RelationManager for CONVENIO_DETALLE
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:DETALLE_FACTURA CLASS(FileManager),TYPE        ! FileManager for DETALLE_FACTURA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:DETALLE_FACTURA CLASS(RelationManager),TYPE    ! RelationManager for DETALLE_FACTURA
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

Hide:Access:PERIODO_FACTURA CLASS(FileManager),TYPE        ! FileManager for PERIODO_FACTURA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:PERIODO_FACTURA CLASS(RelationManager),TYPE    ! RelationManager for PERIODO_FACTURA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SERVICIOS CLASS(FileManager),TYPE              ! FileManager for SERVICIOS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SERVICIOS CLASS(RelationManager),TYPE          ! RelationManager for SERVICIOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SERVICIOXSOCIO CLASS(FileManager),TYPE         ! FileManager for SERVICIOXSOCIO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:SERVICIOXSOCIO CLASS(RelationManager),TYPE     ! RelationManager for SERVICIOXSOCIO
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

Hide:Access:TIPO_CONVENIO CLASS(FileManager),TYPE          ! FileManager for TIPO_CONVENIO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_CONVENIO CLASS(RelationManager),TYPE      ! RelationManager for TIPO_CONVENIO
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


_Hide:Access:CIRCULO &Hide:Access:CIRCULO,AUTO,THREAD
_Hide:Relate:CIRCULO &Hide:Relate:CIRCULO,AUTO,THREAD
_Hide:Access:DEUDA   &Hide:Access:DEUDA,AUTO,THREAD
_Hide:Relate:DEUDA   &Hide:Relate:DEUDA,AUTO,THREAD
_Hide:Access:TIPO_COBERTURA &Hide:Access:TIPO_COBERTURA,AUTO,THREAD
_Hide:Relate:TIPO_COBERTURA &Hide:Relate:TIPO_COBERTURA,AUTO,THREAD
_Hide:Access:COBERTURA &Hide:Access:COBERTURA,AUTO,THREAD
_Hide:Relate:COBERTURA &Hide:Relate:COBERTURA,AUTO,THREAD
_Hide:Access:CONTROL_FACTURA &Hide:Access:CONTROL_FACTURA,AUTO,THREAD
_Hide:Relate:CONTROL_FACTURA &Hide:Relate:CONTROL_FACTURA,AUTO,THREAD
_Hide:Access:CONVENIO &Hide:Access:CONVENIO,AUTO,THREAD
_Hide:Relate:CONVENIO &Hide:Relate:CONVENIO,AUTO,THREAD
_Hide:Access:CONVENIO_DETALLE &Hide:Access:CONVENIO_DETALLE,AUTO,THREAD
_Hide:Relate:CONVENIO_DETALLE &Hide:Relate:CONVENIO_DETALLE,AUTO,THREAD
_Hide:Access:DETALLE_FACTURA &Hide:Access:DETALLE_FACTURA,AUTO,THREAD
_Hide:Relate:DETALLE_FACTURA &Hide:Relate:DETALLE_FACTURA,AUTO,THREAD
_Hide:Access:FACTURA &Hide:Access:FACTURA,AUTO,THREAD
_Hide:Relate:FACTURA &Hide:Relate:FACTURA,AUTO,THREAD
_Hide:Access:INSTITUCION &Hide:Access:INSTITUCION,AUTO,THREAD
_Hide:Relate:INSTITUCION &Hide:Relate:INSTITUCION,AUTO,THREAD
_Hide:Access:LOCALIDAD &Hide:Access:LOCALIDAD,AUTO,THREAD
_Hide:Relate:LOCALIDAD &Hide:Relate:LOCALIDAD,AUTO,THREAD
_Hide:Access:PAIS    &Hide:Access:PAIS,AUTO,THREAD
_Hide:Relate:PAIS    &Hide:Relate:PAIS,AUTO,THREAD
_Hide:Access:PERIODO_FACTURA &Hide:Access:PERIODO_FACTURA,AUTO,THREAD
_Hide:Relate:PERIODO_FACTURA &Hide:Relate:PERIODO_FACTURA,AUTO,THREAD
_Hide:Access:SERVICIOS &Hide:Access:SERVICIOS,AUTO,THREAD
_Hide:Relate:SERVICIOS &Hide:Relate:SERVICIOS,AUTO,THREAD
_Hide:Access:SERVICIOXSOCIO &Hide:Access:SERVICIOXSOCIO,AUTO,THREAD
_Hide:Relate:SERVICIOXSOCIO &Hide:Relate:SERVICIOXSOCIO,AUTO,THREAD
_Hide:Access:SOCIOS  &Hide:Access:SOCIOS,AUTO,THREAD
_Hide:Relate:SOCIOS  &Hide:Relate:SOCIOS,AUTO,THREAD
_Hide:Access:TIPO_CONVENIO &Hide:Access:TIPO_CONVENIO,AUTO,THREAD
_Hide:Relate:TIPO_CONVENIO &Hide:Relate:TIPO_CONVENIO,AUTO,THREAD
_Hide:Access:TIPO_DOC &Hide:Access:TIPO_DOC,AUTO,THREAD
_Hide:Relate:TIPO_DOC &Hide:Relate:TIPO_DOC,AUTO,THREAD
_Hide:Access:TIPO_INSTITUCION &Hide:Access:TIPO_INSTITUCION,AUTO,THREAD
_Hide:Relate:TIPO_INSTITUCION &Hide:Relate:TIPO_INSTITUCION,AUTO,THREAD
_Hide:Access:USUARIO &Hide:Access:USUARIO,AUTO,THREAD
_Hide:Relate:USUARIO &Hide:Relate:USUARIO,AUTO,THREAD


Deuda2_BC0:DctInit PROCEDURE()
  CODE
  _Hide:Access:CIRCULO &= NEW(Hide:Access:CIRCULO)
  _Hide:Relate:CIRCULO &= NEW(Hide:Relate:CIRCULO)
  _Hide:Access:DEUDA &= NEW(Hide:Access:DEUDA)
  _Hide:Relate:DEUDA &= NEW(Hide:Relate:DEUDA)
  _Hide:Access:TIPO_COBERTURA &= NEW(Hide:Access:TIPO_COBERTURA)
  _Hide:Relate:TIPO_COBERTURA &= NEW(Hide:Relate:TIPO_COBERTURA)
  _Hide:Access:COBERTURA &= NEW(Hide:Access:COBERTURA)
  _Hide:Relate:COBERTURA &= NEW(Hide:Relate:COBERTURA)
  _Hide:Access:CONTROL_FACTURA &= NEW(Hide:Access:CONTROL_FACTURA)
  _Hide:Relate:CONTROL_FACTURA &= NEW(Hide:Relate:CONTROL_FACTURA)
  _Hide:Access:CONVENIO &= NEW(Hide:Access:CONVENIO)
  _Hide:Relate:CONVENIO &= NEW(Hide:Relate:CONVENIO)
  _Hide:Access:CONVENIO_DETALLE &= NEW(Hide:Access:CONVENIO_DETALLE)
  _Hide:Relate:CONVENIO_DETALLE &= NEW(Hide:Relate:CONVENIO_DETALLE)
  _Hide:Access:DETALLE_FACTURA &= NEW(Hide:Access:DETALLE_FACTURA)
  _Hide:Relate:DETALLE_FACTURA &= NEW(Hide:Relate:DETALLE_FACTURA)
  _Hide:Access:FACTURA &= NEW(Hide:Access:FACTURA)
  _Hide:Relate:FACTURA &= NEW(Hide:Relate:FACTURA)
  _Hide:Access:INSTITUCION &= NEW(Hide:Access:INSTITUCION)
  _Hide:Relate:INSTITUCION &= NEW(Hide:Relate:INSTITUCION)
  _Hide:Access:LOCALIDAD &= NEW(Hide:Access:LOCALIDAD)
  _Hide:Relate:LOCALIDAD &= NEW(Hide:Relate:LOCALIDAD)
  _Hide:Access:PAIS &= NEW(Hide:Access:PAIS)
  _Hide:Relate:PAIS &= NEW(Hide:Relate:PAIS)
  _Hide:Access:PERIODO_FACTURA &= NEW(Hide:Access:PERIODO_FACTURA)
  _Hide:Relate:PERIODO_FACTURA &= NEW(Hide:Relate:PERIODO_FACTURA)
  _Hide:Access:SERVICIOS &= NEW(Hide:Access:SERVICIOS)
  _Hide:Relate:SERVICIOS &= NEW(Hide:Relate:SERVICIOS)
  _Hide:Access:SERVICIOXSOCIO &= NEW(Hide:Access:SERVICIOXSOCIO)
  _Hide:Relate:SERVICIOXSOCIO &= NEW(Hide:Relate:SERVICIOXSOCIO)
  _Hide:Access:SOCIOS &= NEW(Hide:Access:SOCIOS)
  _Hide:Relate:SOCIOS &= NEW(Hide:Relate:SOCIOS)
  _Hide:Access:TIPO_CONVENIO &= NEW(Hide:Access:TIPO_CONVENIO)
  _Hide:Relate:TIPO_CONVENIO &= NEW(Hide:Relate:TIPO_CONVENIO)
  _Hide:Access:TIPO_DOC &= NEW(Hide:Access:TIPO_DOC)
  _Hide:Relate:TIPO_DOC &= NEW(Hide:Relate:TIPO_DOC)
  _Hide:Access:TIPO_INSTITUCION &= NEW(Hide:Access:TIPO_INSTITUCION)
  _Hide:Relate:TIPO_INSTITUCION &= NEW(Hide:Relate:TIPO_INSTITUCION)
  _Hide:Access:USUARIO &= NEW(Hide:Access:USUARIO)
  _Hide:Relate:USUARIO &= NEW(Hide:Relate:USUARIO)
  Relate:CIRCULO &= _Hide:Relate:CIRCULO
  Relate:DEUDA &= _Hide:Relate:DEUDA
  Relate:TIPO_COBERTURA &= _Hide:Relate:TIPO_COBERTURA
  Relate:COBERTURA &= _Hide:Relate:COBERTURA
  Relate:CONTROL_FACTURA &= _Hide:Relate:CONTROL_FACTURA
  Relate:CONVENIO &= _Hide:Relate:CONVENIO
  Relate:CONVENIO_DETALLE &= _Hide:Relate:CONVENIO_DETALLE
  Relate:DETALLE_FACTURA &= _Hide:Relate:DETALLE_FACTURA
  Relate:FACTURA &= _Hide:Relate:FACTURA
  Relate:INSTITUCION &= _Hide:Relate:INSTITUCION
  Relate:LOCALIDAD &= _Hide:Relate:LOCALIDAD
  Relate:PAIS &= _Hide:Relate:PAIS
  Relate:PERIODO_FACTURA &= _Hide:Relate:PERIODO_FACTURA
  Relate:SERVICIOS &= _Hide:Relate:SERVICIOS
  Relate:SERVICIOXSOCIO &= _Hide:Relate:SERVICIOXSOCIO
  Relate:SOCIOS &= _Hide:Relate:SOCIOS
  Relate:TIPO_CONVENIO &= _Hide:Relate:TIPO_CONVENIO
  Relate:TIPO_DOC &= _Hide:Relate:TIPO_DOC
  Relate:TIPO_INSTITUCION &= _Hide:Relate:TIPO_INSTITUCION
  Relate:USUARIO &= _Hide:Relate:USUARIO


Deuda2_BC0:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:CIRCULO.Init
  _Hide:Relate:DEUDA.Init
  _Hide:Relate:TIPO_COBERTURA.Init
  _Hide:Relate:COBERTURA.Init
  _Hide:Relate:CONTROL_FACTURA.Init
  _Hide:Relate:CONVENIO.Init
  _Hide:Relate:CONVENIO_DETALLE.Init
  _Hide:Relate:DETALLE_FACTURA.Init
  _Hide:Relate:FACTURA.Init
  _Hide:Relate:INSTITUCION.Init
  _Hide:Relate:LOCALIDAD.Init
  _Hide:Relate:PAIS.Init
  _Hide:Relate:PERIODO_FACTURA.Init
  _Hide:Relate:SERVICIOS.Init
  _Hide:Relate:SERVICIOXSOCIO.Init
  _Hide:Relate:SOCIOS.Init
  _Hide:Relate:TIPO_CONVENIO.Init
  _Hide:Relate:TIPO_DOC.Init
  _Hide:Relate:TIPO_INSTITUCION.Init
  _Hide:Relate:USUARIO.Init


Deuda2_BC0:DctKill PROCEDURE()
  CODE
  _Hide:Relate:CIRCULO.Kill
  DISPOSE(_Hide:Relate:CIRCULO)
  _Hide:Relate:DEUDA.Kill
  DISPOSE(_Hide:Relate:DEUDA)
  _Hide:Relate:TIPO_COBERTURA.Kill
  DISPOSE(_Hide:Relate:TIPO_COBERTURA)
  _Hide:Relate:COBERTURA.Kill
  DISPOSE(_Hide:Relate:COBERTURA)
  _Hide:Relate:CONTROL_FACTURA.Kill
  DISPOSE(_Hide:Relate:CONTROL_FACTURA)
  _Hide:Relate:CONVENIO.Kill
  DISPOSE(_Hide:Relate:CONVENIO)
  _Hide:Relate:CONVENIO_DETALLE.Kill
  DISPOSE(_Hide:Relate:CONVENIO_DETALLE)
  _Hide:Relate:DETALLE_FACTURA.Kill
  DISPOSE(_Hide:Relate:DETALLE_FACTURA)
  _Hide:Relate:FACTURA.Kill
  DISPOSE(_Hide:Relate:FACTURA)
  _Hide:Relate:INSTITUCION.Kill
  DISPOSE(_Hide:Relate:INSTITUCION)
  _Hide:Relate:LOCALIDAD.Kill
  DISPOSE(_Hide:Relate:LOCALIDAD)
  _Hide:Relate:PAIS.Kill
  DISPOSE(_Hide:Relate:PAIS)
  _Hide:Relate:PERIODO_FACTURA.Kill
  DISPOSE(_Hide:Relate:PERIODO_FACTURA)
  _Hide:Relate:SERVICIOS.Kill
  DISPOSE(_Hide:Relate:SERVICIOS)
  _Hide:Relate:SERVICIOXSOCIO.Kill
  DISPOSE(_Hide:Relate:SERVICIOXSOCIO)
  _Hide:Relate:SOCIOS.Kill
  DISPOSE(_Hide:Relate:SOCIOS)
  _Hide:Relate:TIPO_CONVENIO.Kill
  DISPOSE(_Hide:Relate:TIPO_CONVENIO)
  _Hide:Relate:TIPO_DOC.Kill
  DISPOSE(_Hide:Relate:TIPO_DOC)
  _Hide:Relate:TIPO_INSTITUCION.Kill
  DISPOSE(_Hide:Relate:TIPO_INSTITUCION)
  _Hide:Relate:USUARIO.Kill
  DISPOSE(_Hide:Relate:USUARIO)


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


Hide:Relate:DEUDA.Init PROCEDURE()
  CODE
  _Hide:Access:DEUDA.Init
  SELF.Init(Access:DEUDA,1)


Hide:Access:DEUDA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DEU:Record
  SELF.FileNameValue = 'DEUDA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DEUDA
  PARENT.Init
  Access:DEUDA &= SELF


Hide:Access:DEUDA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DEUDA &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DEUDA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DEUDA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DEUDA.Kill PROCEDURE

  CODE
  _Hide:Access:DEUDA.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:DEUDA &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DEUDA)                              ! destroy the file manager


Hide:Relate:TIPO_COBERTURA.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_COBERTURA.Init
  SELF.Init(Access:TIPO_COBERTURA,1)


Hide:Access:TIPO_COBERTURA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIPC:Record
  SELF.FileNameValue = 'TIPO_COBERTURA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_COBERTURA
  PARENT.Init
  Access:TIPO_COBERTURA &= SELF


Hide:Access:TIPO_COBERTURA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_COBERTURA &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:TIPO_COBERTURA.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_COBERTURA.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_COBERTURA &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_COBERTURA)                     ! destroy the file manager


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
  SELF.AddRelation(Relate:TIPO_COBERTURA,RI:None,RI:None,TIPC:FK_TIPO_COBERTURA_1)
  SELF.AddRelationLink(COB:IDCOBERTURA,TIPC:IDCOBERTURA)

  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_COBERTURA)
  SELF.AddRelationLink(COB:IDCOBERTURA,SOC:IDCOBERTURA)


Hide:Relate:COBERTURA.Kill PROCEDURE

  CODE
  _Hide:Access:COBERTURA.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:COBERTURA &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:COBERTURA)                          ! destroy the file manager


Hide:Relate:CONTROL_FACTURA.Init PROCEDURE()
  CODE
  _Hide:Access:CONTROL_FACTURA.Init
  SELF.Init(Access:CONTROL_FACTURA,1)


Hide:Access:CONTROL_FACTURA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CON3:Record
  SELF.FileNameValue = 'CONTROL_FACTURA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CONTROL_FACTURA
  PARENT.Init
  Access:CONTROL_FACTURA &= SELF


Hide:Access:CONTROL_FACTURA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CONTROL_FACTURA &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:CONTROL_FACTURA.Kill PROCEDURE

  CODE
  _Hide:Access:CONTROL_FACTURA.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:CONTROL_FACTURA &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CONTROL_FACTURA)                    ! destroy the file manager


Hide:Relate:CONVENIO.Init PROCEDURE()
  CODE
  _Hide:Access:CONVENIO.Init
  SELF.Init(Access:CONVENIO,1)


Hide:Access:CONVENIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CON4:Record
  SELF.FileNameValue = 'CONVENIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CONVENIO
  PARENT.Init
  Access:CONVENIO &= SELF


Hide:Access:CONVENIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CONVENIO &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


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
  SELF.AddRelation(Relate:CONVENIO_DETALLE,RI:None,RI:None,CON5:FK_CONVENIO_DETALLE)
  SELF.AddRelationLink(CON4:IDSOLICITUD,CON5:IDSOLICITUD)

  SELF.AddRelation(Relate:SOCIOS)

  SELF.AddRelation(Relate:TIPO_CONVENIO)


Hide:Relate:CONVENIO.Kill PROCEDURE

  CODE
  _Hide:Access:CONVENIO.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:CONVENIO &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CONVENIO)                           ! destroy the file manager


Hide:Relate:CONVENIO_DETALLE.Init PROCEDURE()
  CODE
  _Hide:Access:CONVENIO_DETALLE.Init
  SELF.Init(Access:CONVENIO_DETALLE,1)


Hide:Access:CONVENIO_DETALLE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CON5:Record
  SELF.FileNameValue = 'CONVENIO_DETALLE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CONVENIO_DETALLE
  PARENT.Init
  Access:CONVENIO_DETALLE &= SELF


Hide:Access:CONVENIO_DETALLE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CONVENIO_DETALLE &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:CONVENIO_DETALLE.Kill PROCEDURE

  CODE
  _Hide:Access:CONVENIO_DETALLE.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:CONVENIO_DETALLE &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CONVENIO_DETALLE)                   ! destroy the file manager


Hide:Relate:DETALLE_FACTURA.Init PROCEDURE()
  CODE
  _Hide:Access:DETALLE_FACTURA.Init
  SELF.Init(Access:DETALLE_FACTURA,1)


Hide:Access:DETALLE_FACTURA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DET:Record
  SELF.FileNameValue = 'DETALLE_FACTURA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DETALLE_FACTURA
  PARENT.Init
  Access:DETALLE_FACTURA &= SELF


Hide:Access:DETALLE_FACTURA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DETALLE_FACTURA &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:DETALLE_FACTURA.Kill PROCEDURE

  CODE
  _Hide:Access:DETALLE_FACTURA.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:DETALLE_FACTURA &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DETALLE_FACTURA)                    ! destroy the file manager


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
  SELF.AddRelation(Relate:DETALLE_FACTURA,RI:None,RI:None,DET:FK_DETALLE_FACTURA)
  SELF.AddRelationLink(FAC:IDFACTURA,DET:IDFACTURA)

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


Hide:Relate:PERIODO_FACTURA.Init PROCEDURE()
  CODE
  _Hide:Access:PERIODO_FACTURA.Init
  SELF.Init(Access:PERIODO_FACTURA,1)


Hide:Access:PERIODO_FACTURA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PER:Record
  SELF.FileNameValue = 'PERIODO_FACTURA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PERIODO_FACTURA
  PARENT.Init
  Access:PERIODO_FACTURA &= SELF


Hide:Access:PERIODO_FACTURA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PERIODO_FACTURA &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:PERIODO_FACTURA.Kill PROCEDURE

  CODE
  _Hide:Access:PERIODO_FACTURA.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:PERIODO_FACTURA &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PERIODO_FACTURA)                    ! destroy the file manager


Hide:Relate:SERVICIOS.Init PROCEDURE()
  CODE
  _Hide:Access:SERVICIOS.Init
  SELF.Init(Access:SERVICIOS,1)


Hide:Access:SERVICIOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SER:Record
  SELF.FileNameValue = 'SERVICIOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SERVICIOS
  PARENT.Init
  Access:SERVICIOS &= SELF


Hide:Access:SERVICIOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SERVICIOS &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:SERVICIOS.Kill PROCEDURE

  CODE
  _Hide:Access:SERVICIOS.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:SERVICIOS &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SERVICIOS)                          ! destroy the file manager


Hide:Relate:SERVICIOXSOCIO.Init PROCEDURE()
  CODE
  _Hide:Access:SERVICIOXSOCIO.Init
  SELF.Init(Access:SERVICIOXSOCIO,1)


Hide:Access:SERVICIOXSOCIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SER2:Record
  SELF.FileNameValue = 'SERVICIOXSOCIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SERVICIOXSOCIO
  PARENT.Init
  Access:SERVICIOXSOCIO &= SELF


Hide:Access:SERVICIOXSOCIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SERVICIOXSOCIO &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:SERVICIOXSOCIO.Kill PROCEDURE

  CODE
  _Hide:Access:SERVICIOXSOCIO.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:SERVICIOXSOCIO &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SERVICIOXSOCIO)                     ! destroy the file manager


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

  SELF.AddRelation(Relate:FACTURA,RI:None,RI:None,FAC:FK_FACTURA_SOCIO)
  SELF.AddRelationLink(SOC:IDSOCIO,FAC:IDSOCIO)

  SELF.AddRelation(Relate:CONTROL_FACTURA,RI:None,RI:None,CON3:FK_CONTROL_FACTURA)
  SELF.AddRelationLink(SOC:IDSOCIO,CON3:IDSOCIO)

  SELF.AddRelation(Relate:CONVENIO,RI:None,RI:None,CON4:FK_CONVENIO_SOCIOS)
  SELF.AddRelationLink(SOC:IDSOCIO,CON4:IDSOCIO)

  SELF.AddRelation(Relate:SERVICIOXSOCIO,RI:None,RI:None,SER2:FK_SERVICIOXSOCIO_SOCIOS)
  SELF.AddRelationLink(SOC:IDSOCIO,SER2:IDSOCIO)

  SELF.AddRelation(Relate:TIPO_DOC)

  SELF.AddRelation(Relate:USUARIO)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:ZONA_VIVIENDA)

  SELF.AddRelation(Relate:TIPO_TITULO)

  SELF.AddRelation(Relate:BANCO)


Hide:Relate:SOCIOS.Kill PROCEDURE

  CODE
  _Hide:Access:SOCIOS.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:SOCIOS &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SOCIOS)                             ! destroy the file manager


Hide:Relate:TIPO_CONVENIO.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_CONVENIO.Init
  SELF.Init(Access:TIPO_CONVENIO,1)


Hide:Access:TIPO_CONVENIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIP:Record
  SELF.FileNameValue = 'TIPO_CONVENIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_CONVENIO
  PARENT.Init
  Access:TIPO_CONVENIO &= SELF


Hide:Access:TIPO_CONVENIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_CONVENIO &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:TIPO_CONVENIO.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_CONVENIO.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_CONVENIO &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_CONVENIO)                      ! destroy the file manager


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
  SELF.AddRelation(Relate:FACTURA,RI:None,RI:None,FAC:FK_FACTURA_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,FAC:IDUSUARIO)

  SELF.AddRelation(Relate:PERIODO_FACTURA,RI:None,RI:None,PER:FK_PERIODO_FACTURA_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,PER:IDUSUARIO)

  SELF.AddRelation(Relate:SOCIOS,RI:None,RI:None,SOC:FK_SOCIOS_USUARIO)
  SELF.AddRelationLink(USU:IDUSUARIO,SOC:IDUSUARIO)


Hide:Relate:USUARIO.Kill PROCEDURE

  CODE
  _Hide:Access:USUARIO.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:USUARIO &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:USUARIO)                            ! destroy the file manager

