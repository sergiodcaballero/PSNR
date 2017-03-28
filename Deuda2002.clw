

   MEMBER('Deuda2.clw')                                    ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('DEUDA2002.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('DEUDA2001.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('DEUDA2003.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
deuda PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(DEUDA)
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
  GlobalErrors.SetProcedureName('deuda')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:BANCO.Open                                        ! File BANCO used by this procedure, so make sure it's RelationManager is open
  Relate:CONTROL_FACTURA.Open                              ! File CONTROL_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:DEUDA.Open                                        ! File DEUDA used by this procedure, so make sure it's RelationManager is open
  Relate:PAIS.Open                                         ! File PAIS used by this procedure, so make sure it's RelationManager is open
  Relate:PERIODO_FACTURA.Open                              ! File PERIODO_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_INSTITUCION.Open                             ! File TIPO_INSTITUCION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('deuda',ProgressWindow)                     ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:DEUDA, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(DEUDA,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:BANCO.Close
    Relate:CONTROL_FACTURA.Close
    Relate:DEUDA.Close
    Relate:PAIS.Close
    Relate:PERIODO_FACTURA.Close
    Relate:SOCIOS.Close
    Relate:TIPO_INSTITUCION.Close
  END
  IF SELF.Opened
    INIMgr.Update('deuda',ProgressWindow)                  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !! BUSCO NUERO SOCIO
  GLO:CC = DEU:CC
  SOC:MATRICULA = DEU:MAT
  GLO:MES = 1
  GLO:ANO = 2010
  GET(SOCIOS,SOC:IDX_SOCIOS_MATRICULA)
  IF ERRORCODE() <> 35 THEN
              Glo:IDSOCIO = SOC:IDSOCIO
              LOOP I# = 1 TO GLO:CC
                  GLO:ESTADO = 'SIN DETALLE'
                  GLO:PERIODO = GLO:ANO&(FORMAT(GLO:MES,@N02))
                  GLO:IDUSUARIO = 1
                  !! CARGA LA FACTURACION
                  FACTURAR_CABECERA2
                  FACTURAR_DETALLE2
               END !! LOOP
  ELSE
      MESSAGE('NO SE ECONTRO EL SOCIO EN LA TABLA SOCIOS')
  END
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

