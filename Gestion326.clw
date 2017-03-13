

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION326.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! Process the FACTURA File
!!! </summary>
CALCULAR_CUOTA PROCEDURE 

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
  GlobalErrors.SetProcedureName('CALCULAR_CUOTA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:CALCULA_DEUDA',GLO:CALCULA_DEUDA)              ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CALCULAR_CUOTA',ProgressWindow)            ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:FACTURA, ?Progress:PctText, Progress:Thermometer, ProgressMgr, FAC:IDSOCIO)
  ThisProcess.AddSortOrder(FAC:FK_FACTURA_SOCIO)
  ThisProcess.AddRange(FAC:IDSOCIO,GLO:IDSOCIO)
  ThisProcess.SetFilter('FAC:ESTADO = '''' AND GLO:CALCULA_DEUDA = ''SI''')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
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
  END
  IF SELF.Opened
    INIMgr.Update('CALCULAR_CUOTA',ProgressWindow)         ! Save window data to non-volatile store
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
  !!! SACO PERIODO MENOS A 3 MESES
  FECHA# = DATE(MONTH(TODAY()),1,YEAR(TODAY()))
  FECHA# = FECHA# - 120
  MES# = MONTH (FECHA#)
  ANO# = YEAR(FECHA#)
  PERIODO$  = FORMAT(ANO#,@N04)&FORMAT(MES#,@N02)
  
  
  IF FAC:PERIODO > PERIODO$ THEN
      GLO:TOTAL = GLO:TOTAL + (FAC:TOTAL  - FAC:DESCUENTOCOBERTURA)
  ELSE
      GLO:TOTAL = GLO:TOTAL + FAC:TOTAL
  END
  
  
  
  
  
  RETURN ReturnValue

