

   MEMBER('Padron.clw')                                    ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('PADRON015.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('PADRON016.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('PADRON017.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('PADRON018.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('PADRON019.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('PADRON020.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('PADRON021.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('PADRON022.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('PADRON023.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('PADRON024.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion SOCIOS
!!! </summary>
UpdateSOCIOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::SOC:Record  LIKE(SOC:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion SOCIOS'),AT(,,358,192),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateSOCIOS'),SYSTEM
                       SHEET,AT(4,4,350,166),USE(?CurrentTab)
                         TAB('General'),USE(?Tab:1)
                           PROMPT('IDSOCIO:'),AT(8,30),USE(?SOC:IDSOCIO:Prompt),TRN
                           ENTRY(@n-14),AT(100,30,64,10),USE(SOC:IDSOCIO),REQ
                           PROMPT('MATRICULA:'),AT(8,44),USE(?SOC:MATRICULA:Prompt),TRN
                           ENTRY(@n-5),AT(100,44,40,10),USE(SOC:MATRICULA)
                           PROMPT('IDZONA:'),AT(8,58),USE(?SOC:IDZONA:Prompt),TRN
                           ENTRY(@n-14),AT(100,58,64,10),USE(SOC:IDZONA)
                           PROMPT('IDCOBERTURA:'),AT(8,72),USE(?SOC:IDCOBERTURA:Prompt),TRN
                           ENTRY(@n-14),AT(100,72,64,10),USE(SOC:IDCOBERTURA)
                           PROMPT('IDLOCALIDAD:'),AT(8,86),USE(?SOC:IDLOCALIDAD:Prompt),TRN
                           ENTRY(@n-14),AT(100,86,64,10),USE(SOC:IDLOCALIDAD)
                           PROMPT('IDUSUARIO:'),AT(8,100),USE(?SOC:IDUSUARIO:Prompt),TRN
                           ENTRY(@n-14),AT(100,100,64,10),USE(SOC:IDUSUARIO)
                           PROMPT('NOMBRE:'),AT(8,114),USE(?SOC:NOMBRE:Prompt),TRN
                           ENTRY(@s30),AT(100,114,124,10),USE(SOC:NOMBRE)
                           PROMPT('N DOCUMENTO:'),AT(8,128),USE(?SOC:N_DOCUMENTO:Prompt),TRN
                           ENTRY(@n-14),AT(100,128,64,10),USE(SOC:N_DOCUMENTO),REQ
                           PROMPT('DIRECCION:'),AT(8,142),USE(?SOC:DIRECCION:Prompt),TRN
                           ENTRY(@s100),AT(100,142,250,10),USE(SOC:DIRECCION)
                           PROMPT('FECHA ALTA:'),AT(8,156),USE(?SOC:FECHA_ALTA:Prompt),TRN
                           ENTRY(@d17),AT(100,156,104,10),USE(SOC:FECHA_ALTA)
                         END
                         TAB('General (cont.)'),USE(?Tab:2)
                           PROMPT('EMAIL:'),AT(8,30),USE(?SOC:EMAIL:Prompt),TRN
                           ENTRY(@s50),AT(100,30,204,10),USE(SOC:EMAIL)
                           PROMPT('FECHA NACIMIENTO:'),AT(8,44),USE(?SOC:FECHA_NACIMIENTO:Prompt),TRN
                           ENTRY(@d17),AT(100,44,104,10),USE(SOC:FECHA_NACIMIENTO)
                           PROMPT('NRO VIEJO:'),AT(8,58),USE(?SOC:NRO_VIEJO:Prompt),TRN
                           ENTRY(@n-14),AT(100,58,64,10),USE(SOC:NRO_VIEJO)
                           PROMPT('BENEF:'),AT(8,72),USE(?SOC:BENEF:Prompt),TRN
                           ENTRY(@n-14),AT(100,72,64,10),USE(SOC:BENEF)
                           PROMPT('FECHA BAJA:'),AT(8,86),USE(?SOC:FECHA_BAJA:Prompt),TRN
                           ENTRY(@d17),AT(100,86,104,10),USE(SOC:FECHA_BAJA)
                           PROMPT('OBSERVACION:'),AT(8,100),USE(?SOC:OBSERVACION:Prompt),TRN
                           ENTRY(@s100),AT(100,100,250,10),USE(SOC:OBSERVACION)
                           PROMPT('IDVENDEDOR:'),AT(8,114),USE(?SOC:IDVENDEDOR:Prompt),TRN
                           ENTRY(@n-14),AT(100,114,64,10),USE(SOC:IDVENDEDOR),REQ
                           PROMPT('INGRESO:'),AT(8,128),USE(?SOC:INGRESO:Prompt),TRN
                           ENTRY(@n-14),AT(100,128,64,10),USE(SOC:INGRESO)
                           PROMPT('DESCUENTO:'),AT(8,142),USE(?SOC:DESCUENTO:Prompt),TRN
                           ENTRY(@n-14),AT(100,142,64,10),USE(SOC:DESCUENTO)
                           PROMPT('MES:'),AT(8,156),USE(?SOC:MES:Prompt),TRN
                           ENTRY(@n-14),AT(100,156,64,10),USE(SOC:MES)
                         END
                         TAB('General (cont. 2)'),USE(?Tab:3)
                           PROMPT('ANO:'),AT(8,30),USE(?SOC:ANO:Prompt),TRN
                           ENTRY(@n-14),AT(100,30,64,10),USE(SOC:ANO)
                           PROMPT('PERIODO ALTA:'),AT(8,44),USE(?SOC:PERIODO_ALTA:Prompt),TRN
                           ENTRY(@n-14),AT(100,44,64,10),USE(SOC:PERIODO_ALTA)
                           PROMPT('SEXO:'),AT(8,58),USE(?SOC:SEXO:Prompt),TRN
                           COMBO(@s1),AT(100,58,100,10),USE(SOC:SEXO),DROP(10),FROM('M|F')
                           PROMPT('CANTIDAD:'),AT(8,72),USE(?SOC:CANTIDAD:Prompt),TRN
                           ENTRY(@n-14),AT(100,72,64,10),USE(SOC:CANTIDAD)
                           PROMPT('HORA ALTA:'),AT(8,86),USE(?SOC:HORA_ALTA:Prompt),TRN
                           ENTRY(@t7),AT(100,86,104,10),USE(SOC:HORA_ALTA)
                           PROMPT('TELEFONO:'),AT(8,100),USE(?SOC:TELEFONO:Prompt),TRN
                           ENTRY(@s30),AT(100,100,124,10),USE(SOC:TELEFONO)
                           PROMPT('DIRECCION LABORAL:'),AT(8,114),USE(?SOC:DIRECCION_LABORAL:Prompt),TRN
                           ENTRY(@s50),AT(100,114,204,10),USE(SOC:DIRECCION_LABORAL)
                           PROMPT('TELEFONO LABORAL:'),AT(8,128),USE(?SOC:TELEFONO_LABORAL:Prompt),TRN
                           ENTRY(@s30),AT(100,128,124,10),USE(SOC:TELEFONO_LABORAL)
                           PROMPT('FIN COBERTURA:'),AT(8,142),USE(?SOC:FIN_COBERTURA:Prompt),TRN
                           ENTRY(@d17),AT(100,142,104,10),USE(SOC:FIN_COBERTURA)
                           PROMPT('BAJA:'),AT(8,156),USE(?SOC:BAJA:Prompt),TRN
                           ENTRY(@s2),AT(100,156,40,10),USE(SOC:BAJA),REQ
                         END
                         TAB('General (cont. 3)'),USE(?Tab:4)
                           PROMPT('ID TIPO DOC:'),AT(8,30),USE(?SOC:ID_TIPO_DOC:Prompt),TRN
                           ENTRY(@n-14),AT(100,30,64,10),USE(SOC:ID_TIPO_DOC)
                           PROMPT('IDCIRCULO:'),AT(8,44),USE(?SOC:IDCIRCULO:Prompt),TRN
                           ENTRY(@n-14),AT(100,44,64,10),USE(SOC:IDCIRCULO)
                           PROMPT('LIBRO:'),AT(8,58),USE(?SOC:LIBRO:Prompt),TRN
                           ENTRY(@n-14),AT(100,58,64,10),USE(SOC:LIBRO)
                           PROMPT('FOLIO:'),AT(8,72),USE(?SOC:FOLIO:Prompt),TRN
                           ENTRY(@n-14),AT(100,72,64,10),USE(SOC:FOLIO)
                           PROMPT('ACTA:'),AT(8,86),USE(?SOC:ACTA:Prompt),TRN
                           ENTRY(@s20),AT(100,86,84,10),USE(SOC:ACTA)
                           PROMPT('PROVISORIO:'),AT(8,100),USE(?SOC:PROVISORIO:Prompt),TRN
                           ENTRY(@s1),AT(100,100,40,10),USE(SOC:PROVISORIO)
                           PROMPT('IDINSTITUCION:'),AT(8,114),USE(?SOC:IDINSTITUCION:Prompt),TRN
                           ENTRY(@n-14),AT(100,114,64,10),USE(SOC:IDINSTITUCION)
                           PROMPT('FECHA EGRESO:'),AT(8,128),USE(?SOC:FECHA_EGRESO:Prompt),TRN
                           ENTRY(@d17),AT(100,128,104,10),USE(SOC:FECHA_EGRESO),REQ
                           PROMPT('BAJA TEMPORARIA:'),AT(8,142),USE(?SOC:BAJA_TEMPORARIA:Prompt),TRN
                           COMBO(@s2),AT(100,142,100,10),USE(SOC:BAJA_TEMPORARIA),DROP(10),FROM('NO|SI')
                           PROMPT('OTRAS MATRICULAS:'),AT(8,156),USE(?SOC:OTRAS_MATRICULAS:Prompt),TRN
                           ENTRY(@s50),AT(100,156,204,10),USE(SOC:OTRAS_MATRICULAS)
                         END
                         TAB('General (cont. 4)'),USE(?Tab:5)
                           PROMPT('OTRAS CERTIFICACIONES:'),AT(8,30),USE(?SOC:OTRAS_CERTIFICACIONES:Prompt),TRN
                           ENTRY(@s50),AT(100,30,204,10),USE(SOC:OTRAS_CERTIFICACIONES)
                           PROMPT('FECHA TITULO:'),AT(8,44),USE(?SOC:FECHA_TITULO:Prompt),TRN
                           ENTRY(@d17),AT(100,44,104,10),USE(SOC:FECHA_TITULO)
                           PROMPT('LUGAR NACIMIENTO:'),AT(8,58),USE(?SOC:LUGAR_NACIMIENTO:Prompt),TRN
                           ENTRY(@s50),AT(100,58,204,10),USE(SOC:LUGAR_NACIMIENTO)
                           PROMPT('CELULAR:'),AT(8,72),USE(?SOC:CELULAR:Prompt),TRN
                           ENTRY(@s50),AT(100,72,204,10),USE(SOC:CELULAR)
                           PROMPT('IDTIPOTITULO:'),AT(8,86),USE(?SOC:IDTIPOTITULO:Prompt),TRN
                           ENTRY(@n-14),AT(100,86,64,10),USE(SOC:IDTIPOTITULO)
                           PROMPT('IDMINISTERIO:'),AT(8,100),USE(?SOC:IDMINISTERIO:Prompt),TRN
                           ENTRY(@n-14),AT(100,100,64,10),USE(SOC:IDMINISTERIO)
                           PROMPT('IDCENTRO_SALUD:'),AT(8,114),USE(?SOC:IDCS:Prompt),TRN
                           ENTRY(@s20),AT(100,114,84,10),USE(SOC:IDCS)
                           PROMPT('LUGAR TRABAJO:'),AT(8,128),USE(?SOC:LUGAR_TRABAJO:Prompt),TRN
                           ENTRY(@s50),AT(100,128,204,10),USE(SOC:LUGAR_TRABAJO)
                         END
                         TAB('General (cont. 5)'),USE(?Tab:6)
                           OPTION('TIPO TITULO'),AT(100,30,50,36),USE(SOC:TIPO_TITULO),BOXED,TRN
                             RADIO('PROFESIONAL'),AT(104,40),USE(?SOC:TIPO_TITULO:Radio1),TRN
                             RADIO('TECNICO'),AT(104,52),USE(?SOC:TIPO_TITULO:Radio2),TRN
                           END
                           PROMPT('IDPROVEEDOR:'),AT(8,70),USE(?SOC:IDPROVEEDOR:Prompt),TRN
                           ENTRY(@n-14),AT(100,70,64,10),USE(SOC:IDPROVEEDOR),RIGHT(1)
                           PROMPT('TIPOIVA:'),AT(8,84),USE(?SOC:TIPOIVA:Prompt),TRN
                           ENTRY(@n-14),AT(100,84,64,10),USE(SOC:TIPOIVA),RIGHT(1)
                           PROMPT('CUIT:'),AT(8,98),USE(?SOC:CUIT:Prompt),TRN
                           ENTRY(@P##-########-#P),AT(100,98,60,10),USE(SOC:CUIT)
                           PROMPT('IDBANCO:'),AT(8,112),USE(?SOC:IDBANCO:Prompt),TRN
                           ENTRY(@n-14),AT(100,112,64,10),USE(SOC:IDBANCO)
                           PROMPT('CBU:'),AT(8,126),USE(?SOC:CBU:Prompt),TRN
                           ENTRY(@s14),AT(100,126,60,10),USE(SOC:CBU)
                         END
                       END
                       BUTTON('&Aceptar'),AT(252,174,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(305,174,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Visualizando Registro'
  OF InsertRecord
    ActionMessage = 'Insertando Registro'
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateSOCIOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?SOC:IDSOCIO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(SOC:Record,History::SOC:Record)
  SELF.AddHistoryField(?SOC:IDSOCIO,1)
  SELF.AddHistoryField(?SOC:MATRICULA,2)
  SELF.AddHistoryField(?SOC:IDZONA,3)
  SELF.AddHistoryField(?SOC:IDCOBERTURA,4)
  SELF.AddHistoryField(?SOC:IDLOCALIDAD,5)
  SELF.AddHistoryField(?SOC:IDUSUARIO,6)
  SELF.AddHistoryField(?SOC:NOMBRE,7)
  SELF.AddHistoryField(?SOC:N_DOCUMENTO,8)
  SELF.AddHistoryField(?SOC:DIRECCION,9)
  SELF.AddHistoryField(?SOC:FECHA_ALTA,10)
  SELF.AddHistoryField(?SOC:EMAIL,11)
  SELF.AddHistoryField(?SOC:FECHA_NACIMIENTO,12)
  SELF.AddHistoryField(?SOC:NRO_VIEJO,13)
  SELF.AddHistoryField(?SOC:BENEF,14)
  SELF.AddHistoryField(?SOC:FECHA_BAJA,15)
  SELF.AddHistoryField(?SOC:OBSERVACION,16)
  SELF.AddHistoryField(?SOC:IDVENDEDOR,17)
  SELF.AddHistoryField(?SOC:INGRESO,18)
  SELF.AddHistoryField(?SOC:DESCUENTO,19)
  SELF.AddHistoryField(?SOC:MES,20)
  SELF.AddHistoryField(?SOC:ANO,21)
  SELF.AddHistoryField(?SOC:PERIODO_ALTA,22)
  SELF.AddHistoryField(?SOC:SEXO,23)
  SELF.AddHistoryField(?SOC:CANTIDAD,24)
  SELF.AddHistoryField(?SOC:HORA_ALTA,25)
  SELF.AddHistoryField(?SOC:TELEFONO,26)
  SELF.AddHistoryField(?SOC:DIRECCION_LABORAL,27)
  SELF.AddHistoryField(?SOC:TELEFONO_LABORAL,28)
  SELF.AddHistoryField(?SOC:FIN_COBERTURA,29)
  SELF.AddHistoryField(?SOC:BAJA,30)
  SELF.AddHistoryField(?SOC:ID_TIPO_DOC,31)
  SELF.AddHistoryField(?SOC:IDCIRCULO,32)
  SELF.AddHistoryField(?SOC:LIBRO,33)
  SELF.AddHistoryField(?SOC:FOLIO,34)
  SELF.AddHistoryField(?SOC:ACTA,35)
  SELF.AddHistoryField(?SOC:PROVISORIO,36)
  SELF.AddHistoryField(?SOC:IDINSTITUCION,37)
  SELF.AddHistoryField(?SOC:FECHA_EGRESO,38)
  SELF.AddHistoryField(?SOC:BAJA_TEMPORARIA,39)
  SELF.AddHistoryField(?SOC:OTRAS_MATRICULAS,40)
  SELF.AddHistoryField(?SOC:OTRAS_CERTIFICACIONES,41)
  SELF.AddHistoryField(?SOC:FECHA_TITULO,42)
  SELF.AddHistoryField(?SOC:LUGAR_NACIMIENTO,43)
  SELF.AddHistoryField(?SOC:CELULAR,44)
  SELF.AddHistoryField(?SOC:IDTIPOTITULO,45)
  SELF.AddHistoryField(?SOC:IDMINISTERIO,46)
  SELF.AddHistoryField(?SOC:IDCS,47)
  SELF.AddHistoryField(?SOC:LUGAR_TRABAJO,48)
  SELF.AddHistoryField(?SOC:TIPO_TITULO,49)
  SELF.AddHistoryField(?SOC:IDPROVEEDOR,50)
  SELF.AddHistoryField(?SOC:TIPOIVA,51)
  SELF.AddHistoryField(?SOC:CUIT,52)
  SELF.AddHistoryField(?SOC:IDBANCO,53)
  SELF.AddHistoryField(?SOC:CBU,54)
  SELF.AddUpdateFile(Access:SOCIOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:BANCO.Open                                        ! File BANCO used by this procedure, so make sure it's RelationManager is open
  Relate:CIRCULO.Open                                      ! File CIRCULO used by this procedure, so make sure it's RelationManager is open
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:INSTITUCION.Open                                  ! File INSTITUCION used by this procedure, so make sure it's RelationManager is open
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_DOC.Open                                     ! File TIPO_DOC used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_TITULO.Open                                  ! File TIPO_TITULO used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  Relate:ZONA_VIVIENDA.Open                                ! File ZONA_VIVIENDA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:SOCIOS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?SOC:IDSOCIO{PROP:ReadOnly} = True
    ?SOC:MATRICULA{PROP:ReadOnly} = True
    ?SOC:IDZONA{PROP:ReadOnly} = True
    ?SOC:IDCOBERTURA{PROP:ReadOnly} = True
    ?SOC:IDLOCALIDAD{PROP:ReadOnly} = True
    ?SOC:IDUSUARIO{PROP:ReadOnly} = True
    ?SOC:NOMBRE{PROP:ReadOnly} = True
    ?SOC:N_DOCUMENTO{PROP:ReadOnly} = True
    ?SOC:DIRECCION{PROP:ReadOnly} = True
    ?SOC:FECHA_ALTA{PROP:ReadOnly} = True
    ?SOC:EMAIL{PROP:ReadOnly} = True
    ?SOC:FECHA_NACIMIENTO{PROP:ReadOnly} = True
    ?SOC:NRO_VIEJO{PROP:ReadOnly} = True
    ?SOC:BENEF{PROP:ReadOnly} = True
    ?SOC:FECHA_BAJA{PROP:ReadOnly} = True
    ?SOC:OBSERVACION{PROP:ReadOnly} = True
    ?SOC:IDVENDEDOR{PROP:ReadOnly} = True
    ?SOC:INGRESO{PROP:ReadOnly} = True
    ?SOC:DESCUENTO{PROP:ReadOnly} = True
    ?SOC:MES{PROP:ReadOnly} = True
    ?SOC:ANO{PROP:ReadOnly} = True
    ?SOC:PERIODO_ALTA{PROP:ReadOnly} = True
    DISABLE(?SOC:SEXO)
    ?SOC:CANTIDAD{PROP:ReadOnly} = True
    ?SOC:HORA_ALTA{PROP:ReadOnly} = True
    ?SOC:TELEFONO{PROP:ReadOnly} = True
    ?SOC:DIRECCION_LABORAL{PROP:ReadOnly} = True
    ?SOC:TELEFONO_LABORAL{PROP:ReadOnly} = True
    ?SOC:FIN_COBERTURA{PROP:ReadOnly} = True
    ?SOC:BAJA{PROP:ReadOnly} = True
    ?SOC:ID_TIPO_DOC{PROP:ReadOnly} = True
    ?SOC:IDCIRCULO{PROP:ReadOnly} = True
    ?SOC:LIBRO{PROP:ReadOnly} = True
    ?SOC:FOLIO{PROP:ReadOnly} = True
    ?SOC:ACTA{PROP:ReadOnly} = True
    ?SOC:PROVISORIO{PROP:ReadOnly} = True
    ?SOC:IDINSTITUCION{PROP:ReadOnly} = True
    ?SOC:FECHA_EGRESO{PROP:ReadOnly} = True
    DISABLE(?SOC:BAJA_TEMPORARIA)
    ?SOC:OTRAS_MATRICULAS{PROP:ReadOnly} = True
    ?SOC:OTRAS_CERTIFICACIONES{PROP:ReadOnly} = True
    ?SOC:FECHA_TITULO{PROP:ReadOnly} = True
    ?SOC:LUGAR_NACIMIENTO{PROP:ReadOnly} = True
    ?SOC:CELULAR{PROP:ReadOnly} = True
    ?SOC:IDTIPOTITULO{PROP:ReadOnly} = True
    ?SOC:IDMINISTERIO{PROP:ReadOnly} = True
    ?SOC:IDCS{PROP:ReadOnly} = True
    ?SOC:LUGAR_TRABAJO{PROP:ReadOnly} = True
    ?SOC:IDPROVEEDOR{PROP:ReadOnly} = True
    ?SOC:TIPOIVA{PROP:ReadOnly} = True
    ?SOC:CUIT{PROP:ReadOnly} = True
    ?SOC:IDBANCO{PROP:ReadOnly} = True
    ?SOC:CBU{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateSOCIOS',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:BANCO.Close
    Relate:CIRCULO.Close
    Relate:COBERTURA.Close
    Relate:INSTITUCION.Close
    Relate:LOCALIDAD.Close
    Relate:SOCIOS.Close
    Relate:TIPO_DOC.Close
    Relate:TIPO_TITULO.Close
    Relate:USUARIO.Close
    Relate:ZONA_VIVIENDA.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateSOCIOS',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    EXECUTE Number
      SelectZONA_VIVIENDA
      SelectCOBERTURA
      SelectLOCALIDAD
      SelectUSUARIO
      SelectTIPO_DOC
      SelectCIRCULO
      SelectINSTITUCION
      SelectTIPO_TITULO
      SelectBANCO
    END
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SOC:IDZONA
      ZON:IDZONA = SOC:IDZONA
      IF Access:ZONA_VIVIENDA.TryFetch(ZON:PK_ZONA_VIVIENDA)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          SOC:IDZONA = ZON:IDZONA
        ELSE
          SELECT(?SOC:IDZONA)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOS.TryValidateField(3)                 ! Attempt to validate SOC:IDZONA in SOCIOS
        SELECT(?SOC:IDZONA)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:IDZONA
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:IDZONA{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?SOC:IDCOBERTURA
      COB:IDCOBERTURA = SOC:IDCOBERTURA
      IF Access:COBERTURA.TryFetch(COB:PK_COBERTURA)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          SOC:IDCOBERTURA = COB:IDCOBERTURA
        ELSE
          SELECT(?SOC:IDCOBERTURA)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOS.TryValidateField(4)                 ! Attempt to validate SOC:IDCOBERTURA in SOCIOS
        SELECT(?SOC:IDCOBERTURA)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:IDCOBERTURA
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:IDCOBERTURA{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?SOC:IDLOCALIDAD
      LOC:IDLOCALIDAD = SOC:IDLOCALIDAD
      IF Access:LOCALIDAD.TryFetch(LOC:PK_LOCALIDAD)
        IF SELF.Run(3,SelectRecord) = RequestCompleted
          SOC:IDLOCALIDAD = LOC:IDLOCALIDAD
        ELSE
          SELECT(?SOC:IDLOCALIDAD)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOS.TryValidateField(5)                 ! Attempt to validate SOC:IDLOCALIDAD in SOCIOS
        SELECT(?SOC:IDLOCALIDAD)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:IDLOCALIDAD
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:IDLOCALIDAD{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?SOC:IDUSUARIO
      USU:IDUSUARIO = SOC:IDUSUARIO
      IF Access:USUARIO.TryFetch(USU:PK_USUARIO)
        IF SELF.Run(4,SelectRecord) = RequestCompleted
          SOC:IDUSUARIO = USU:IDUSUARIO
        ELSE
          SELECT(?SOC:IDUSUARIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOS.TryValidateField(6)                 ! Attempt to validate SOC:IDUSUARIO in SOCIOS
        SELECT(?SOC:IDUSUARIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:IDUSUARIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:IDUSUARIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?SOC:ID_TIPO_DOC
      TIP3:ID_TIPO_DOC = SOC:ID_TIPO_DOC
      IF Access:TIPO_DOC.TryFetch(TIP3:PK_TIPO_DOC)
        IF SELF.Run(5,SelectRecord) = RequestCompleted
          SOC:ID_TIPO_DOC = TIP3:ID_TIPO_DOC
        ELSE
          SELECT(?SOC:ID_TIPO_DOC)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOS.TryValidateField(31)                ! Attempt to validate SOC:ID_TIPO_DOC in SOCIOS
        SELECT(?SOC:ID_TIPO_DOC)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:ID_TIPO_DOC
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:ID_TIPO_DOC{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?SOC:IDCIRCULO
      CIR:IDCIRCULO = SOC:IDCIRCULO
      IF Access:CIRCULO.TryFetch(CIR:PK_CIRCULO)
        IF SELF.Run(6,SelectRecord) = RequestCompleted
          SOC:IDCIRCULO = CIR:IDCIRCULO
        ELSE
          SELECT(?SOC:IDCIRCULO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOS.TryValidateField(32)                ! Attempt to validate SOC:IDCIRCULO in SOCIOS
        SELECT(?SOC:IDCIRCULO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:IDCIRCULO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:IDCIRCULO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?SOC:IDINSTITUCION
      INS2:IDINSTITUCION = SOC:IDINSTITUCION
      IF Access:INSTITUCION.TryFetch(INS2:PK_INSTITUCION)
        IF SELF.Run(7,SelectRecord) = RequestCompleted
          SOC:IDINSTITUCION = INS2:IDINSTITUCION
        ELSE
          SELECT(?SOC:IDINSTITUCION)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOS.TryValidateField(37)                ! Attempt to validate SOC:IDINSTITUCION in SOCIOS
        SELECT(?SOC:IDINSTITUCION)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:IDINSTITUCION
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:IDINSTITUCION{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?SOC:IDTIPOTITULO
      TIP6:IDTIPOTITULO = SOC:IDTIPOTITULO
      IF Access:TIPO_TITULO.TryFetch(TIP6:PK_TIPO_TITULO)
        IF SELF.Run(8,SelectRecord) = RequestCompleted
          SOC:IDTIPOTITULO = TIP6:IDTIPOTITULO
        ELSE
          SELECT(?SOC:IDTIPOTITULO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOS.TryValidateField(45)                ! Attempt to validate SOC:IDTIPOTITULO in SOCIOS
        SELECT(?SOC:IDTIPOTITULO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:IDTIPOTITULO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:IDTIPOTITULO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?SOC:IDBANCO
      BAN2:IDBANCO = SOC:IDBANCO
      IF Access:BANCO.TryFetch(BAN2:PK_BANCO)
        IF SELF.Run(9,SelectRecord) = RequestCompleted
          SOC:IDBANCO = BAN2:IDBANCO
        ELSE
          SELECT(?SOC:IDBANCO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOS.TryValidateField(53)                ! Attempt to validate SOC:IDBANCO in SOCIOS
        SELECT(?SOC:IDBANCO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:IDBANCO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:IDBANCO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

