  MEMBER('TRANS_NOMBRE.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
TRANS_NOMBRE_BC0:DctInit    PROCEDURE()
TRANS_NOMBRE_BC0:DctKill    PROCEDURE()
TRANS_NOMBRE_BC0:FilesInit  PROCEDURE()
  END

Hide:Access:SOCIOS   CLASS(FileManager),TYPE               ! FileManager for SOCIOS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SOCIOS   CLASS(RelationManager),TYPE           ! RelationManager for SOCIOS
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:SOCIOS  &Hide:Access:SOCIOS,AUTO,THREAD
_Hide:Relate:SOCIOS  &Hide:Relate:SOCIOS,AUTO,THREAD


TRANS_NOMBRE_BC0:DctInit PROCEDURE()
  CODE
  _Hide:Access:SOCIOS &= NEW(Hide:Access:SOCIOS)
  _Hide:Relate:SOCIOS &= NEW(Hide:Relate:SOCIOS)
  Relate:SOCIOS &= _Hide:Relate:SOCIOS


TRANS_NOMBRE_BC0:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:SOCIOS.Init


TRANS_NOMBRE_BC0:DctKill PROCEDURE()
  CODE
  _Hide:Relate:SOCIOS.Kill
  DISPOSE(_Hide:Relate:SOCIOS)


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
    SELF.AddKey(SOC:IDX_SOCIOS_DOCUMENTO,'SOC:IDX_SOCIOS_DOCUMENTO',0)
    SELF.AddKey(SOC:IDX_SOCIOS_MATRICULA,'SOC:IDX_SOCIOS_MATRICULA',0)
    SELF.AddKey(SOC:PK_SOCIOS,'SOC:PK_SOCIOS',0)
    SELF.AddKey(SOC:IDX_SOCIOS_ACTA,'SOC:IDX_SOCIOS_ACTA',0)
    SELF.AddKey(SOC:IDX_SOCIOS_BAJA,'SOC:IDX_SOCIOS_BAJA',0)
    SELF.AddKey(SOC:IDX_SOCIOS_LIBRO,'SOC:IDX_SOCIOS_LIBRO',0)
    SELF.AddKey(SOC:IDX_SOCIOS_NOMBRE,'SOC:IDX_SOCIOS_NOMBRE',0)
    SELF.AddKey(SOC:IDX_SOCIOS_N_VIEJO,'SOC:IDX_SOCIOS_N_VIEJO',0)
    SELF.AddKey(SOC:IDX_SOCIOS_PROVEEDOR,'SOC:IDX_SOCIOS_PROVEEDOR',0)
    SELF.AddKey(SOC:IDX_SOCIOS_PROVISORIO,'SOC:IDX_SOCIOS_PROVISORIO',0)
    SELF.AddKey(SOC:IDX_SOCIO_INGRESO,'SOC:IDX_SOCIO_INGRESO',0)
    SELF.AddKey(SOC:FK_SOCIOS_CIRCULO,'SOC:FK_SOCIOS_CIRCULO',0)
    SELF.AddKey(SOC:FK_SOCIOS_COBERTURA,'SOC:FK_SOCIOS_COBERTURA',0)
    SELF.AddKey(SOC:FK_SOCIOS_INSTITUCION,'SOC:FK_SOCIOS_INSTITUCION',0)
    SELF.AddKey(SOC:FK_SOCIOS_LOCALIDAD,'SOC:FK_SOCIOS_LOCALIDAD',0)
    SELF.AddKey(SOC:FK_SOCIOS_TIPO_DOC,'SOC:FK_SOCIOS_TIPO_DOC',0)
    SELF.AddKey(SOC:FK_SOCIOS_TIPO_IVA,'SOC:FK_SOCIOS_TIPO_IVA',0)
    SELF.AddKey(SOC:FK_SOCIOS_USUARIO,'SOC:FK_SOCIOS_USUARIO',0)
    SELF.AddKey(SOC:FK_SOCIOS_ZONA_VIVENDA,'SOC:FK_SOCIOS_ZONA_VIVENDA',0)
    SELF.AddKey(SOC:INTEG_173,'SOC:INTEG_173',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SOCIOS.Kill PROCEDURE

  CODE
  _Hide:Access:SOCIOS.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:SOCIOS &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SOCIOS)                             ! destroy the file manager

