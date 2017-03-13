

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION223.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION222.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
IMPORTAR_INSCRIPCION_DETALLE PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(EXP_CURSO_INSCRIPCION_DETALLE)
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
  GlobalErrors.SetProcedureName('IMPORTAR_INSCRIPCION_DETALLE')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CURSO_INSCRIPCION_DETALLE.SetOpenRelated()
  Relate:CURSO_INSCRIPCION_DETALLE.Open                    ! File CURSO_INSCRIPCION_DETALLE used by this procedure, so make sure it's RelationManager is open
  Relate:EXP_CURSO_INSCRIPCION_DETALLE.Open                ! File EXP_CURSO_INSCRIPCION_DETALLE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPORTAR_INSCRIPCION_DETALLE',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:EXP_CURSO_INSCRIPCION_DETALLE, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(EXP_CURSO_INSCRIPCION_DETALLE,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CURSO_INSCRIPCION_DETALLE.Close
    Relate:EXP_CURSO_INSCRIPCION_DETALLE.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPORTAR_INSCRIPCION_DETALLE',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  IMPORTAR_INGRESOS()
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  CURD:IDINSCRIPCION   = CURD1:IDINSCRIPCION
  CURD:IDCURSO         = CURD1:IDCURSO
  CURD:ID_MODULO       = CURD1:ID_MODULO
  GET(CURSO_INSCRIPCION_DETALLE,CURD:PK_CURSO_INSCRIPCION_DETALLE)
  IF ERRORCODE() = 35 THEN
      CURD:IDINSCRIPCION          =    CURD1:IDINSCRIPCION
      CURD:IDCURSO                =    CURD1:IDCURSO
      CURD:ID_MODULO              =    CURD1:ID_MODULO
      CURD:FECHA_INSCRIPCION      =    CURD1:FECHA_INSCRIPCION
      CURD:PRESENTE               =    CURD1:PRESENTE
      CURD:NOTA                   =    CURD1:NOTA
      CURD:MONTO                  =    CURD1:MONTO
      CURD:PAGADO                 =    CURD1:PAGADO
      CURD:FECHA_PAGO             =    CURD1:FECHA_PAGO
      CURD:HORA_PAGO              =    CURD1:HORA_PAGO
      CURD:USUARIO_PAGO           =    CURD1:USUARIO_PAGO
      CURD:IDSUBCUENTA            =    CURD1:IDSUBCUENTA
      CURD:DESCUENTO              =    CURD1:DESCUENTO
      CURD:SUCURSAL               =    CURD1:SUCURSAL
      CURD:IDRECIBO               =    CURD1:IDRECIBO
      ACCESS:CURSO_INSCRIPCION_DETALLE.INSERT()
   ELSE
      CURD:PRESENTE               =    CURD1:PRESENTE
      CURD:NOTA                   =    CURD1:NOTA
      CURD:MONTO                  =    CURD1:MONTO
      CURD:PAGADO                 =    CURD1:PAGADO
      CURD:FECHA_PAGO             =    CURD1:FECHA_PAGO
      CURD:HORA_PAGO              =    CURD1:HORA_PAGO
      CURD:USUARIO_PAGO           =    CURD1:USUARIO_PAGO
      CURD:IDSUBCUENTA            =    CURD1:IDSUBCUENTA
      CURD:DESCUENTO              =    CURD1:DESCUENTO
      CURD:SUCURSAL               =    CURD1:SUCURSAL
      CURD:IDRECIBO               =    CURD1:IDRECIBO
      ACCESS:CURSO_INSCRIPCION_DETALLE.UPDATE()
  END
  
  RETURN ReturnValue

