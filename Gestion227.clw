

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION227.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION218.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION229.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Certificados_Cursos
!!! </summary>
Certificados_Cursos PROCEDURE 

FDCB6::View:FileDropCombo VIEW(CURSO_MODULOS)
                       PROJECT(CUR2:ID_MODULO)
                       PROJECT(CUR2:DESCRIPCION)
                       PROJECT(CUR2:IDCURSO)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?CUR2:ID_MODULO
CUR2:ID_MODULO         LIKE(CUR2:ID_MODULO)           !List box control field - type derived from field
CUR2:DESCRIPCION       LIKE(CUR2:DESCRIPCION)         !List box control field - type derived from field
CUR2:IDCURSO           LIKE(CUR2:IDCURSO)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Imprimir Certificado de Módulos'),AT(,,260,160),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Certificados_Cursos'),SYSTEM
                       PROMPT('Seleccionar Curso:'),AT(9,10),USE(?CUR:IDCURSO:Prompt)
                       BUTTON('...'),AT(135,10,12,12),USE(?CallLookup)
                       ENTRY(@n-14),AT(73,11,60,10),USE(GLO:IDCURSO),REQ
                       COMBO(@n-7),AT(69,30,188,10),USE(CUR2:ID_MODULO),DROP(5),FORMAT('49L(2)|M~ID MODULO~@n-' & |
  '7@200L(2)|M~DESCRIPCION~@s50@56L(2)|M~IDCURSO~@n-5@'),FROM(Queue:FileDropCombo),IMM
                       STRING(@s50),AT(-5,58,265,10),USE(CUR2:DESCRIPCION),FONT('Arial',10,,FONT:bold,CHARSET:ANSI), |
  CENTER
                       PROMPT('Seleccionar Módulo:'),AT(2,30),USE(?Prompt2)
                       BUTTON('&Listar Inscriptos al Curso'),AT(64,79,111,14),USE(?Ok),LEFT,ICON(ICON:Print1),CURSOR('mano.cur'), |
  FLAT,MSG('Acepta Operacion'),TIP('Acepta Operacion')
                       BUTTON('&Cancelar'),AT(96,112,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB6                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Certificados_Cursos')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CUR:IDCURSO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CURSO.Open                                        ! File CURSO used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_MODULOS.Open                                ! File CURSO_MODULOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Certificados_Cursos',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB6.Init(CUR2:ID_MODULO,?CUR2:ID_MODULO,Queue:FileDropCombo.ViewPosition,FDCB6::View:FileDropCombo,Queue:FileDropCombo,Relate:CURSO_MODULOS,ThisWindow,GlobalErrors,0,1,0)
  FDCB6.Q &= Queue:FileDropCombo
  FDCB6.AddSortOrder(CUR2:FK_CURSO_MODULOS_CURSO)
  FDCB6.AppendOrder('CUR2:DESCRIPCION')
  FDCB6.AddRange(CUR2:IDCURSO,)
  FDCB6.AddField(CUR2:ID_MODULO,FDCB6.Q.CUR2:ID_MODULO) !List box control field - type derived from field
  FDCB6.AddField(CUR2:DESCRIPCION,FDCB6.Q.CUR2:DESCRIPCION) !List box control field - type derived from field
  FDCB6.AddField(CUR2:IDCURSO,FDCB6.Q.CUR2:IDCURSO) !List box control field - type derived from field
  ThisWindow.AddItem(FDCB6.WindowComponent)
  FDCB6.DefaultFill = 0
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CURSO.Close
    Relate:CURSO_MODULOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Certificados_Cursos',QuickWindow)       ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    SelectCURSO
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


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
    CASE ACCEPTED()
    OF ?Ok
      GLO:ID_MODULO = CUR2:ID_MODULO
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup
      ThisWindow.Update()
      CUR:IDCURSO = GLO:IDCURSO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GLO:IDCURSO = CUR:IDCURSO
      END
      ThisWindow.Reset(1)
    OF ?GLO:IDCURSO
      IF GLO:IDCURSO OR ?GLO:IDCURSO{PROP:Req}
        CUR:IDCURSO = GLO:IDCURSO
        IF Access:CURSO.TryFetch(CUR:PK_CURSO)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GLO:IDCURSO = CUR:IDCURSO
          ELSE
            SELECT(?GLO:IDCURSO)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?Ok
      ThisWindow.Update()
      START(Imprimir_Certificados_Modulos_Curso, 25000)
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      
      !!! Evolution Consulting FREE Templates Start!!!
       CASE KEYCODE()
         OF EnterKey
            CASE FOCUS(){Prop:Type}
              OF CREATE:Button
                 POST(EVENT:ACCEPTED,FOCUS())
              OF CREATE:text  
                 PRESSKEY(ShiftEnter)
              ELSE
                 IF FOCUS()<> ThisWindow.OkControl
                    PRESSKEY(TabKey)
                    RETURN(Level:Notify)
                 ELSE
                    POST(Event:Accepted,Self.OkControl)
                 END!IF
            END!CASE
       END!CASE
      
      !!! Evolution Consulting FREE Templates End!!!
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

