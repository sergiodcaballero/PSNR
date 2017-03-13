

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION248.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
GENERAR_ARCHIVO_BEBITO PROCEDURE 

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
  GlobalErrors.SetProcedureName('GENERAR_ARCHIVO_BEBITO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:BANCO.Open                                        ! File BANCO used by this procedure, so make sure it's RelationManager is open
  Relate:BANCO_COD_REG.Open                                ! File BANCO_COD_REG used by this procedure, so make sure it's RelationManager is open
  Relate:BANCO_DEBITO.Open                                 ! File BANCO_DEBITO used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('GENERAR_ARCHIVO_BEBITO',ProgressWindow)    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisProcess.AddSortOrder(SOC:PK_SOCIOS)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SOCIOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:BANCO.Close
    Relate:BANCO_COD_REG.Close
    Relate:BANCO_DEBITO.Close
    Relate:FACTURA.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('GENERAR_ARCHIVO_BEBITO',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  if SOC:CBU <> '' then
      BAN:TRAFICO_INF         = 'EB'
      soc# = SOC:IDSOCIO
      BAN:CBU_B_4             = format(SOC:CBU,@N014)
      BAN:CUIT             = FORMAT(GLO:CUIT,@N011)
      !! BUSCA BANCO
      BAN2:IDBANCO = SOC:IDBANCO
      ACCESS:BANCO.TRYFETCH(BAN2:PK_BANCO)
      BAN:COD_BANCO           = FORMAT(BAN2:CODIGO_BANCO,@N03)
      BAN:CBU_B_1             = FORMAT(BAN2:CBU_BLOQUE_1,@N08)
      !! busca cod registro
      BAN3:ID_REGISTRO = BAN2:ID_REGISTRO
      ACCESS:BANCO_COD_REG.TRYFETCH(BAN3:PK_BANCO_COD_REG)
      BAN:COD_REGISTRO        = FORMAT(BAN3:COD_REGISTRO,@N02)
      !!!!!
      BAN:F_VENCIMIENTO       = FORMAT(FECHA_DESDE,@D11)
      BAN:EMPRESA             = FORMAT(BAN2:SUBEMPRESA,@N05)
      BAN:IDENTIFICADO        = UPPER(SOC:MATRICULA)
      BAN:MONEDA              = 'P'
      !! BUSCA IMPORTE
      FAC:IDSOCIO = soc#
      SET(FAC:FK_FACTURA_SOCIO,FAC:FK_FACTURA_SOCIO)
      LOOP
          IF ACCESS:FACTURA.NEXT() THEN BREAK.
          IF FAC:IDSOCIO <> soc# THEN BREAK.
          IF FAC:ESTADO = '' THEN
              BAN:IMPORTE             =  FORMAT(FAC:TOTAL,@N010v2)
              BAN:VENCIMIENTO         =  FAC:IDFACTURA
              BREAK
           END
      END
      !!!!!!!!!!!!!
      
      BAN:DESCRIPCION      = 'COL.PROF. '
      BAN:REFER_UNIVOCA    = '                      '
      BAN:NUEVO_CBU        = '               '
      BAN:CODIGO_RETORNO   ='   '
      ADD(BANCO_DEBITO)
      IF ERRORCODE() THEN MESSAGE(ERROR()).
  end
  RETURN ReturnValue

