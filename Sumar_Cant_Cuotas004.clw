

   MEMBER('Sumar_Cant_Cuotas.clw')                         ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('SUMAR_CANT_CUOTAS004.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
CARGAR_INGRESOS PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(PAGOS)
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
TakeNoRecords          PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('CARGAR_INGRESOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:PAGOS.Open                                        ! File PAGOS used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  
  !!! Evolution Consulting FREE Templates Start!!!
    STREAM(PAGOS)
    STREAM(SOCIOS)
    STREAM(RANKING)
    STREAM(SUBCUENTAS)
    STREAM(INGRESOS)
  
  !!! Evolution Consulting FREE Templates End!!!
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CARGAR_INGRESOS',ProgressWindow)           ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:PAGOS, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(PAGOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  
  !!! Evolution Consulting FREE Templates Start!!!
    FLUSH(PAGOS)
    FLUSH(SOCIOS)
    FLUSH(RANKING)
    FLUSH(SUBCUENTAS)
    FLUSH(INGRESOS)
  
  !!! Evolution Consulting FREE Templates End!!!
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:INGRESOS.Close
    Relate:PAGOS.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('CARGAR_INGRESOS',ProgressWindow)        ! Save window data to non-volatile store
  END
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
  ING:SUCURSAL  = PAG:SUCURSAL
  ING:IDRECIBO    = PAG:IDRECIBO
  GET (INGRESOS,ING:IDX_INGRESOS_UNIQUE)
  IF ERRORCODE() = 35 THEN
      ING:IDUSUARIO          =   1
      ING:MONTO               =   PAG:MONTO
      SOC:IDSOCIO = PAG:IDSOCIO
      ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
      ING:OBSERVACION         =  ('PAGO CUOTA COLEGIADO '&SOC:NOMBRE)
      ING:IDPROVEEDOR         =  SOC:IDPROVEEDOR
      ING:FECHA              =   PAG:FECHA
      ING:HORA                =   PAG:HORA
      ING:MES                  =   PAG:MES
      ING:ANO                  =   PAG:ANO
      ING:PERIODO            =   PAG:PERIODO
      ING:IDSUBCUENTA          = 1
      !!! DISPARA STORE PROCEDURE
      RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
      NEXT(RANKING)
      ING:IDINGRESO = RAN:C1
      !!!!!!!!!!!
      ACCESS:INGRESOS.INSERT()
  ELSE
      !MESSAGE('ENCONTRO--> PAG RECIBO:'&PAG:IDRECIBO&', LIB:RECIBO:'&LIB:RECIBO)
  
  
  
  END
  RETURN ReturnValue

