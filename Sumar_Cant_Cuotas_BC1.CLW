  MEMBER('Sumar_Cant_Cuotas.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
Sumar_Cant_Cuotas_BC1:DctInit    PROCEDURE()
Sumar_Cant_Cuotas_BC1:DctKill    PROCEDURE()
Sumar_Cant_Cuotas_BC1:FilesInit  PROCEDURE()
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

Hide:Access:PROVEEDORES CLASS(FileManager),TYPE            ! FileManager for PROVEEDORES
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:PROVEEDORES CLASS(RelationManager),TYPE        ! RelationManager for PROVEEDORES
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

Hide:Access:TIPO_PROVEEDOR CLASS(FileManager),TYPE         ! FileManager for TIPO_PROVEEDOR
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_PROVEEDOR CLASS(RelationManager),TYPE     ! RelationManager for TIPO_PROVEEDOR
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


_Hide:Access:TIPO_TITULO &Hide:Access:TIPO_TITULO,AUTO,THREAD
_Hide:Relate:TIPO_TITULO &Hide:Relate:TIPO_TITULO,AUTO,THREAD
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


Sumar_Cant_Cuotas_BC1:DctInit PROCEDURE()
  CODE
  _Hide:Access:TIPO_TITULO &= NEW(Hide:Access:TIPO_TITULO)
  _Hide:Relate:TIPO_TITULO &= NEW(Hide:Relate:TIPO_TITULO)
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
  Relate:TIPO_TITULO &= _Hide:Relate:TIPO_TITULO
  Relate:PROVEEDORES &= _Hide:Relate:PROVEEDORES
  Relate:TIPO_IVA &= _Hide:Relate:TIPO_IVA
  Relate:TIPO_PROVEEDOR &= _Hide:Relate:TIPO_PROVEEDOR
  Relate:BANCO &= _Hide:Relate:BANCO
  Relate:BANCO_COD_REG &= _Hide:Relate:BANCO_COD_REG


Sumar_Cant_Cuotas_BC1:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:TIPO_TITULO.Init
  _Hide:Relate:PROVEEDORES.Init
  _Hide:Relate:TIPO_IVA.Init
  _Hide:Relate:TIPO_PROVEEDOR.Init
  _Hide:Relate:BANCO.Init
  _Hide:Relate:BANCO_COD_REG.Init


Sumar_Cant_Cuotas_BC1:DctKill PROCEDURE()
  CODE
  _Hide:Relate:TIPO_TITULO.Kill
  DISPOSE(_Hide:Relate:TIPO_TITULO)
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


Hide:Relate:PROVEEDORES.Init PROCEDURE()
  CODE
  _Hide:Access:PROVEEDORES.Init
  SELF.Init(Access:PROVEEDORES,1)


Hide:Access:PROVEEDORES.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PRO2:Record
  SELF.FileNameValue = 'PROVEEDORES'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PROVEEDORES
  PARENT.Init
  Access:PROVEEDORES &= SELF


Hide:Access:PROVEEDORES.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PROVEEDORES &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


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

  SELF.AddRelation(Relate:INGRESOS,RI:None,RI:None,ING:FK_INGRESOS_PROVEEDOR)
  SELF.AddRelationLink(PRO2:IDPROVEEDOR,ING:IDPROVEEDOR)

  SELF.AddRelation(Relate:TIPO_IVA)

  SELF.AddRelation(Relate:TIPO_PROVEEDOR)

  SELF.AddRelation(Relate:SOCIOS)


Hide:Relate:PROVEEDORES.Kill PROCEDURE

  CODE
  _Hide:Access:PROVEEDORES.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:PROVEEDORES &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PROVEEDORES)                        ! destroy the file manager


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

  SELF.AddRelation(Relate:PROVEEDORES,RI:None,RI:None,PRO2:FK_PROVEEDORES_TIPOIVA)
  SELF.AddRelationLink(TIP7:IDTIPOIVA,PRO2:IDTIPOIVA)


Hide:Relate:TIPO_IVA.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_IVA.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_IVA &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_IVA)                           ! destroy the file manager


Hide:Relate:TIPO_PROVEEDOR.Init PROCEDURE()
  CODE
  _Hide:Access:TIPO_PROVEEDOR.Init
  SELF.Init(Access:TIPO_PROVEEDOR,1)


Hide:Access:TIPO_PROVEEDOR.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIPP:Record
  SELF.FileNameValue = 'TIPO_PROVEEDOR'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_PROVEEDOR
  PARENT.Init
  Access:TIPO_PROVEEDOR &= SELF


Hide:Access:TIPO_PROVEEDOR.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_PROVEEDOR &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


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


Hide:Relate:TIPO_PROVEEDOR.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_PROVEEDOR.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_PROVEEDOR &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_PROVEEDOR)                     ! destroy the file manager


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

