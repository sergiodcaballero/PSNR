

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION042.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
EXPORT_ESPECIALIDAD_MINISTERIO PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
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
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('EXPORT_ESPECIALIDAD_MINISTERIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:ESPECIALIDAD.Open                                 ! File ESPECIALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:MINESP.Open                                       ! File MINESP used by this procedure, so make sure it's RelationManager is open
  Relate:PADRONXESPECIALIDAD.Open                          ! File PADRONXESPECIALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('EXPORT_ESPECIALIDAD_MINISTERIO',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:MATRICULA)
  ThisProcess.AddSortOrder(SOC:IDX_SOCIOS_MATRICULA)
  ThisProcess.SetFilter('SOC:BAJA = ''NO''  AND SOC:BAJA_TEMPORARIA = ''NO''')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SOCIOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  MESP:NRO = '1'
  MESP:COLEGIO = 'PSICOLOGOS'
  ADD(MINESP)
  IF ERRORCODE() = 35 THEN MESSAGE(ERROR()).
  GLO:NRO_CUOTA = 0
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ESPECIALIDAD.Close
    Relate:MINESP.Close
    Relate:PADRONXESPECIALIDAD.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('EXPORT_ESPECIALIDAD_MINISTERIO',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  MESP:NRO  =  '3'
  MESP:COLEGIO =  'PSICOLOGOS'
  MESP:IDSOCIO =  GLO:NRO_CUOTA
  
  MESP:NOMBRE  = ''
  MESP:IDESPECIALIDAD = ''
  MESP:ESPECIALIDAD   = ''
  MESP:FECHA_INICIO  =  ''
  ADD(MINESP)
  IF ERRORCODE() = 35 THEN MESSAGE(ERROR()).
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  MESP:NRO = '5'
  MESP:COLEGIO                = 'PSIOCOLOGOS'
  MESP:IDSOCIO                = SOC:MATRICULA
  MESP:NOMBRE                 = SOC:NOMBRE
  !!!!!!!!BUSCA PADRON POR ESPECIALIDAD
  PAD:IDSOCIO =   SOC:IDSOCIO
  SET(PAD:FK_PADRONXESPECIALIDAD_SOCI,PAD:FK_PADRONXESPECIALIDAD_SOCI)
  LOOP
      IF ACCESS:PADRONXESPECIALIDAD.NEXT() THEN BREAK.
      IF PAD:IDSOCIO <>  SOC:IDSOCIO  THEN BREAK.
      ESP:IDESPECIALIDAD = PAD:IDESPECIALIDAD
      ACCESS:ESPECIALIDAD.TRYFETCH(ESP:PK_ESPECIALIDAD)
      MESP:IDESPECIALIDAD         = ESP:IDESPECIALIDAD
      MESP:ESPECIALIDAD           = ESP:DESCRIPCION
      !MESP:FECHA_INICIO           =
      ADD(MINESP)
      IF ERRORCODE() = 35 THEN MESSAGE(ERROR()).
      GLO:NRO_CUOTA = GLO:NRO_CUOTA + 1
  END
  
  RETURN ReturnValue

