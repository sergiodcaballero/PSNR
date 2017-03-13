

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION222.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
IMPORTAR_INGRESOS PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(EXP_INGRESOS)
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
  GlobalErrors.SetProcedureName('IMPORTAR_INGRESOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:EXP_INGRESOS.Open                                 ! File EXP_INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPORTAR_INGRESOS',ProgressWindow)         ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:EXP_INGRESOS, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(EXP_INGRESOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CAJA.Close
    Relate:EXP_INGRESOS.Close
    Relate:FONDOS.Close
    Relate:INGRESOS.Close
    Relate:LIBDIARIO.Close
    Relate:RANKING.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPORTAR_INGRESOS',ProgressWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  ING:SUCURSAL   = ING1:SUCURSAL
  ING:IDRECIBO   = ING1:IDRECIBO
  GET (INGRESOS,ING:IDX_INGRESOS_UNIQUE)
  IF ERRORCODE() = 35 THEN
      ING:IDUSUARIO          =  ING1:IDUSUARIO
      ING:IDSUBCUENTA        =  ING1:IDSUBCUENTA
      ING:OBSERVACION        =  ING1:OBSERVACION
      ING:MONTO              =  ING1:MONTO
      ING:FECHA              =  ING1:FECHA
      ING:HORA               =  ING1:HORA
      ING:MES                =  ING1:MES
      ING:ANO                =  ING1:ANO
      ING:PERIODO            =  ING1:PERIODO
      ING:IDPROVEEDOR        =  ING1:IDPROVEEDOR
      ING:SUCURSAL           =  ING1:SUCURSAL
      ING:IDRECIBO           =  ING1:IDRECIBO
      !!! CARGA
      RANKING{PROP:SQL} = 'DELETE FROM RANKING'
      RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
      NEXT(RANKING)
      ING:IDINGRESO = RAN:C1
      !MESSAGE(ING:IDINGRESO)
      ACCESS:INGRESOS.INSERT()
  
      !!! CARGO LIBRO DIARIA
      LIB:IDSUBCUENTA = ING1:IDSUBCUENTA
      LIB:DEBE = ING1:MONTO
      LIB:HABER = 0
      LIB:OBSERVACION = ING1:OBSERVACION
      LIB:FECHA = ING1:FECHA
      LIB:HORA = ING1:HORA
      LIB:MES       =  MONTH(ING1:FECHA)
      LIB:ANO       =  YEAR(ING1:FECHA)
      LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
      !! BUSCA FONDOS..   Y ACTUALIZA YA QUE ESTAMOS
      SUB:IDSUBCUENTA = ING1:IDSUBCUENTA
      ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
      FON:IDFONDO = SUB:IDFONDO
      CAJA# =   SUB:IDFONDO
      ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
      FON:MONTO = FON:MONTO + ING1:MONTO
      FONDO$ = FON:MONTO 
      FON:FECHA = TODAY()
      FON:HORA = CLOCK()
      ACCESS:FONDOS.UPDATE()
              
      LIB:FONDO = FON:MONTO + ING1:MONTO
      !!! DISPARA STORE PROCEDURE
      RANKING{PROP:SQL} = 'DELETE FROM RANKING'
      RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
      NEXT(RANKING)
      LIB:IDLIBDIARIO = RAN:C1
      !!!!!!!!!!!
      ACCESS:LIBDIARIO.INSERT()
  
      !! CARGO CAJA
  
      IF  CAJA# = 1 THEN
          CAJ:IDSUBCUENTA = ING1:IDSUBCUENTA
          CAJ:IDUSUARIO = ING1:IDUSUARIO
          CAJ:DEBE  =  ING1:MONTO
          CAJ:HABER = 0
          CAJ:OBSERVACION = ING1:OBSERVACION
          CAJ:FECHA = ING1:FECHA
          CAJ:MES       =  MONTH(ING1:FECHA)
          CAJ:ANO       =  YEAR(ING1:HORA)
          CAJ:PERIODO   =  CAJ:ANO&(FORMAT(CAJ:MES,@N02))
          CAJ:SUCURSAL  =  ING1:SUCURSAL
          CAJ:RECIBO  =  ING1:IDRECIBO
          CAJ:MONTO =  FONDO$
          !!! DISPARA STORE PROCEDURE
          RANKING{PROP:SQL} = 'CALL SP_GEN_CAJA_ID'
          NEXT(RANKING)
          CAJ:IDCAJA = RAN:C1
          ACCESS:CAJA.INSERT()
     END
  END
  
  
  
  RETURN ReturnValue

