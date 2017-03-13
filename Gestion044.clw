

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION044.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
EXPORT_PADRON_MINISTERIO PROCEDURE 

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
  GlobalErrors.SetProcedureName('EXPORT_PADRON_MINISTERIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:INSTITUCION.Open                                  ! File INSTITUCION used by this procedure, so make sure it's RelationManager is open
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:MINSALUD.Open                                     ! File MINSALUD used by this procedure, so make sure it's RelationManager is open
  Relate:NIVEL_FORMACION.Open                              ! File NIVEL_FORMACION used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_DOC.Open                                     ! File TIPO_DOC used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_TITULO.Open                                  ! File TIPO_TITULO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('EXPORT_PADRON_MINISTERIO',ProgressWindow)  ! Restore window settings from non-volatile store
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
  MINS:NRO = '1'
  MINS:IDCOLEGIO = 'PSICOLOGOS'
  ADD(MINSALUD)
  IF ERRORCODE() = 35 THEN MESSAGE(ERROR()).
  GLO:NRO_CUOTA = 0
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:INSTITUCION.Close
    Relate:LOCALIDAD.Close
    Relate:MINSALUD.Close
    Relate:NIVEL_FORMACION.Close
    Relate:SOCIOS.Close
    Relate:TIPO_DOC.Close
    Relate:TIPO_TITULO.Close
  END
  IF SELF.Opened
    INIMgr.Update('EXPORT_PADRON_MINISTERIO',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  MINS:NRO      =  '3'
  MINS:IDCOLEGIO =  'PSICOLOGOS'
  MINS:MATRICULA  =  GLO:NRO_CUOTA
  MINS:APELLIDO                 = ''
  MINS:NOMBRES                  = ''
  MINS:NOMBRE                   = ''
  MINS:N_DOCUMENTO              = ''
  MINS:SEXO                     = ''
  MINS:DIRECCION                = ''
  MINS:TELEFONO                 = ''
  MINS:FECHA_ALTA               = ''
  MINS:FECHA_NACIMIENTO         =  ''
  MINS:FECHA_BAJA               = ''
  MINS:DIRECCION_LABORAL        = ''
  MINS:TELEFONO_LABORAL         = ''
  MINS:BAJA                     = ''
  MINS:FECHA_EGRESO             = ''
  MINS:LUGAR_NACIMIENTO         = ''
  MINS:DESCRIPCION_MINISTERIO   =  ''
  MINS:IDCENTRO_SALUD           =  ''
  MINS:DESCRIPCION_CENTRO_SALUD =  ''
  MINS:TIPO_INSTITUCION         =  ''
  MINS:TIPO_DOC                 = ''
  MINS:LOCALIDAD                = ''
  MINS:INSTITUCION              =  ''
  MINS:TITULO                   =  ''
  MINS:NIVEL_FORMACION          =  ''
  MINS:GRADO                    =  ''
  MINS:TIPO_TITULO              =  ''
  ADD(MINSALUD)
  IF ERRORCODE() = 35 THEN MESSAGE(ERROR()).
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  MINS:NRO                      = '5'
  MINS:IDCOLEGIO                = 'PSIOCOLOGOS'
  MINS:MATRICULA                = SOC:MATRICULA
  MINS:APELLIDO                 = SOC:APELLIDO
  MINS:NOMBRES                  = SOC:NOMBRES
  MINS:NOMBRE                   = SOC:NOMBRE
  MINS:N_DOCUMENTO              = SOC:N_DOCUMENTO
  MINS:SEXO                     = SOC:SEXO
  MINS:DIRECCION                = SOC:DIRECCION
  MINS:TELEFONO                 = SOC:TELEFONO
  MINS:CELULAR                  = SOC:CELULAR
  MINS:EMAIL                    = SOC:EMAIL
  MINS:FECHA_ALTA               = FORMAT(SOC:FECHA_ALTA,@D6)
  MINS:FECHA_NACIMIENTO         = FORMAT(SOC:FECHA_NACIMIENTO,@D6)
  MINS:FECHA_BAJA               =  FORMAT(SOC:FECHA_BAJA,@D6)
  MINS:ANO                      = SOC:ANO
  MINS:DIRECCION_LABORAL        = SOC:DIRECCION_LABORAL
  MINS:TELEFONO_LABORAL         = SOC:TELEFONO_LABORAL
  MINS:BAJA                     = SOC:BAJA
  MINS:LIBRO                    = SOC:LIBRO
  MINS:FOLIO                    = SOC:FOLIO
  MINS:ACTA                     = SOC:ACTA
  MINS:PROVISORIO               = SOC:PROVISORIO
  MINS:FECHA_EGRESO             =  FORMAT(SOC:FECHA_EGRESO,@D6)
  MINS:BAJA_TEMPORARIA          = SOC:BAJA_TEMPORARIA
  MINS:FECHA_TITULO             =  FORMAT(SOC:FECHA_TITULO,@D6)
  MINS:LUGAR_NACIMIENTO         = SOC:LUGAR_NACIMIENTO
  MINS:DESCRIPCION_MINISTERIO   =  ''
  MINS:IDCENTRO_SALUD           =  ''
  MINS:DESCRIPCION_CENTRO_SALUD =  ''
  MINS:TIPO_INSTITUCION         =  SOC:TIPO_TITULO
  MINS:TIPO_TITULO              =  SOC:TIPO_TITULO
  !!BUSCA TIPO DOC
  TIP3:ID_TIPO_DOC = SOC:ID_TIPO_DOC
  ACCESS:TIPO_DOC.TRYFETCH(TIP3:PK_TIPO_DOC)
  MINS:TIPO_DOC                 = TIP3:DESCRIPCION
  !!bUSCA LOCALIDAD
  LOC:IDLOCALIDAD = SOC:IDLOCALIDAD
  ACCESS:LOCALIDAD.TRYFETCH(LOC:PK_LOCALIDAD)
  MINS:LOCALIDAD  = LOC:DESCRIPCION
  !! bUSCA iNSTITUCION
  INS2:IDINSTITUCION = SOC:IDINSTITUCION
  ACCESS:INSTITUCION.TRYFETCH(INS2:PK_INSTITUCION)
  MINS:INSTITUCION              =  INS2:NOMBRE
  !! BUSCA TIPO TITULO
  TIP6:IDTIPOTITULO = SOC:IDTIPOTITULO
  ACCESS:TIPO_TITULO.TRYFETCH(TIP6:PK_TIPO_TITULO)
  MINS:TITULO                   =  TIP6:DESCRIPCION
  NIV:IDNIVELFOMACION = TIP6:IDNIVELFORMACION
  ACCESS:NIVEL_FORMACION.TRYFETCH(NIV:PK_NIVEL_FORMACION)
  MINS:NIVEL_FORMACION          =  NIV:DESCRIPCION
  MINS:GRADO                    =  NIV:GRADO
  MINS:TIPO_TITULO              =  TIP6:DESCRIPCION
  !!!!!!!!!!!!!!!!!
  
  ADD(MINSALUD)
  IF ERRORCODE() = 35 THEN MESSAGE(ERROR()).
  GLO:NRO_CUOTA = GLO:NRO_CUOTA + 1
  
  
  
  
  RETURN ReturnValue

