

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION224.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION223.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
IMPORTAR_INSCRIPCION PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(EXP_CURSO_INSCRIPCION)
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

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('IMPORTAR_INSCRIPCION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CURSO_INSCRIPCION.Open                            ! File CURSO_INSCRIPCION used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_INSCRIPCION_DETALLE.SetOpenRelated()
  Relate:CURSO_INSCRIPCION_DETALLE.Open                    ! File CURSO_INSCRIPCION_DETALLE used by this procedure, so make sure it's RelationManager is open
  Relate:EXP_CURSO_INSCRIPCION.Open                        ! File EXP_CURSO_INSCRIPCION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPORTAR_INSCRIPCION',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:EXP_CURSO_INSCRIPCION, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(EXP_CURSO_INSCRIPCION,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CURSO_INSCRIPCION.Close
    Relate:CURSO_INSCRIPCION_DETALLE.Close
    Relate:EXP_CURSO_INSCRIPCION.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPORTAR_INSCRIPCION',ProgressWindow)   ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  IMPORTAR_INSCRIPCION_DETALLE()
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  CURI:ID_PROVEEDOR  =   CURI1:ID_PROVEEDOR
  CURI:IDCURSO       =   CURI1:IDCURSO
  get(CURSO_INSCRIPCION,CURI:IDX_CONTROL)
  IF ERRORCODE() = 35 THEN
      CURI:IDINSCRIPCION     =  CURI1:IDINSCRIPCION
      CURI:ID_PROVEEDOR      =  CURI1:ID_PROVEEDOR
      CURI:IDCURSO           =  CURI1:IDCURSO
      CURI:FECHA             =  CURI1:FECHA
      CURI:HORA              =  CURI1:HORA
      CURI:IDUSUARIO         =  CURI1:IDUSUARIO
      CURI:MONTO_TOTAL       =  CURI1:MONTO_TOTAL
      CURI:TERMINADO         =  CURI1:TERMINADO
      CURI:DESCUENTO         =  CURI1:DESCUENTO
      CURI:PAGADO_TOTAL      =  CURI1:PAGADO_TOTAL
      CURI:CUOTAS            =  CURI1:CUOTAS
      CURI:MONTO_CUOTA       =  CURI1:MONTO_CUOTA
      CURI:MONTO_CUOTA       =  CURI1:OBSERVACION
      ACCESS:CURSO_INSCRIPCION.INSERT()
  ELSE
      CURI:MONTO_TOTAL     =   CURI1:MONTO_TOTAL
      CURI:TERMINADO       =   CURI1:TERMINADO
      CURI:DESCUENTO       =   CURI1:DESCUENTO
      CURI:PAGADO_TOTAL    =   CURI1:PAGADO_TOTAL
      CURI:CUOTAS          =   CURI1:CUOTAS
      CURI:MONTO_CUOTA     =   CURI1:MONTO_CUOTA
      CURI:OBSERVACION     =   CURI1:OBSERVACION
      ACCESS:CURSO_INSCRIPCION.UPDATE()
  END
  RETURN ReturnValue

