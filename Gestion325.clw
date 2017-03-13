

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION325.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! Process the FACTURA File
!!! </summary>
CANCELAR_CUOTA PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(FACTURA)
                     END
ProgressWindow       WINDOW('Proceso de FACTURA'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(82,42,58,15),USE(?Progress:Cancel),LEFT,ICON('cancelar.ICO'),FLAT,MSG('Cancelar'), |
  TIP('Cancelar')
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeNoRecords          PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('CANCELAR_CUOTA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:CANCELA_CUOTA',GLO:CANCELA_CUOTA)              ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA_CONVENIO.Open                             ! File FACTURA_CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CANCELAR_CUOTA',ProgressWindow)            ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:FACTURA, ?Progress:PctText, Progress:Thermometer, ProgressMgr, FAC:IDSOCIO)
  ThisProcess.AddSortOrder(FAC:FK_FACTURA_SOCIO)
  ThisProcess.AddRange(FAC:IDSOCIO,GLO:IDSOCIO)
  ThisProcess.SetFilter('FAC:ESTADO = '''' AND GLO:CANCELA_CUOTA = ''SI''')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  SELF.SetUseMRP(False)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(FACTURA,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FACTURA.Close
    Relate:FACTURA_CONVENIO.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('CANCELAR_CUOTA',ProgressWindow)         ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeNoRecords PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    RETURN
  
  !!! Evolution Consulting FREE Templates End!!!
  
  
  
  PARENT.TakeNoRecords


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  !!! CAMBIO EL ESTADO DE LA FACTURA
  FAC:ESTADO = 'CONVENIO'
  PUT (FACTURA)
  !! CARGA CONVENIO POR CUOTA
  FACXCONV:IDFACTURA  =  FAC:IDFACTURA
  FACXCONV:IDCONVENIO =  GLO:IDSOLICITUD
  ACCESS:FACTURA_CONVENIO.INSERT()
  
  !!! BAJO LA CANTIDAD DE CUOTAS
  SOC:IDSOCIO = FAC:IDSOCIO
  GET (SOCIOS,SOC:PK_SOCIOS)
  IF ERRORCODE() = 35 THEN
      MESSAGE ('NO ENCONTRO SOCIO')
  ELSE
      SOC:CANTIDAD = SOC:CANTIDAD - 1
      PUT(SOCIOS)
      !! CARGA TABLA CONVEBIO_CUOTA
    
   END
  
  
  
  
  
  
  
  
  PUT(Process:View)
  IF ERRORCODE()
    GlobalErrors.ThrowFile(Msg:PutFailed,'Process:View')
    ThisWindow.Response = RequestCompleted
    ReturnValue = Level:Fatal
  END
  RETURN ReturnValue

