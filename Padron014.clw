

   MEMBER('Padron.clw')                                    ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('PADRON014.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
padron PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(PADRON)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('padron')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:BANCO.Open                                        ! File BANCO used by this procedure, so make sure it's RelationManager is open
  Relate:CIRCULO.Open                                      ! File CIRCULO used by this procedure, so make sure it's RelationManager is open
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:INSTITUCION.Open                                  ! File INSTITUCION used by this procedure, so make sure it's RelationManager is open
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:PADRON.Open                                       ! File PADRON used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_DOC.Open                                     ! File TIPO_DOC used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_IVA.Open                                     ! File TIPO_IVA used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_TITULO.Open                                  ! File TIPO_TITULO used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  Relate:ZONA_VIVIENDA.Open                                ! File ZONA_VIVIENDA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('padron',ProgressWindow)                    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:PADRON, ?Progress:PctText, Progress:Thermometer, ProgressMgr, PAD1:IDSOCIO)
  ThisProcess.AddSortOrder(PAD1:PK_SOCIOS)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(PADRON,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:BANCO.Close
    Relate:CIRCULO.Close
    Relate:COBERTURA.Close
    Relate:INSTITUCION.Close
    Relate:LOCALIDAD.Close
    Relate:PADRON.Close
    Relate:SOCIOS.Close
    Relate:TIPO_DOC.Close
    Relate:TIPO_IVA.Close
    Relate:TIPO_TITULO.Close
    Relate:USUARIO.Close
    Relate:ZONA_VIVIENDA.Close
  END
  IF SELF.Opened
    INIMgr.Update('padron',ProgressWindow)                 ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  SOC:IDSOCIO      = PAD1:IDSOCIO
  SOC:MATRICULA    = clip(PAD1:MATRICULA)           
  SOC:IDZONA       = 1                        
  SOC:IDCOBERTURA  =   1                       
  SOC:IDLOCALIDAD  = PAD1:IDLOCALIDAD           
  SOC:IDUSUARIO    = 1                         
  SOC:NOMBRE       = upper(PAD1:NOMBRE)
  SOC:N_DOCUMENTO  = clip(PAD1:MATRICULA)       
  SOC:FECHA_ALTA   = today()
  SOC:FECHA_NACIMIENTO  = today()
  SOC:IDVENDEDOR        = 1
  SOC:MES               = MONTH(SOC:FECHA_ALTA)
  SOC:ANO               = YEAR(SOC:FECHA_ALTA)
  PREIODO$        = FORMAT(SOC:ANO,@N04)&FORMAT(SOC:MES,@N02)
  SOC:PERIODO_ALTA = PREIODO$
  SOC:BAJA         = 'NO'
  SOC:ID_TIPO_DOC  = 1
  SOC:IDCIRCULO    = 1                          !
  SOC:PROVISORIO   = 'SI'
  SOC:IDINSTITUCION   =   1
  SOC:FECHA_EGRESO    = SOC:FECHA_ALTA
  SOC:BAJA_TEMPORARIA = 'NO'
  SOC:IDTIPOTITULO    = 1
  SOC:IDMINISTERIO    = 1
  SOC:IDCS  = 1
  SOC:TIPOIVA = 1
  SOC:IDCS               = 1
  SOC:TIPO_TITULO = 'PROFESIONAL'
  SOC:IDBANCO = 1
  !message(PAD1:IDSOCIO&' '&PAD1:MATRICULA&' '&PAD1:IDLOCALIDAD&' '&PAD1:NOMBRE)
  !message (soc:IDSOCIO&' '&soc:MATRICULA&' '&soc:IDLOCALIDAD&' '&soc:NOMBRE)
  access:socios.insert()
  !ADD(SOCIOS)
  !IF ERRORCODE() THEN MESSAGE(ERROR()).
  
  
  RETURN ReturnValue

