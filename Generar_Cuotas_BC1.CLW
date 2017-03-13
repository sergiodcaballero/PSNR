  MEMBER('Generar_Cuotas.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
Generar_Cuotas_BC1:DctInit    PROCEDURE()
Generar_Cuotas_BC1:DctKill    PROCEDURE()
Generar_Cuotas_BC1:FilesInit  PROCEDURE()
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


_Hide:Access:ZONA_VIVIENDA &Hide:Access:ZONA_VIVIENDA,AUTO,THREAD
_Hide:Relate:ZONA_VIVIENDA &Hide:Relate:ZONA_VIVIENDA,AUTO,THREAD
_Hide:Access:NIVEL_FORMACION &Hide:Access:NIVEL_FORMACION,AUTO,THREAD
_Hide:Relate:NIVEL_FORMACION &Hide:Relate:NIVEL_FORMACION,AUTO,THREAD
_Hide:Access:TIPO_TITULO &Hide:Access:TIPO_TITULO,AUTO,THREAD
_Hide:Relate:TIPO_TITULO &Hide:Relate:TIPO_TITULO,AUTO,THREAD
_Hide:Access:BANCO   &Hide:Access:BANCO,AUTO,THREAD
_Hide:Relate:BANCO   &Hide:Relate:BANCO,AUTO,THREAD
_Hide:Access:BANCO_COD_REG &Hide:Access:BANCO_COD_REG,AUTO,THREAD
_Hide:Relate:BANCO_COD_REG &Hide:Relate:BANCO_COD_REG,AUTO,THREAD


Generar_Cuotas_BC1:DctInit PROCEDURE()
  CODE
  _Hide:Access:ZONA_VIVIENDA &= NEW(Hide:Access:ZONA_VIVIENDA)
  _Hide:Relate:ZONA_VIVIENDA &= NEW(Hide:Relate:ZONA_VIVIENDA)
  _Hide:Access:NIVEL_FORMACION &= NEW(Hide:Access:NIVEL_FORMACION)
  _Hide:Relate:NIVEL_FORMACION &= NEW(Hide:Relate:NIVEL_FORMACION)
  _Hide:Access:TIPO_TITULO &= NEW(Hide:Access:TIPO_TITULO)
  _Hide:Relate:TIPO_TITULO &= NEW(Hide:Relate:TIPO_TITULO)
  _Hide:Access:BANCO &= NEW(Hide:Access:BANCO)
  _Hide:Relate:BANCO &= NEW(Hide:Relate:BANCO)
  _Hide:Access:BANCO_COD_REG &= NEW(Hide:Access:BANCO_COD_REG)
  _Hide:Relate:BANCO_COD_REG &= NEW(Hide:Relate:BANCO_COD_REG)
  Relate:ZONA_VIVIENDA &= _Hide:Relate:ZONA_VIVIENDA
  Relate:NIVEL_FORMACION &= _Hide:Relate:NIVEL_FORMACION
  Relate:TIPO_TITULO &= _Hide:Relate:TIPO_TITULO
  Relate:BANCO &= _Hide:Relate:BANCO
  Relate:BANCO_COD_REG &= _Hide:Relate:BANCO_COD_REG


Generar_Cuotas_BC1:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:ZONA_VIVIENDA.Init
  _Hide:Relate:NIVEL_FORMACION.Init
  _Hide:Relate:TIPO_TITULO.Init
  _Hide:Relate:BANCO.Init
  _Hide:Relate:BANCO_COD_REG.Init


Generar_Cuotas_BC1:DctKill PROCEDURE()
  CODE
  _Hide:Relate:ZONA_VIVIENDA.Kill
  DISPOSE(_Hide:Relate:ZONA_VIVIENDA)
  _Hide:Relate:NIVEL_FORMACION.Kill
  DISPOSE(_Hide:Relate:NIVEL_FORMACION)
  _Hide:Relate:TIPO_TITULO.Kill
  DISPOSE(_Hide:Relate:TIPO_TITULO)
  _Hide:Relate:BANCO.Kill
  DISPOSE(_Hide:Relate:BANCO)
  _Hide:Relate:BANCO_COD_REG.Kill
  DISPOSE(_Hide:Relate:BANCO_COD_REG)


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

