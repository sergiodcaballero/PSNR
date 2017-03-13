

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION225.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION224.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
IMPORTAR_PROVEEDORES PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(EXP_PROVEEDORES)
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
  GlobalErrors.SetProcedureName('IMPORTAR_PROVEEDORES')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:EXP_CURSO_INSCRIPCION.Open                        ! File EXP_CURSO_INSCRIPCION used by this procedure, so make sure it's RelationManager is open
  Relate:EXP_INGRESOS.Open                                 ! File EXP_INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:EXP_PROVEEDORES.Open                              ! File EXP_PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPORTAR_PROVEEDORES',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:EXP_PROVEEDORES, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(EXP_PROVEEDORES,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:EXP_CURSO_INSCRIPCION.Close
    Relate:EXP_INGRESOS.Close
    Relate:EXP_PROVEEDORES.Close
    Relate:PROVEEDORES.Close
    Relate:RANKING.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPORTAR_PROVEEDORES',ProgressWindow)   ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  IMPORTAR_INSCRIPCION()
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  IF PRO21:IDPROVEEDOR >= 30000 THEN
      GLO:IDRECIBO = PRO21:IDPROVEEDOR
      PRO2:DESCRIPCION             =   PRO21:DESCRIPCION
      PRO2:DIRECCION               =   PRO21:DIRECCION
      PRO2:TELEFONO                =   PRO21:TELEFONO
      PRO2:EMAIL                   =   PRO21:EMAIL
      PRO2:CUIT                    =   PRO21:CUIT
      PRO2:FECHA                   =   PRO21:FECHA
      PRO2:HORA                    =   PRO21:HORA
      PRO2:IDUSUARIO               =   PRO21:IDUSUARIO
      PRO2:IDTIPOIVA               =   PRO21:IDTIPOIVA
      PRO2:FECHA_BAJA              =   PRO21:FECHA_BAJA
      PRO2:OBSERVACION             =   PRO21:OBSERVACION
      PRO2:IDTIPO_PROVEEDOR        =   3
      !!! SACA EL ID DE PROVEEDOR
      RANKING{PROP:SQL} = 'DELETE FROM RANKING'
      RANKING{PROP:SQL} = 'CALL SP_GEN_PROVEEDORES_ID'
      NEXT(RANKING)
      PRO2:IDPROVEEDOR = RAN:C1
      ACCESS:PROVEEDORES.INSERT()
  
      !!! GUARDO EL IDPROVEEDORE
      GLO:IDSOCIO = PRO2:IDPROVEEDOR
  
      !!! BUSCO EN INGRESOS TPS Y LO CAMBIO POR EL NUEVO
      ING1:IDPROVEEDOR =  GLO:IDRECIBO
      SET(ING1:FK_INGRESOS_PROVEEDOR,ING1:FK_INGRESOS_PROVEEDOR)
      LOOP
          IF ACCESS:EXP_INGRESOS.NEXT() THEN BREAK.
          IF ING1:IDPROVEEDOR <>  GLO:IDRECIBO THEN BREAK.
          ING1:IDPROVEEDOR =   GLO:IDSOCIO
          ACCESS:EXP_INGRESOS.UPDATE()
      END
      !!!!!!
      !!! BUSCO EN INSCRIPTOS  TPS Y LO CAMBIO POR EL NUEVO
      CURI1:ID_PROVEEDOR =  GLO:IDRECIBO
      SET(CURI1:FK_CURSO_INSCRIPCION_PROVEEDOR,CURI1:FK_CURSO_INSCRIPCION_PROVEEDOR)
      LOOP
          IF ACCESS:EXP_CURSO_INSCRIPCION.NEXT() THEN BREAK.
          IF CURI1:ID_PROVEEDOR <>  GLO:IDRECIBO THEN BREAK.
          CURI1:ID_PROVEEDOR =   GLO:IDSOCIO
          ACCESS:EXP_CURSO_INSCRIPCION.UPDATE()
      END
      !!!!!!
  END
  
  RETURN ReturnValue

