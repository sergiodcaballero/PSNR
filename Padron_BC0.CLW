  MEMBER('Padron.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
Padron_BC0:DctInit    PROCEDURE()
Padron_BC0:DctKill    PROCEDURE()
Padron_BC0:FilesInit  PROCEDURE()
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

Hide:Access:PADRON   CLASS(FileManager),TYPE               ! FileManager for PADRON
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PADRON   CLASS(RelationManager),TYPE           ! RelationManager for PADRON
Init                   PROCEDURE
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

Hide:Access:TIPO_TITULO CLASS(FileManager),TYPE            ! FileManager for TIPO_TITULO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_TITULO CLASS(RelationManager),TYPE        ! RelationManager for TIPO_TITULO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:TIPO_IVA CLASS(FileManager),TYPE               ! FileManager for TIPO_IVA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_IVA CLASS(RelationManager),TYPE           ! RelationManager for TIPO_IVA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:BANCO    CLASS(FileManager),TYPE               ! FileManager for BANCO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:BANCO    CLASS(RelationManager),TYPE           ! RelationManager for BANCO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:BANCO_COD_REG CLASS(FileManager),TYPE          ! FileManager for BANCO_COD_REG
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:BANCO_COD_REG CLASS(RelationManager),TYPE      ! RelationManager for BANCO_COD_REG
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:MATRICULADOS CLASS(FileManager),TYPE           ! FileManager for MATRICULADOS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:MATRICULADOS CLASS(RelationManager),TYPE       ! RelationManager for MATRICULADOS
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:CIRCULO &Hide:Access:CIRCULO,AUTO,THREAD
_Hide:Relate:CIRCULO &Hide:Relate:CIRCULO,AUTO,THREAD
_Hide:Access:COBERTURA &Hide:Access:COBERTURA,AUTO,THREAD
_Hide:Relate:COBERTURA &Hide:Relate:COBERTURA,AUTO,THREAD
_Hide:Access:INSTITUCION &Hide:Access:INSTITUCION,AUTO,THREAD
_Hide:Relate:INSTITUCION &Hide:Relate:INSTITUCION,AUTO,THREAD
_Hide:Access:LOCALIDAD &Hide:Access:LOCALIDAD,AUTO,THREAD
_Hide:Relate:LOCALIDAD &Hide:Relate:LOCALIDAD,AUTO,THREAD
_Hide:Access:PAIS    &Hide:Access:PAIS,AUTO,THREAD
_Hide:Relate:PAIS    &Hide:Relate:PAIS,AUTO,THREAD
_Hide:Access:SOCIOS  &Hide:Access:SOCIOS,AUTO,THREAD
_Hide:Relate:SOCIOS  &Hide:Relate:SOCIOS,AUTO,THREAD
_Hide:Access:TIPO_DOC &Hide:Access:TIPO_DOC,AUTO,THREAD
_Hide:Relate:TIPO_DOC &Hide:Relate:TIPO_DOC,AUTO,THREAD
_Hide:Access:PADRON  &Hide:Access:PADRON,AUTO,THREAD
_Hide:Relate:PADRON  &Hide:Relate:PADRON,AUTO,THREAD
_Hide:Access:TIPO_INSTITUCION &Hide:Access:TIPO_INSTITUCION,AUTO,THREAD
_Hide:Relate:TIPO_INSTITUCION &Hide:Relate:TIPO_INSTITUCION,AUTO,THREAD
_Hide:Access:USUARIO &Hide:Access:USUARIO,AUTO,THREAD
_Hide:Relate:USUARIO &Hide:Relate:USUARIO,AUTO,THREAD
_Hide:Access:ZONA_VIVIENDA &Hide:Access:ZONA_VIVIENDA,AUTO,THREAD
_Hide:Relate:ZONA_VIVIENDA &Hide:Relate:ZONA_VIVIENDA,AUTO,THREAD
_Hide:Access:NIVEL_FORMACION &Hide:Access:NIVEL_FORMACION,AUTO,THREAD
_Hide:Relate:NIVEL_FORMACION &Hide:Relate:NIVEL_FORMACION,AUTO,THREAD
_Hide:Access:TIPO_TITULO &Hide:Access:TIPO_TITULO,AUTO,THREAD
_Hide:Relate:TIPO_TITULO &Hide:Relate:TIPO_TITULO,AUTO,THREAD
_Hide:Access:TIPO_IVA &Hide:Access:TIPO_IVA,AUTO,THREAD
_Hide:Relate:TIPO_IVA &Hide:Relate:TIPO_IVA,AUTO,THREAD
_Hide:Access:BANCO   &Hide:Access:BANCO,AUTO,THREAD
_Hide:Relate:BANCO   &Hide:Relate:BANCO,AUTO,THREAD
_Hide:Access:BANCO_COD_REG &Hide:Access:BANCO_COD_REG,AUTO,THREAD
_Hide:Relate:BANCO_COD_REG &Hide:Relate:BANCO_COD_REG,AUTO,THREAD
_Hide:Access:MATRICULADOS &Hide:Access:MATRICULADOS,AUTO,THREAD
_Hide:Relate:MATRICULADOS &Hide:Relate:MATRICULADOS,AUTO,THREAD


Padron_BC0:DctInit PROCEDURE()
  CODE
  _Hide:Access:CIRCULO &= NEW(Hide:Access:CIRCULO)
  _Hide:Relate:CIRCULO &= NEW(Hide:Relate:CIRCULO)
  _Hide:Access:COBERTURA &= NEW(Hide:Access:COBERTURA)
  _Hide:Relate:COBERTURA &= NEW(Hide:Relate:COBERTURA)
  _Hide:Access:INSTITUCION &= NEW(Hide:Access:INSTITUCION)
  _Hide:Relate:INSTITUCION &= NEW(Hide:Relate:INSTITUCION)
  _Hide:Access:LOCALIDAD &= NEW(Hide:Access:LOCALIDAD)
  _Hide:Relate:LOCALIDAD &= NEW(Hide:Relate:LOCALIDAD)
  _Hide:Access:PAIS &= NEW(Hide:Access:PAIS)
  _Hide:Relate:PAIS &= NEW(Hide:Relate:PAIS)
  _Hide:Access:SOCIOS &= NEW(Hide:Access:SOCIOS)
  _Hide:Relate:SOCIOS &= NEW(Hide:Relate:SOCIOS)
  _Hide:Access:TIPO_DOC &= NEW(Hide:Access:TIPO_DOC)
  _Hide:Relate:TIPO_DOC &= NEW(Hide:Relate:TIPO_DOC)
  _Hide:Access:PADRON &= NEW(Hide:Access:PADRON)
  _Hide:Relate:PADRON &= NEW(Hide:Relate:PADRON)
  _Hide:Access:TIPO_INSTITUCION &= NEW(Hide:Access:TIPO_INSTITUCION)
  _Hide:Relate:TIPO_INSTITUCION &= NEW(Hide:Relate:TIPO_INSTITUCION)
  _Hide:Access:USUARIO &= NEW(Hide:Access:USUARIO)
  _Hide:Relate:USUARIO &= NEW(Hide:Relate:USUARIO)
  _Hide:Access:ZONA_VIVIENDA &= NEW(Hide:Access:ZONA_VIVIENDA)
  _Hide:Relate:ZONA_VIVIENDA &= NEW(Hide:Relate:ZONA_VIVIENDA)
  _Hide:Access:NIVEL_FORMACION &= NEW(Hide:Access:NIVEL_FORMACION)
  _Hide:Relate:NIVEL_FORMACION &= NEW(Hide:Relate:NIVEL_FORMACION)
  _Hide:Access:TIPO_TITULO &= NEW(Hide:Access:TIPO_TITULO)
  _Hide:Relate:TIPO_TITULO &= NEW(Hide:Relate:TIPO_TITULO)
  _Hide:Access:TIPO_IVA &= NEW(Hide:Access:TIPO_IVA)
  _Hide:Relate:TIPO_IVA &= NEW(Hide:Relate:TIPO_IVA)
  _Hide:Access:BANCO &= NEW(Hide:Access:BANCO)
  _Hide:Relate:BANCO &= NEW(Hide:Relate:BANCO)
  _Hide:Access:BANCO_COD_REG &= NEW(Hide:Access:BANCO_COD_REG)
  _Hide:Relate:BANCO_COD_REG &= NEW(Hide:Relate:BANCO_COD_REG)
  _Hide:Access:MATRICULADOS &= NEW(Hide:Access:MATRICULADOS)
  _Hide:Relate:MATRICULADOS &= NEW(Hide:Relate:MATRICULADOS)
  Relate:CIRCULO &= _Hide:Relate:CIRCULO
  Relate:COBERTURA &= _Hide:Relate:COBERTURA
  Relate:INSTITUCION &= _Hide:Relate:INSTITUCION
  Relate:LOCALIDAD &= _Hide:Relate:LOCALIDAD
  Relate:PAIS &= _Hide:Relate:PAIS
  Relate:SOCIOS &= _Hide:Relate:SOCIOS
  Relate:TIPO_DOC &= _Hide:Relate:TIPO_DOC
  Relate:PADRON &= _Hide:Relate:PADRON
  Relate:TIPO_INSTITUCION &= _Hide:Relate:TIPO_INSTITUCION
  Relate:USUARIO &= _Hide:Relate:USUARIO
  Relate:ZONA_VIVIENDA &= _Hide:Relate:ZONA_VIVIENDA
  Relate:NIVEL_FORMACION &= _Hide:Relate:NIVEL_FORMACION
  Relate:TIPO_TITULO &= _Hide:Relate:TIPO_TITULO
  Relate:TIPO_IVA &= _Hide:Relate:TIPO_IVA
  Relate:BANCO &= _Hide:Relate:BANCO
  Relate:BANCO_COD_REG &= _Hide:Relate:BANCO_COD_REG
  Relate:MATRICULADOS &= _Hide:Relate:MATRICULADOS


Padron_BC0:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:CIRCULO.Init
  _Hide:Relate:COBERTURA.Init
  _Hide:Relate:INSTITUCION.Init
  _Hide:Relate:LOCALIDAD.Init
  _Hide:Relate:PAIS.Init
  _Hide:Relate:SOCIOS.Init
  _Hide:Relate:TIPO_DOC.Init
  _Hide:Relate:PADRON.Init
  _Hide:Relate:TIPO_INSTITUCION.Init
  _Hide:Relate:USUARIO.Init
  _Hide:Relate:ZONA_VIVIENDA.Init
  _Hide:Relate:NIVEL_FORMACION.Init
  _Hide:Relate:TIPO_TITULO.Init
  _Hide:Relate:TIPO_IVA.Init
  _Hide:Relate:BANCO.Init
  _Hide:Relate:BANCO_COD_REG.Init
  _Hide:Relate:MATRICULADOS.Init


Padron_BC0:DctKill PROCEDURE()
  CODE
  _Hide:Relate:CIRCULO.Kill
  DISPOSE(_Hide:Relate:CIRCULO)
  _Hide:Relate:COBERTURA.Kill
  DISPOSE(_Hide:Relate:COBERTURA)
  _Hide:Relate:INSTITUCION.Kill
  DISPOSE(_Hide:Relate:INSTITUCION)
  _Hide:Relate:LOCALIDAD.Kill
  DISPOSE(_Hide:Relate:LOCALIDAD)
  _Hide:Relate:PAIS.Kill
  DISPOSE(_Hide:Relate:PAIS)
  _Hide:Relate:SOCIOS.Kill
  DISPOSE(_Hide:Relate:SOCIOS)
  _Hide:Relate:TIPO_DOC.Kill
  DISPOSE(_Hide:Relate:TIPO_DOC)
  _Hide:Relate:PADRON.Kill
  DISPOSE(_Hide:Relate:PADRON)
  _Hide:Relate:TIPO_INSTITUCION.Kill
  DISPOSE(_Hide:Relate:TIPO_INSTITUCION)
  _Hide:Relate:USUARIO.Kill
  DISPOSE(_Hide:Relate:USUARIO)
  _Hide:Relate:ZONA_VIVIENDA.Kill
  DISPOSE(_Hide:Relate:ZONA_VIVIENDA)
  _Hide:Relate:NIVEL_FORMACION.Kill
  DISPOSE(_Hide:Relate:NIVEL_FORMACION)
  _Hide:Relate:TIPO_TITULO.Kill
  DISPOSE(_Hide:Relate:TIPO_TITULO)
  _Hide:Relate:TIPO_IVA.Kill
  DISPOSE(_Hide:Relate:TIPO_IVA)
  _Hide:Relate:BANCO.Kill
  DISPOSE(_Hide:Relate:BANCO)
  _Hide:Relate:BANCO_COD_REG.Kill
  DISPOSE(_Hide:Relate:BANCO_COD_REG)
  _Hide:Relate:MATRICULADOS.Kill
  DISPOSE(_Hide:Relate:MATRICULADOS)


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
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CIRCULO)

  SELF.AddRelation(Relate:COBERTURA)

  SELF.AddRelation(Relate:INSTITUCION)

  SELF.AddRelation(Relate:LOCALIDAD)

  SELF.AddRelation(Relate:TIPO_DOC)

  SELF.AddRelation(Relate:USUARIO)

  SELF.AddRelation(Relate:ZONA_VIVIENDA)

  SELF.AddRelation(Relate:TIPO_TITULO)

  SELF.AddRelation(Relate:TIPO_IVA)

  SELF.AddRelation(Relate:BANCO)


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


Hide:Relate:PADRON.Init PROCEDURE()
  CODE
  _Hide:Access:PADRON.Init
  SELF.Init(Access:PADRON,1)


Hide:Access:PADRON.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PAD1:Record
  SELF.FileNameValue = 'PADRON'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PADRON
  PARENT.Init
  Access:PADRON &= SELF


Hide:Access:PADRON.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PADRON &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PADRON.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PADRON,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(PAD1:PK_SOCIOS,'PAD1:PK_SOCIOS',0)
    SELF.AddKey(PAD1:IDX_SOCIOS_DOCUMENTO,'PAD1:IDX_SOCIOS_DOCUMENTO',0)
    SELF.AddKey(PAD1:IDX_SOCIOS_MATRICULA,'PAD1:IDX_SOCIOS_MATRICULA',0)
    SELF.AddKey(PAD1:FK_SOCIOS_COLEGIO,'PAD1:FK_SOCIOS_COLEGIO',0)
    SELF.AddKey(PAD1:FK_SOCIOS_INSTITUCION,'PAD1:FK_SOCIOS_INSTITUCION',0)
    SELF.AddKey(PAD1:FK_SOCIOS_LOCALIDAD,'PAD1:FK_SOCIOS_LOCALIDAD',0)
    SELF.AddKey(PAD1:FK_SOCIOS_TIPO_DOC,'PAD1:FK_SOCIOS_TIPO_DOC',0)
    SELF.AddKey(PAD1:IDX_SOCIOS_ACTA,'PAD1:IDX_SOCIOS_ACTA',0)
    SELF.AddKey(PAD1:IDX_SOCIOS_BAJA,'PAD1:IDX_SOCIOS_BAJA',0)
    SELF.AddKey(PAD1:IDX_SOCIOS_LIBRO,'PAD1:IDX_SOCIOS_LIBRO',0)
    SELF.AddKey(PAD1:IDX_SOCIOS_NOMBRE,'PAD1:IDX_SOCIOS_NOMBRE',0)
    SELF.AddKey(PAD1:FK_MINISTERIO,'PAD1:FK_MINISTERIO',0)
    SELF.AddKey(PAD1:FK_CENTRO_SALUD,'PAD1:FK_CENTRO_SALUD',0)
    SELF.AddKey(PAD1:FK_TITULO,'PAD1:FK_TITULO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PADRON.Kill PROCEDURE

  CODE
  _Hide:Access:PADRON.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:PADRON &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PADRON)                             ! destroy the file manager


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


Hide:Relate:TIPO_TITULO.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_TITULO.Init
  SELF.Init(Access:TIPO_TITULO,1)


Hide:Access:TIPO_TITULO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIP6:Record
  SELF.FileNameValue = 'TIPO_TITULO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_TITULO
  PARENT.Init
  Access:TIPO_TITULO &= SELF


Hide:Access:TIPO_TITULO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_TITULO &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:TIPO_TITULO.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_TITULO.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_TITULO &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_TITULO)                        ! destroy the file manager


Hide:Relate:TIPO_IVA.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_IVA.Init
  SELF.Init(Access:TIPO_IVA,1)


Hide:Access:TIPO_IVA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIP7:Record
  SELF.FileNameValue = 'TIPO_IVA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_IVA
  PARENT.Init
  Access:TIPO_IVA &= SELF


Hide:Access:TIPO_IVA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_IVA &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:TIPO_IVA.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_IVA.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_IVA &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_IVA)                           ! destroy the file manager


Hide:Relate:BANCO.Init PROCEDURE()
  CODE
  _Hide:Access:BANCO.Init
  SELF.Init(Access:BANCO,1)


Hide:Access:BANCO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= BAN2:Record
  SELF.FileNameValue = 'BANCO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= BANCO
  PARENT.Init
  Access:BANCO &= SELF


Hide:Access:BANCO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:BANCO &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:BANCO.Kill PROCEDURE

  CODE
  _Hide:Access:BANCO.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:BANCO &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:BANCO)                              ! destroy the file manager


Hide:Relate:BANCO_COD_REG.Init PROCEDURE()
  CODE
  _Hide:Access:BANCO_COD_REG.Init
  SELF.Init(Access:BANCO_COD_REG,1)


Hide:Access:BANCO_COD_REG.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= BAN3:Record
  SELF.FileNameValue = 'BANCO_COD_REG'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= BANCO_COD_REG
  PARENT.Init
  Access:BANCO_COD_REG &= SELF


Hide:Access:BANCO_COD_REG.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:BANCO_COD_REG &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:BANCO_COD_REG.Kill PROCEDURE

  CODE
  _Hide:Access:BANCO_COD_REG.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:BANCO_COD_REG &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:BANCO_COD_REG)                      ! destroy the file manager


Hide:Relate:MATRICULADOS.Init PROCEDURE()
  CODE
  _Hide:Access:MATRICULADOS.Init
  SELF.Init(Access:MATRICULADOS,1)


Hide:Access:MATRICULADOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MAT:Record
  SELF.FileNameValue = 'MATRICULADOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= MATRICULADOS
  PARENT.Init
  Access:MATRICULADOS &= SELF


Hide:Access:MATRICULADOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:MATRICULADOS &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:MATRICULADOS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(MATRICULADOS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:MATRICULADOS.Kill PROCEDURE

  CODE
  _Hide:Access:MATRICULADOS.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:MATRICULADOS &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:MATRICULADOS)                       ! destroy the file manager

