

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION118.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION117.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
LIQUIDACION_PRESENTACION_1 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(LIQUIDACION)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,IMM,MDI,SYSTEM,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager

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
  GlobalErrors.SetProcedureName('LIQUIDACION_PRESENTACION_1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo:IDOS',Glo:IDOS)                                ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOSXOS.Open                                    ! File SOCIOSXOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('LIQUIDACION_PRESENTACION_1',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:LIQUIDACION, ?Progress:PctText, Progress:Thermometer, ProgressMgr, LIQ:PERIODO)
  ThisProcess.AddSortOrder(LIQ:IDX_LIQUIDACION_PERIODO)
  ThisProcess.AddRange(LIQ:PERIODO,GLO:PERIODO)
  ThisProcess.SetFilter('LIQ:IDOS = Glo:IDOS  AND LIQ:PRESENTADO = ''NO''')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  SELF.SetUseMRP(False)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(LIQUIDACION,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LIQUIDACION.Close
    Relate:LOCALIDAD.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
    Relate:SOCIOSXOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('LIQUIDACION_PRESENTACION_1',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  LIQUIDACION_PRESENTACION_2()
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  !!! MODIFICO EL ESTADO EN LIQUIDACION
  LIQ:PRESENTADO = 'SI'
  PUT(LIQUIDACION)
  
  !! CARGO LA LIQUIDACION AL RANKING
  !! busco socio
  SOC:IDSOCIO = LIQ:IDSOCIO
  ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
  RAN:C1           = SOC:MATRICULA
  RAN:C2           = SOC:NOMBRE
  RAN:C3           = SOC:CUIT
  RAN:C4           = SOC:CBU
  !!!!!
  RAN:IMPORTE      = LIQ:MONTO
  RAN:C5           = FORMAT(LIQ:FECHA_PRESENTACION,@D6)
  RAN:C6           = LIQ:MES
  RAN:C7           = LIQ:ANO
  RAN:CANTIDAD = LIQ:CANTIDAD
  !! BUSCO EL ID DEL SOCIO EN LA OS
  SOC3:IDSOCIOS    = LIQ:IDSOCIO
  SOC3:IDOS        = LIQ:IDOS
  ACCESS:SOCIOSXOS.TRYFETCH(SOC3:FK_SOCIOSXOS_OS)
  RAN:C8           = SOC3:NUMERO
  LOC:IDLOCALIDAD = SOC:IDLOCALIDAD
  ACCESS:LOCALIDAD.TRYFETCH(LOC:PK_LOCALIDAD)
  RAN:C10 = LOC:DESCRIPCION
  !!!
  RAN:C9         =  GLO:FECHA_LARGO
  ACCESS:RANKING.INSERT()
  
  PUT(Process:View)
  IF ERRORCODE()
    GlobalErrors.ThrowFile(Msg:PutFailed,'Process:View')
    ThisWindow.Response = RequestCompleted
    ReturnValue = Level:Fatal
  END
  RETURN ReturnValue

